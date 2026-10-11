<?php
// Streams an accused photo to logged-in staff only (uploads/ is not web-accessible).
session_start();
require_once __DIR__ . '/../dbconnect.php';

if (empty($_SESSION['staffid'])) {
    http_response_code(403);
    exit('Forbidden');
}

$id = (int) ($_GET['id'] ?? 0);
$stmt = mysqli_prepare($dbcon, "SELECT photo FROM case_accused WHERE id = ?");
mysqli_stmt_bind_param($stmt, 'i', $id);
mysqli_stmt_execute($stmt);
$row = mysqli_fetch_assoc(mysqli_stmt_get_result($stmt));

$path = ($row && $row['photo'] !== '') ? __DIR__ . '/../uploads/accused/' . basename($row['photo']) : '';
if ($path === '' || !is_file($path)) {
    http_response_code(404);
    exit('Not found');
}

$types = ['jpg' => 'image/jpeg', 'png' => 'image/png', 'webp' => 'image/webp', 'gif' => 'image/gif'];
header('Content-Type: ' . ($types[pathinfo($path, PATHINFO_EXTENSION)] ?? 'application/octet-stream'));
header('Content-Length: ' . filesize($path));
header('X-Content-Type-Options: nosniff');
header('Cache-Control: private, max-age=3600');
readfile($path);
