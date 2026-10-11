<?php
include('header.php');
include('dbconnect.php');
require_once __DIR__ . '/../shared/dashboard.php';
?>
<div class="container-fluid">
	<?php include('menubar.php'); ?>
	<?php dashboard_render($dbcon, 'My investigations', 'Cases assigned to you, with status and evidence at a glance.', $session_id); ?>

	<div class="col-md-12">
		<div class="panel panel-success">
			<div class="panel-heading"><h3 class="panel-title">Cases assigned to me</h3></div>
			<div id="trans-table">
				<table id="myTable-trans" class="table table-hover" width="100%">
					<thead>
						<tr>
							<th>#</th>
							<th>Case Number</th>
							<th>Crime Type</th>
							<th>Status</th>
							<th>Statement</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
					<?php
					$sn = 0;
					$stmt = mysqli_prepare($dbcon, "SELECT * FROM case_table WHERE cid = ?");
					mysqli_stmt_bind_param($stmt, 's', $session_id);
					mysqli_stmt_execute($stmt);
					$result = mysqli_stmt_get_result($stmt);
					while ($row = mysqli_fetch_array($result)) {
						$id = $row['case_id'];
						$sn++;
					?>
						<tr>
							<td><?php echo $sn; ?></td>
							<td><strong><?php echo ui_h($id); ?></strong></td>
							<td><?php echo ui_h($row['case_type']); ?></td>
							<td><?php echo ui_status_pill($row['status']); ?></td>
							<td><?php echo $row['statement']; ?></td>
							<td>
								<a title="Write statement" href="cidstatement.php?edit=<?php echo urlencode($id); ?>" class="btn btn-ghost btn-sm"><span class="glyphicon glyphicon-pencil"></span></a>
								<a title="View details & evidence" href="casedetails.php?id=<?php echo urlencode($id); ?>" class="btn btn-primary btn-sm">Details</a>
							</td>
						</tr>
					<?php } ?>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>

<?php include('scripts.php'); ?>
<script type="text/javascript">
	$(document).ready(function() {
		$('#myTable-trans').DataTable();
	});
</script>
</body>
</html>
