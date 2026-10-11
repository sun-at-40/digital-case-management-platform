<?php
// Evidence & crime-scene photo module (shared by admin, officer and cid).
require_once __DIR__ . '/layout.php';

const EVIDENCE_CATEGORIES = ['Crime Scene', 'Weapon / Object', 'Injury / Victim', 'Document', 'Other'];

function evidence_ensure_table($dbcon)
{
    mysqli_query($dbcon, "CREATE TABLE IF NOT EXISTS case_evidence (
        id INT AUTO_INCREMENT PRIMARY KEY,
        case_id VARCHAR(20) NOT NULL,
        filename VARCHAR(64) NOT NULL,
        original_name VARCHAR(255) NOT NULL,
        category VARCHAR(30) NOT NULL DEFAULT 'Crime Scene',
        caption VARCHAR(255) NOT NULL DEFAULT '',
        uploaded_by VARCHAR(30) NOT NULL,
        uploaded_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
        INDEX (case_id)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");
}

function evidence_csrf()
{
    if (empty($_SESSION['csrf'])) {
        $_SESSION['csrf'] = bin2hex(random_bytes(32));
    }
    return $_SESSION['csrf'];
}

// Renders the evidence gallery + upload form for one case. Requires an active session.
function evidence_panel($dbcon, $caseId, $role, $staffid, $status = '')
{
    evidence_ensure_table($dbcon);
    $stmt = mysqli_prepare($dbcon, "SELECT e.*, CONCAT(u.surname, ' ', u.othernames) AS uploader
        FROM case_evidence e LEFT JOIN userlogin u ON u.staffid = e.uploaded_by
        WHERE e.case_id = ? ORDER BY e.uploaded_at DESC");
    mysqli_stmt_bind_param($stmt, 's', $caseId);
    mysqli_stmt_execute($stmt);
    $items = mysqli_fetch_all(mysqli_stmt_get_result($stmt), MYSQLI_ASSOC);
    $token = evidence_csrf();
    ?>
    <div class="panel panel-success" id="evidence">
        <div class="panel-heading">
            <h3 class="panel-title"><span class="glyphicon glyphicon-camera"></span> Evidence &amp; Crime Scene Photos
                <span class="pill info"><?php echo count($items); ?></span></h3>
        </div>
        <div class="panel-body">
            <?php if (!empty($_SESSION['evidence_flash'])) { ?>
                <div class="alert alert-info"><?php echo ui_h($_SESSION['evidence_flash']); unset($_SESSION['evidence_flash']); ?></div>
            <?php } ?>

            <form class="dropzone" action="../shared/evidence_action.php" method="post" enctype="multipart/form-data">
                <input type="hidden" name="action" value="upload">
                <input type="hidden" name="csrf" value="<?php echo ui_h($token); ?>">
                <input type="hidden" name="case_id" value="<?php echo ui_h($caseId); ?>">
                <input type="hidden" name="status" value="<?php echo ui_h($status); ?>">
                <div class="row">
                    <div class="col-sm-4"><input type="file" name="photos[]" class="form-control" accept="image/jpeg,image/png,image/webp,image/gif" multiple required></div>
                    <div class="col-sm-3">
                        <select name="category" class="form-control">
                            <?php foreach (EVIDENCE_CATEGORIES as $c) { echo '<option>' . ui_h($c) . '</option>'; } ?>
                        </select>
                    </div>
                    <div class="col-sm-3"><input type="text" name="caption" maxlength="255" class="form-control" placeholder="Caption (optional)"></div>
                    <div class="col-sm-2"><button class="btn btn-primary btn-block" type="submit"><span class="glyphicon glyphicon-upload"></span> Upload</button></div>
                </div>
                <small>JPG, PNG, WEBP or GIF &middot; up to 5 MB each</small>
            </form>

            <?php if (!$items) { ?>
                <p class="text-muted text-center">No photos uploaded for this case yet.</p>
            <?php } else { ?>
                <div class="evidence-grid">
                    <?php foreach ($items as $it) {
                        $url = '../shared/evidence_file.php?id=' . (int) $it['id'];
                        $canDelete = ($role === 'Admin' || $it['uploaded_by'] === $staffid); ?>
                        <div class="evidence-item">
                            <a class="thumb" href="<?php echo $url; ?>" data-full="<?php echo $url; ?>" style="background-image:url('<?php echo $url; ?>')"></a>
                            <div class="meta">
                                <strong><?php echo ui_h($it['category']); ?></strong>
                                <?php echo ui_h($it['caption']); ?><br>
                                <?php echo ui_h(trim($it['uploader'] ?? '') ?: $it['uploaded_by']); ?> &middot; <?php echo ui_h(date('d M Y, H:i', strtotime($it['uploaded_at']))); ?>
                                <?php if ($canDelete) { ?>
                                    <form action="../shared/evidence_action.php" method="post" style="margin-top:6px" onsubmit="return confirm('Delete this photo?');">
                                        <input type="hidden" name="action" value="delete">
                                        <input type="hidden" name="csrf" value="<?php echo ui_h($token); ?>">
                                        <input type="hidden" name="id" value="<?php echo (int) $it['id']; ?>">
                                        <input type="hidden" name="case_id" value="<?php echo ui_h($caseId); ?>">
                                        <input type="hidden" name="status" value="<?php echo ui_h($status); ?>">
                                        <button class="btn btn-danger btn-xs" type="submit"><span class="glyphicon glyphicon-trash"></span> Delete</button>
                                    </form>
                                <?php } ?>
                            </div>
                        </div>
                    <?php } ?>
                </div>
            <?php } ?>
        </div>
    </div>
    <div class="lightbox" id="lightbox"><img alt="Evidence photo"></div>
    <script>
    (function () {
        var box = document.getElementById('lightbox');
        document.querySelectorAll('.evidence-item .thumb').forEach(function (a) {
            a.addEventListener('click', function (e) {
                e.preventDefault();
                box.querySelector('img').src = a.dataset.full;
                box.classList.add('open');
            });
        });
        box.addEventListener('click', function () { box.classList.remove('open'); });
    })();
    </script>
    <?php
}
