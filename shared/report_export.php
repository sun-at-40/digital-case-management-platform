<?php
session_start();
require_once __DIR__ . '/report.php';
require_once __DIR__ . '/../dbconnect.php';

if (empty($_SESSION['staffid']) || !in_array($_SESSION['role'] ?? '', ['Admin', 'DGP'], true)) {
    http_response_code(403);
    exit('Forbidden');
}

list($from, $to) = report_range();
$rows = report_data($dbcon, $from, $to);

header('Content-Type: text/csv; charset=utf-8');
header('Content-Disposition: attachment; filename="cid_performance_' . date('Ymd') . '.csv"');
$out = fopen('php://output', 'w');
fputcsv($out, ['Rank', 'Officer', 'Staff ID', 'Assigned', 'Solved', 'Pending', 'Solve rate %', 'Avg days to solve'], ',', '"', '');
foreach ($rows as $i => $r) {
    // Prefix risky leading characters so spreadsheets do not treat names as formulas
    $name = preg_match('/^[=+\-@]/', $r['name']) ? "'" . $r['name'] : $r['name'];
    fputcsv($out, [$i + 1, $name, $r['staffid'], $r['assigned'], $r['solved'], $r['pending'], $r['rate'],
        $r['avg_days'] !== null ? round($r['avg_days']) : ''], ',', '"', '');
}
fclose($out);
