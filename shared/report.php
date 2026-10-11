<?php
// CID officer performance report (Admin and DGP Office).
require_once __DIR__ . '/layout.php';

// Returns [from, to] as validated Y-m-d strings (or '' when not set).
function report_range()
{
    $ok = function ($v) {
        $d = DateTime::createFromFormat('Y-m-d', (string) $v);
        return ($d && $d->format('Y-m-d') === $v) ? $v : '';
    };
    return [$ok($_GET['from'] ?? ''), $ok($_GET['to'] ?? '')];
}

function report_data($dbcon, $from, $to)
{
    $cond = '';
    $types = '';
    $args = [];
    if ($from !== '') { $cond .= ' AND c.date_added >= ?'; $types .= 's'; $args[] = $from . ' 00:00:00'; }
    if ($to !== '') { $cond .= ' AND c.date_added <= ?'; $types .= 's'; $args[] = $to . ' 23:59:59'; }

    $sql = "SELECT u.staffid, CONCAT(u.surname, ' ', u.othernames) AS name,
            COUNT(c.caseid) AS assigned,
            COALESCE(SUM(c.status = 'Completed'), 0) AS solved,
            COALESCE(SUM(c.status <> 'Completed'), 0) AS pending,
            AVG(CASE WHEN c.status = 'Completed' AND c.complete_date >= DATE(c.date_added)
                     THEN DATEDIFF(c.complete_date, c.date_added) END) AS avg_days
        FROM userlogin u
        LEFT JOIN case_table c ON c.cid = u.staffid $cond
        WHERE u.status = 'CID'
        GROUP BY u.staffid, u.surname, u.othernames";
    $stmt = mysqli_prepare($dbcon, $sql);
    if ($args) {
        mysqli_stmt_bind_param($stmt, $types, ...$args);
    }
    mysqli_stmt_execute($stmt);
    $rows = mysqli_fetch_all(mysqli_stmt_get_result($stmt), MYSQLI_ASSOC);
    foreach ($rows as &$r) {
        $r['rate'] = $r['assigned'] > 0 ? round($r['solved'] / $r['assigned'] * 100, 1) : 0;
    }
    unset($r);
    usort($rows, function ($a, $b) {
        return [$b['rate'], $b['solved']] <=> [$a['rate'], $a['solved']];
    });
    return $rows;
}

