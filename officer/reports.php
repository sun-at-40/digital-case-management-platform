<?php
include('header.php');
include('dbconnect.php');
require_once __DIR__ . '/../shared/report.php';
?>
<div class="container-fluid">
	<?php include('menubar.php'); ?>
	<?php
	if (($_SESSION['role'] ?? '') === 'DGP') {
		report_render($dbcon);
	} else {
		http_response_code(403);
		echo '<div class="col-md-12"><div class="alert alert-danger">You do not have access to this report.</div></div>';
	}
	?>
</div>
<?php include('scripts.php'); ?>
</body>
</html>