<?php
session_start();
require_once __DIR__ . '/resolution.php';
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
$back = '../' . $dirs[$role] . '/casedetails.php?id=' . urlencode($caseId) . '&status=' . urlencode($status) . '#resolution';

resolution_ensure_tables($dbcon);

$stmt = mysqli_prepare($dbcon, "SELECT status FROM case_table WHERE case_id = ?");
mysqli_stmt_bind_param($stmt, 's', $caseId);
mysqli_stmt_execute($stmt);
$case = mysqli_fetch_assoc(mysqli_stmt_get_result($stmt));
if (!$case) {
    http_response_code(404);
    exit('Case not found');
}
if ($case['status'] !== 'Completed' || !resolution_can_edit($dbcon, $caseId, $role, $staffid)) {
    http_response_code(403);
    exit('Forbidden');
}

$uploadDir = __DIR__ . '/../uploads/accused/';
if (!is_dir($uploadDir)) {
    mkdir($uploadDir, 0775, true);
}
$action = $_POST['action'] ?? '';

if ($action === 'remarks') {
    $remarks = mb_substr(trim($_POST['remarks'] ?? ''), 0, 5000);
    if ($remarks === '') {
        $_SESSION['resolution_flash'] = 'Remarks cannot be empty.';
    } else {
        $st = mysqli_prepare($dbcon, "INSERT INTO case_resolution (case_id, remarks, updated_by) VALUES (?,?,?)
            ON DUPLICATE KEY UPDATE remarks = VALUES(remarks), updated_by = VALUES(updated_by)");
        mysqli_stmt_bind_param($st, 'sss', $caseId, $remarks, $staffid);
        mysqli_stmt_execute($st);
        $_SESSION['resolution_flash'] = 'Resolution remarks saved.';
    }
} elseif ($action === 'add_accused') {
    $name = mb_substr(trim($_POST['name'] ?? ''), 0, 100);
    if ($name === '') {
        $_SESSION['resolution_flash'] = 'Accused name is required.';
        header('Location: ' . $back);
        exit();
    }
    $alias = mb_substr(trim($_POST['alias_name'] ?? ''), 0, 100);
    $age = (int) ($_POST['age'] ?? 0);
    $age = ($age >= 1 && $age <= 120) ? $age : null;
    $gender = in_array($_POST['gender'] ?? '', ['Male', 'Female', 'Other'], true) ? $_POST['gender'] : '';
    $address = mb_substr(trim($_POST['address'] ?? ''), 0, 255);
    $roleIn = mb_substr(trim($_POST['role_in_crime'] ?? ''), 0, 255);

    $photo = '';
    $note = 'Accused added.';
    if (isset($_FILES['photo']) && $_FILES['photo']['error'] !== UPLOAD_ERR_NO_FILE) {
        $f = $_FILES['photo'];
        $allowed = ['image/jpeg' => 'jpg', 'image/png' => 'png', 'image/webp' => 'webp', 'image/gif' => 'gif'];
        $mime = $f['error'] === UPLOAD_ERR_OK ? (new finfo(FILEINFO_MIME_TYPE))->file($f['tmp_name']) : '';
        if ($f['error'] === UPLOAD_ERR_OK && $f['size'] > 0 && $f['size'] <= 5 * 1024 * 1024
            && isset($allowed[$mime]) && @getimagesize($f['tmp_name']) !== false) {
            $fname = bin2hex(random_bytes(16)) . '.' . $allowed[$mime];
            if (move_uploaded_file($f['tmp_name'], $uploadDir . $fname)) {
                $photo = $fname;
            }
        }
        if ($photo === '') {
            $note = 'Accused added, but the photo was rejected (type or size not allowed).';
        }
    }

    $st = mysqli_prepare($dbcon, "INSERT INTO case_accused (case_id, name, alias_name, age, gender, address, role_in_crime, photo, added_by)
        VALUES (?,?,?,?,?,?,?,?,?)");
    mysqli_stmt_bind_param($st, 'sssisssss', $caseId, $name, $alias, $age, $gender, $address, $roleIn, $photo, $staffid);
    mysqli_stmt_execute($st);
    $_SESSION['resolution_flash'] = $note;
} elseif ($action === 'delete_accused') {
    $id = (int) ($_POST['id'] ?? 0);
    $sel = mysqli_prepare($dbcon, "SELECT photo FROM case_accused WHERE id = ? AND case_id = ?");
    mysqli_stmt_bind_param($sel, 'is', $id, $caseId);
    mysqli_stmt_execute($sel);
    $row = mysqli_fetch_assoc(mysqli_stmt_get_result($sel));
    if ($row) {
        $del = mysqli_prepare($dbcon, "DELETE FROM case_accused WHERE id = ?");
        mysqli_stmt_bind_param($del, 'i', $id);
        mysqli_stmt_execute($del);
        if ($row['photo'] !== '') {
            @unlink($uploadDir . basename($row['photo']));
        }
        $_SESSION['resolution_flash'] = 'Accused record removed.';
    }
}

header('Location: ' . $back);
exit();
