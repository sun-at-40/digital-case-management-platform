<?php
include('header.php');
include('dbconnect.php');
require_once __DIR__ . '/../shared/dashboard.php';
?>
<div class="container-fluid">
	<?php include('menubar.php'); ?>
	<?php dashboard_render($dbcon, 'Administration overview', 'Live statistics across all stations, officers and cases.'); ?>
</div>
<?php include('scripts.php'); ?>
</body>
</html>
