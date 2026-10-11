<?php
include('header.php');
include('dbconnect.php');
require_once __DIR__ . '/../shared/dashboard.php';
?>
<div class="container-fluid">
	<?php include('menubar.php'); ?>
	<?php dashboard_render($dbcon, 'Station desk', 'Register new complaints, track their progress and attach crime scene evidence.'); ?>
</div>
<?php include('scripts.php'); ?>
</body>
</html>
