<?php
include('session.php');
include('dbconnect.php');
require_once __DIR__ . '/../shared/layout.php';

$stmt = mysqli_prepare($dbcon, "SELECT * FROM userlogin WHERE staffid = ?");
mysqli_stmt_bind_param($stmt, 's', $session_id);
mysqli_stmt_execute($stmt);
$row = mysqli_fetch_array(mysqli_stmt_get_result($stmt));

echo '<div class="col-md-12">';
ui_nav([
    ['index.php', 'Dashboard', 'dashboard'],
    ['addstaff.php', 'Add Staff', 'plus'],
    ['user.php', 'Staff', 'user'],
    ['caseview.php', 'Cases', 'folder-open'],
    ['reports.php', 'Reports', 'stats'],
], $row, 'Admin');
echo '</div>';