function report_render($dbcon)
{
    list($from, $to) = report_range();
    $rows = report_data($dbcon, $from, $to);
    $active = array_filter($rows, function ($r) { return $r['assigned'] > 0; });

    $assigned = array_sum(array_column($rows, 'assigned'));
    $solved = array_sum(array_column($rows, 'solved'));
    $pending = array_sum(array_column($rows, 'pending'));
    $rate = $assigned ? round($solved / $assigned * 100, 1) : 0;
    $days = array_filter(array_column($rows, 'avg_days'), 'strlen');
    $avgDays = $days ? round(array_sum($days) / count($days)) : 0;
    $qs = http_build_query(['from' => $from, 'to' => $to]);
    ?>
    <div class="col-md-12">
        <div class="hero"><h2>CID Performance Report</h2>
            <p>Cases handled, solved and pending by each CID officer, ranked by solve rate.</p></div>

        <form class="form-inline" method="get" style="margin-bottom:18px">
            <label>From <input type="date" name="from" class="form-control" value="<?php echo ui_h($from); ?>"></label>
            <label>To <input type="date" name="to" class="form-control" value="<?php echo ui_h($to); ?>"></label>
            <button class="btn btn-primary" type="submit"><span class="glyphicon glyphicon-filter"></span> Apply</button>
            <a class="btn btn-ghost" href="reports.php">Reset</a>
            <a class="btn btn-ghost" href="../shared/report_export.php?<?php echo ui_h($qs); ?>"><span class="glyphicon glyphicon-download-alt"></span> Export CSV</a>
            <a class="btn btn-ghost" href="#" onclick="window.print();return false;"><span class="glyphicon glyphicon-print"></span> Print</a>
            <small class="text-muted">&nbsp;Filters by the date the case was registered.</small>
        </form>

        <div class="stat-grid">
            <?php foreach ([
                ['CID officers', count($rows), 'On the roster', '#4f46e5'],
                ['Cases assigned', $assigned, 'To CID officers', '#0891b2'],
                ['Solved', $solved, $rate . '% overall solve rate', '#059669'],
                ['Pending', $pending, 'Still under investigation', '#d97706'],
                ['Avg. days to solve', $avgDays, 'Registration to closure', '#7c3aed'],
            ] as $s) { ?>
                <div class="stat" style="--c: <?php echo $s[3]; ?>">
                    <div class="label"><?php echo ui_h($s[0]); ?></div>
                    <div class="value"><?php echo (int) $s[1]; ?></div>
                    <div class="hint"><?php echo ui_h($s[2]); ?></div>
                </div>
            <?php } ?>
        </div>

        <div class="chart-grid">
            <div class="chart-card" style="grid-column: span 2"><h4>Solved vs pending by officer</h4><canvas id="chOfficers"></canvas></div>
            <div class="chart-card"><h4>Solve rate (%)</h4><canvas id="chRate"></canvas></div>
        </div>

        <div class="panel panel-success">
            <div class="panel-heading"><h3 class="panel-title"><span class="glyphicon glyphicon-stats"></span> Officer efficiency ranking</h3></div>
            <div class="panel-body">
                <div class="table-responsive">
                    <table class="table table-hover">
                        <thead><tr><th>#</th><th>Officer</th><th>Staff ID</th><th>Assigned</th><th>Solved</th><th>Pending</th><th style="min-width:180px">Solve rate</th><th>Avg. days to solve</th></tr></thead>
                        <tbody>
                        <?php foreach ($rows as $i => $r) {
                            $cls = $r['rate'] >= 80 ? 'ok' : ($r['rate'] >= 65 ? 'info' : 'warn'); ?>
                            <tr>
                                <td><?php echo $i + 1; ?></td>
                                <td><strong><?php echo ui_h($r['name']); ?></strong></td>
                                <td><?php echo ui_h($r['staffid']); ?></td>
                                <td><?php echo (int) $r['assigned']; ?></td>
                                <td><?php echo (int) $r['solved']; ?></td>
                                <td><?php echo (int) $r['pending']; ?></td>
                                <td>
                                    <div class="progress" style="margin:0 0 3px;height:8px"><div class="progress-bar progress-bar-success" style="width:<?php echo (float) $r['rate']; ?>%"></div></div>
                                    <span class="pill <?php echo $cls; ?>"><?php echo $r['rate']; ?>%</span>
                                </td>
                                <td><?php echo $r['avg_days'] !== null ? round($r['avg_days']) . ' days' : '&ndash;'; ?></td>
                            </tr>
                        <?php } ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <script src="../assets/js/chart.umd.min.js"></script>
    <script>
    (function () {
        Chart.defaults.font.family = 'Inter, "Segoe UI", system-ui, sans-serif';
        var d = <?php echo json_encode(array_values($active)); ?>;
        var labels = d.map(function (r) { return r.name; });
        new Chart(document.getElementById('chOfficers'), {
            type: 'bar',
            data: { labels: labels, datasets: [
                { label: 'Solved', data: d.map(function (r) { return +r.solved; }), backgroundColor: '#059669', borderRadius: 6 },
                { label: 'Pending', data: d.map(function (r) { return +r.pending; }), backgroundColor: '#d97706', borderRadius: 6 }] },
            options: { scales: { x: { stacked: true }, y: { stacked: true, beginAtZero: true, ticks: { precision: 0 } } }, plugins: { legend: { position: 'bottom' } } }
        });
        new Chart(document.getElementById('chRate'), {
            type: 'bar',
            data: { labels: labels, datasets: [{ data: d.map(function (r) { return +r.rate; }), backgroundColor: '#4f46e5', borderRadius: 6 }] },
            options: { indexAxis: 'y', plugins: { legend: { display: false } }, scales: { x: { beginAtZero: true, max: 100 } } }
        });
    })();
    </script>
    <?php
}
