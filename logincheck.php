<?php
session_start();
include('dbconnect.php');

if (isset($_POST['login'])) {
    $username = trim($_POST['username'] ?? '');
    $pwd = trim($_POST['pwd'] ?? '');

    $stmt = mysqli_prepare($dbcon, "SELECT staffid, status FROM userlogin WHERE staffid = ? AND password = SHA1(?)");
    mysqli_stmt_bind_param($stmt, 'ss', $username, $pwd);
    mysqli_stmt_execute($stmt);
    $result = mysqli_stmt_get_result($stmt);

    if (mysqli_num_rows($result) == 1) {
        $row = mysqli_fetch_array($result);
        session_regenerate_id(true);
        $_SESSION['staffid'] = $row['staffid'];
        $_SESSION['role'] = $row['status'];
    } else {
        $_SESSION['error'] = 'Your Staff ID or password is not valid';
    }
}
header('location: login.php');
exit();
