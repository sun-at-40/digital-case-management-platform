<?php
// Analytics dashboard (stat cards + charts). Pass $cid to scope to one CID officer's cases.
require_once __DIR__ . '/layout.php';

function dashboard_query($dbcon, $sql, $cid)
{
    $stmt = mysqli_prepare($dbcon, $sql);
    if ($cid !== null) {
        mysqli_stmt_bind_param($stmt, 's', $cid);
    }
    mysqli_stmt_execute($stmt);
    return mysqli_fetch_all(mysqli_stmt_get_result($stmt), MYSQLI_ASSOC);
}

function dashboard_render($dbcon, $title, $subtitle, $cid = null)
{
    $where = $cid !== null ? 'WHERE cid = ?' : '';

    $t = dashboard_query($dbcon, "SELECT COUNT(*) total,
        SUM(status = 'Completed') done,
        SUM(status NOT IN ('', 'Not Yet', 'Completed')) active,
        SUM(cid IN ('', 'Not Yet')) unassigned
        FROM case_table $where", $cid)[0];

    $byType = dashboard_query($dbcon, "SELECT case_type label, COUNT(*) n FROM case_table $where GROUP BY case_type ORDER BY n DESC", $cid);
    $byMonth = dashboard_query($dbcon, "SELECT DATE_FORMAT(date_added, '%b %Y') label, COUNT(*) n, DATE_FORMAT(date_added, '%Y-%m') k
        FROM case_table " . ($cid !== null ? 'WHERE cid = ? AND' : 'WHERE') . " date_added IS NOT NULL
        GROUP BY k, label ORDER BY k DESC LIMIT 6", $cid);
    $byMonth = array_reverse($byMonth);

    evidence_count_safe($dbcon, $photos, $cid);

    $total = (int) $t['total'];
    $rate = $total ? round(($t['done'] / $total) * 100) : 0;
    $stats = [
        ['Total cases', $total, 'All registered cases', '#4f46e5'],
        ['Solved', (int) $t['done'], $rate . '% closure rate', '#059669'],
        ['In progress', (int) $t['active'], 'Under investigation', '#d97706'],
        ['Awaiting CID', (int) $t['unassigned'], 'Not yet assigned', '#dc2626'],
        ['Evidence photos', $photos, 'Crime scene & exhibits', '#0891b2'],
    ];
    ?>
    <div class="col-md-12">
        <div class="hero"><h2><?php echo ui_h($title); ?></h2><p><?php echo ui_h($subtitle); ?></p></div>
        <div class="stat-grid">
            <?php foreach ($stats as $s) { ?>
                <div class="stat" style="--c: <?php echo $s[3]; ?>">
                    <div class="label"><?php echo ui_h($s[0]); ?></div>
                    <div class="value"><?php echo (int) $s[1]; ?></div>
                    <div class="hint"><?php echo ui_h($s[2]); ?></div>
                </div>
            <?php } ?>
        </div>
        <div class="chart-grid">
            <div class="chart-card"><h4>Cases by crime type</h4><canvas id="chType"></canvas></div>
            <div class="chart-card"><h4>Case status</h4><canvas id="chStatus"></canvas></div>
            <div class="chart-card"><h4>Cases registered (last 6 months)</h4><canvas id="chMonth"></canvas></div>
        </div>
    </div>
    <script src="../assets/js/chart.umd.min.js"></script>
    <script>
    (function () {
        var palette = ['#4f46e5', '#0891b2', '#059669', '#d97706', '#dc2626', '#7c3aed', '#db2777', '#64748b'];
        Chart.defaults.font.family = 'Inter, "Segoe UI", system-ui, sans-serif';
        var type = <?php echo json_encode($byType); ?>;
        var month = <?php echo json_encode($byMonth); ?>;
        new Chart(document.getElementById('chType'), {
            type: 'doughnut',
            data: { labels: type.map(function (r) { return r.label || 'Unspecified'; }),
                    datasets: [{ data: type.map(function (r) { return +r.n; }), backgroundColor: palette, borderWidth: 0 }] },
            options: { cutout: '62%', plugins: { legend: { position: 'bottom' } } }
        });
        new Chart(document.getElementById('chStatus'), {
            type: 'bar',
            data: { labels: ['Solved', 'In progress', 'Awaiting CID'],
                    datasets: [{ data: [<?php echo (int) $t['done']; ?>, <?php echo (int) $t['active']; ?>, <?php echo (int) $t['unassigned']; ?>],
                                 backgroundColor: ['#059669', '#d97706', '#dc2626'], borderRadius: 8 }] },
            options: { plugins: { legend: { display: false } }, scales: { y: { beginAtZero: true, ticks: { precision: 0 } } } }
        });
        new Chart(document.getElementById('chMonth'), {
            type: 'line',
            data: { labels: month.map(function (r) { return r.label; }),
                    datasets: [{ data: month.map(function (r) { return +r.n; }), borderColor: '#4f46e5',
                                 backgroundColor: 'rgba(79,70,229,.12)', fill: true, tension: .35 }] },
            options: { plugins: { legend: { display: false } }, scales: { y: { beginAtZero: true, ticks: { precision: 0 } } } }
        });
    })();
    </script>
    <?php
}

function evidence_count_safe($dbcon, &$photos, $cid = null)
{
    require_once __DIR__ . '/evidence.php';
    evidence_ensure_table($dbcon);
    $sql = "SELECT COUNT(*) n FROM case_evidence" . ($cid !== null ? " WHERE case_id IN (SELECT case_id FROM case_table WHERE cid = ?)" : '');
    $photos = (int) dashboard_query($dbcon, $sql, $cid)[0]['n'];
}
