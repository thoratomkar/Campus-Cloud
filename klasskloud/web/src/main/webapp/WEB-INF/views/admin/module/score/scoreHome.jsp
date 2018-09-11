<%@include file="../../taglib_includes.jsp"%>
<script type="text/javascript">
	$(function() {
		$.fn.dataTable.ext.errMode = 'none';
		fetchList();
		

	});

</script>

<div class="content-wrapper" style="min-height: 100%;">
	<section class="content-header">
		<h1>
			<i class="fa fa-th-list"></i>Manage<small>Marks</small>
		</h1>
		<ul class="breadcrumb">
			<li><a href="${contextroot}/dashboard/secure/home"><i
					class="fa fa-home"></i>Home</a></li>
			<li><a href="${contextroot}/student/default/home">Students Configuration</a></li>
			<li class="active" style="text-transform: capitalize;">${maintab}</li>
		</ul>
	</section>

	<section class="content">
		<security:authorize ifAllGranted="CREATE_ORG">
			<div class="box box-primary">
				<div class="box-header with-border">
					<h3 class="box-title">
						<i class="fa fa-plus-square"></i> <span class="header-text">
							Add Scores </span>
					</h3>
				</div>

				
			</div>
		</security:authorize>
		<div class="box box-info">
			<div class="box-header with-border">
				<h3 class="box-title">
					<i class="fa fa-search"></i> View Scores
				</h3>
			</div>

			<div class="box-body table-responsive">
				<table id="example" class="table table-striped table-bordered"
					cellspacing="0" width="100%">
					<thead>
						<tr>
				
						</tr>
					</thead>
				</table>

			</div>

		</div>
	</section>
</div>