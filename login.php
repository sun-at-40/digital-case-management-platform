<?php
session_start();
include('dbconnect.php');

if (isset($_SESSION['staffid'])) {
    $targets = ['Admin' => 'admin/', 'CID' => 'cid/', 'DGP' => 'officer/'];
    if (isset($targets[$_SESSION['role']])) {
        header('Location: ' . $targets[$_SESSION['role']]);
        exit();
    }
}

include('header.php');
?>
<main class="login-card">
	<div class="logo"><?php echo ui_logo_svg(); ?></div>
	<h1>Dindigul Police</h1>
	<p class="sub">Digital Case Management Platform (DCMP) &mdash; sign in to continue</p>

	<?php if (isset($_SESSION['error'])) { ?>
		<div class="alert alert-danger"><?php echo ui_h($_SESSION['error']); ?></div>
	<?php unset($_SESSION['error']); } ?>

	<form action="logincheck.php" method="post" autocomplete="off">
		<div class="form-group">
			<label for="un">Staff Number</label>
			<input type="text" class="form-control" name="username" id="un" placeholder="e.g. 110" autofocus required>
		</div>
		<div class="form-group">
			<label for="pwd">Password</label>
			<input type="password" class="form-control" name="pwd" id="pwd" placeholder="Enter your password" required>
		</div>
		<button type="submit" name="login" class="btn btn-primary btn-block">Sign in</button>
	</form>
</main>
</body>
</html>
