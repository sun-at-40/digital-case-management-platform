<?php
include('session.php');
include('dbconnect.php');

$casetype = $_POST['crime_type'] ?? '';
$statement = $_POST['statement'] ?? '';
$caseid = $_POST['caseid'] ?? '';

$stmt = mysqli_prepare($dbcon, "UPDATE case_table SET diary_of_action = ?, case_type = ? WHERE case_id = ?");
mysqli_stmt_bind_param($stmt, 'sss', $statement, $casetype, $caseid);
mysqli_stmt_execute($stmt);

header('Location: caseview.php');
exit();
