<?php
// Case resolution (how a completed case was solved) and accused details with photo.
require_once __DIR__ . '/evidence.php';

function resolution_ensure_tables($dbcon)
{
    mysqli_query($dbcon, "CREATE TABLE IF NOT EXISTS case_resolution (
        case_id VARCHAR(20) NOT NULL PRIMARY KEY,
        remarks TEXT NOT NULL,
        updated_by VARCHAR(30) NOT NULL,
        updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");
    mysqli_query($dbcon, "CREATE TABLE IF NOT EXISTS case_accused (
        id INT AUTO_INCREMENT PRIMARY KEY,
        case_id VARCHAR(20) NOT NULL,
        name VARCHAR(100) NOT NULL,
        alias_name VARCHAR(100) NOT NULL DEFAULT '',
        age INT NULL,
        gender VARCHAR(10) NOT NULL DEFAULT '',
        address VARCHAR(255) NOT NULL DEFAULT '',
        role_in_crime VARCHAR(255) NOT NULL DEFAULT '',
        photo VARCHAR(64) NOT NULL DEFAULT '',
        added_by VARCHAR(30) NOT NULL,
        added_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
        INDEX (case_id)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");
}

// Whether this user may edit the resolution of the given case.
function resolution_can_edit($dbcon, $caseId, $role, $staffid)
{
    if ($role === 'Admin') {
        return true;
    }
    if ($role !== 'CID') {
        return false;
    }
    $stmt = mysqli_prepare($dbcon, "SELECT 1 FROM investigation WHERE case_id = ? AND investigator = ? LIMIT 1");
    mysqli_stmt_bind_param($stmt, 'ss', $caseId, $staffid);
    mysqli_stmt_execute($stmt);
    return mysqli_stmt_get_result($stmt)->num_rows > 0;
}

function resolution_panel($dbcon, $caseId, $role, $staffid, $status = '')
{
    $stmt = mysqli_prepare($dbcon, "SELECT status FROM case_table WHERE case_id = ? LIMIT 1");
    mysqli_stmt_bind_param($stmt, 's', $caseId);
    mysqli_stmt_execute($stmt);
    $case = mysqli_fetch_assoc(mysqli_stmt_get_result($stmt));
    if (!$case || $case['status'] !== 'Completed') {
        return;
    }

    resolution_ensure_tables($dbcon);
    $stmt = mysqli_prepare($dbcon, "SELECT r.*, CONCAT(u.surname, ' ', u.othernames) AS editor
        FROM case_resolution r LEFT JOIN userlogin u ON u.staffid = r.updated_by WHERE r.case_id = ?");
    mysqli_stmt_bind_param($stmt, 's', $caseId);
    mysqli_stmt_execute($stmt);
    $res = mysqli_fetch_assoc(mysqli_stmt_get_result($stmt));

    $stmt = mysqli_prepare($dbcon, "SELECT * FROM case_accused WHERE case_id = ? ORDER BY id");
    mysqli_stmt_bind_param($stmt, 's', $caseId);
    mysqli_stmt_execute($stmt);
    $accused = mysqli_fetch_all(mysqli_stmt_get_result($stmt), MYSQLI_ASSOC);

    $canEdit = resolution_can_edit($dbcon, $caseId, $role, $staffid);
    $token = evidence_csrf();
    $hidden = '<input type="hidden" name="csrf" value="' . ui_h($token) . '">'
        . '<input type="hidden" name="case_id" value="' . ui_h($caseId) . '">'
        . '<input type="hidden" name="status" value="' . ui_h($status) . '">';
    ?>
    <div class="panel panel-success" id="resolution">
        <div class="panel-heading">
            <h3 class="panel-title"><span class="glyphicon glyphicon-ok-sign"></span> Case Resolution &amp; Accused Details
                <span class="pill ok">Solved</span></h3>
        </div>
        <div class="panel-body">
            <?php if (!empty($_SESSION['resolution_flash'])) { ?>
                <div class="alert alert-info"><?php echo ui_h($_SESSION['resolution_flash']); unset($_SESSION['resolution_flash']); ?></div>
            <?php } ?>

            <h4>How the case was solved</h4>
            <?php if ($res) { ?>
                <p style="white-space:pre-wrap"><?php echo ui_h($res['remarks']); ?></p>
                <small class="text-muted">Updated by <?php echo ui_h(trim($res['editor'] ?? '') ?: $res['updated_by']); ?>
                    &middot; <?php echo ui_h(date('d M Y, H:i', strtotime($res['updated_at']))); ?></small>
            <?php } else { ?>
                <p class="text-muted">No resolution remarks recorded yet.</p>
            <?php } ?>

            <?php if ($canEdit) { ?>
                <form action="../shared/resolution_action.php" method="post" style="margin-top:10px">
                    <input type="hidden" name="action" value="remarks">
                    <?php echo $hidden; ?>
                    <textarea name="remarks" class="form-control" rows="4" maxlength="5000" required
                        placeholder="Describe how the case was solved (evidence, witnesses, arrest, recovery...)"><?php echo ui_h($res['remarks'] ?? ''); ?></textarea>
                    <button class="btn btn-primary" type="submit" style="margin-top:8px"><span class="glyphicon glyphicon-floppy-disk"></span> Save remarks</button>
                </form>
            <?php } ?>

            <hr>
            <h4>Accused <span class="pill info"><?php echo count($accused); ?></span></h4>
            <?php if ($canEdit) { ?>
                <form class="dropzone" action="../shared/resolution_action.php" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="action" value="add_accused">
                    <?php echo $hidden; ?>
                    <div class="row">
                        <div class="col-sm-3"><input type="text" name="name" class="form-control" maxlength="100" placeholder="Full name *" required></div>
                        <div class="col-sm-3"><input type="text" name="alias_name" class="form-control" maxlength="100" placeholder="Alias (optional)"></div>
                        <div class="col-sm-2"><input type="number" name="age" class="form-control" min="1" max="120" placeholder="Age"></div>
                        <div class="col-sm-2">
                            <select name="gender" class="form-control"><option>Male</option><option>Female</option><option>Other</option></select>
                        </div>
                    </div>
                    <div class="row" style="margin-top:8px">
                        <div class="col-sm-4"><input type="text" name="address" class="form-control" maxlength="255" placeholder="Address"></div>
                        <div class="col-sm-4"><input type="text" name="role_in_crime" class="form-control" maxlength="255" placeholder="Role / charges"></div>
                        <div class="col-sm-4"><input type="file" name="photo" class="form-control" accept="image/jpeg,image/png,image/webp,image/gif"></div>
                    </div>
                    <button class="btn btn-primary" type="submit" style="margin-top:8px"><span class="glyphicon glyphicon-plus"></span> Add accused</button>
                    <small>&nbsp; Photo: JPG, PNG, WEBP or GIF &middot; up to 5 MB</small>
                </form>
            <?php } ?>

            <?php if (!$accused) { ?>
                <p class="text-muted text-center">No accused recorded for this case.</p>
            <?php } else { ?>
                <div class="evidence-grid">
                    <?php foreach ($accused as $a) {
                        $url = '../shared/resolution_file.php?id=' . (int) $a['id']; ?>
                        <div class="evidence-item">
                            <?php if ($a['photo'] !== '') { ?>
                                <a class="thumb" href="<?php echo $url; ?>" data-full="<?php echo $url; ?>" style="background-image:url('<?php echo $url; ?>')"></a>
                            <?php } else { ?>
                                <div class="thumb" style="display:flex;align-items:center;justify-content:center;color:#94a3b8">No photo</div>
                            <?php } ?>
                            <div class="meta">
                                <strong><?php echo ui_h($a['name']); ?></strong>
                                <?php echo $a['alias_name'] !== '' ? '(a) ' . ui_h($a['alias_name']) : ''; ?><br>
                                <?php echo ui_h(trim(($a['age'] ? $a['age'] . ' yrs, ' : '') . $a['gender'], ', ')); ?><br>
                                <?php echo ui_h($a['address']); ?><br>
                                <em><?php echo ui_h($a['role_in_crime']); ?></em>
                                <?php if ($canEdit) { ?>
                                    <form action="../shared/resolution_action.php" method="post" style="margin-top:6px" onsubmit="return confirm('Remove this accused record?');">
                                        <input type="hidden" name="action" value="delete_accused">
                                        <input type="hidden" name="id" value="<?php echo (int) $a['id']; ?>">
                                        <?php echo $hidden; ?>
                                        <button class="btn btn-danger btn-xs" type="submit"><span class="glyphicon glyphicon-trash"></span> Remove</button>
                                    </form>
                                <?php } ?>
                            </div>
                        </div>
                    <?php } ?>
                </div>
            <?php } ?>
        </div>
    </div>
    <script>
    (function () {
        var box = document.getElementById('lightbox');
        if (!box) { return; }
        document.querySelectorAll('#resolution .thumb[data-full]').forEach(function (a) {
            a.addEventListener('click', function (e) {
                e.preventDefault();
                box.querySelector('img').src = a.dataset.full;
                box.classList.add('open');
            });
        });
    })();
    </script>
    <?php
}
