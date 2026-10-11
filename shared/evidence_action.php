<?php
session_start();
require_once __DIR__ . '/evidence.php';
require_once __DIR__ . '/../dbconnect.php';

if (empty($_SESSION['staffid'])) {
    header('Location: ../login.php');
    exit();
}

$dirs = ['Admin' => 'admin', 'DGP' => 'officer', 'CID' => 'cid'];
$role = $_SESSION['role'] ?? '';
if (!isset($dirs[$role]) || $_SERVER['REQUEST_METHOD'] !== 'POST'
    || !hash_equals($_SESSION['csrf'] ?? '', $_POST['csrf'] ?? '')) {
    http_response_code(403);
    exit('Forbidden');
}

$staffid = $_SESSION['staffid'];
$caseId = trim($_POST['case_id'] ?? '');
$status = $_POST['status'] ?? '';
$back = '../' . $dirs[$role] . '/casedetails.php?id=' . urlencode($caseId) . '&status=' . urlencode($status) . '#evidence';

evidence_ensure_table($dbcon);

$stmt = mysqli_prepare($dbcon, "SELECT 1 FROM case_table WHERE case_id = ?");
mysqli_stmt_bind_param($stmt, 's', $caseId);
mysqli_stmt_execute($stmt);
if (mysqli_stmt_get_result($stmt)->num_rows === 0) {
    http_response_code(404);
    exit('Case not found');
}

$uploadDir = __DIR__ . '/../uploads/evidence/';
$action = $_POST['action'] ?? '';

if ($action === 'upload' && isset($_FILES['photos'])) {
    $allowed = ['image/jpeg' => 'jpg', 'image/png' => 'png', 'image/webp' => 'webp', 'image/gif' => 'gif'];
    $category = in_array($_POST['category'] ?? '', EVIDENCE_CATEGORIES, true) ? $_POST['category'] : 'Other';
    $caption = mb_substr(trim($_POST['caption'] ?? ''), 0, 255);
    $saved = 0;
    $rejected = 0;
    $finfo = new finfo(FILEINFO_MIME_TYPE);

    foreach ($_FILES['photos']['error'] as $i => $err) {
        $tmp = $_FILES['photos']['tmp_name'][$i];
        $size = $_FILES['photos']['size'][$i];
        if ($err !== UPLOAD_ERR_OK || $size <= 0 || $size > 5 * 1024 * 1024) {
            $rejected++;
            continue;
        }
        $mime = $finfo->file($tmp);
        if (!isset($allowed[$mime]) || @getimagesize($tmp) === false) {
            $rejected++;
            continue;
        }
        $name = bin2hex(random_bytes(16)) . '.' . $allowed[$mime];
        if (!move_uploaded_file($tmp, $uploadDir . $name)) {
            $rejected++;
            continue;
        }
        $orig = mb_substr(basename($_FILES['photos']['name'][$i]), 0, 255);
        $ins = mysqli_prepare($dbcon, "INSERT INTO case_evidence (case_id, filename, original_name, category, caption, uploaded_by) VALUES (?,?,?,?,?,?)");
        mysqli_stmt_bind_param($ins, 'ssssss', $caseId, $name, $orig, $category, $caption, $staffid);
        mysqli_stmt_execute($ins);
        $saved++;
    }
    $_SESSION['evidence_flash'] = "$saved photo(s) uploaded" . ($rejected ? ", $rejected rejected (type or size not allowed)." : '.');
} elseif ($action === 'delete') {
    $id = (int) ($_POST['id'] ?? 0);
    $sel = mysqli_prepare($dbcon, "SELECT filename, uploaded_by FROM case_evidence WHERE id = ? AND case_id = ?");
    mysqli_stmt_bind_param($sel, 'is', $id, $caseId);
    mysqli_stmt_execute($sel);
    $row = mysqli_fetch_assoc(mysqli_stmt_get_result($sel));
    if ($row && ($role === 'Admin' || $row['uploaded_by'] === $staffid)) {
        $del = mysqli_prepare($dbcon, "DELETE FROM case_evidence WHERE id = ?");
        mysqli_stmt_bind_param($del, 'i', $id);
        mysqli_stmt_execute($del);
        @unlink($uploadDir . basename($row['filename']));
        $_SESSION['evidence_flash'] = 'Photo deleted.';
    }
}

header('Location: ' . $back);
exit();
