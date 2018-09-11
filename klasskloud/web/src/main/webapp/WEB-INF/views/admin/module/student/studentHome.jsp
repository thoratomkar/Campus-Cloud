<%@include file="../../taglib_includes.jsp"%>
<div class="content-wrapper" style="min-height: 661px;">
	<section class="content-header">
		<h1>
			<i class="fa fa-dashboard"></i> Student Management<small>Dashboard</small>
		</h1>
		<ul class="breadcrumb">
			<li><a href="${contextroot}/dashboard/secure/home"><i class="fa fa-home"></i>Home</a></li>
			<li class="active" style="text-transform: capitalize;">Student Configuration</li>
		</ul>
	</section>

	<section class="content">


		<div class="box box-default">
			<div class="box-header with-border">
				<h3 class="box-title">
					<i class="glyphicon glyphicon-cog"></i>Create Entities
				</h3>
			</div>
			<div class="box-body">
				<!---Start First Row Display Configuration--->
				<div class="row">
					<div class="col-md-4 col-sm-6 col-xs-12">
						<div class="edusec-link-box">
							<span class="edusec-link-box-icon bg-aqua"><i
								class="fa fa-flag-checkered"></i></span>
							<div class="edusec-link-box-content">
								<span class="edusec-link-box-text"><a href="/web/student/default/manage">Manage Students
										</a></span> <span class="edusec-link-box-number">${TOTALSTUDENTS} </span> <span
									class="edusec-link-box-desc"> </span> <span
									class="edusec-link-box-bottom"><a href="/web/student/default/add"><i
										class="fa fa-plus-square"></i> Create New</a></span>
							</div>
							<!-- /.info-box-content -->
						</div>
						<!-- /.info-box -->
					</div>
				</div>
			</div>
			<!-- /.box-body -->
		</div>
		
		
		<div class="box box-default">
			<div class="box-header with-border">
				<h3 class="box-title">
					<i class="glyphicon glyphicon-cog"></i> Update Entities
				</h3>
			</div>
			<div class="box-body">
			
				<div class="row">
					

					
					<div class="col-md-4 col-sm-6 col-xs-12">
						<div class="edusec-link-box">
							<span class="edusec-link-box-icon bg-aqua"><i
								class="fa fa-university"></i></span>
							<div class="edusec-link-box-content">
								<span class="edusec-link-box-text"><a href="/web/timetable/default/home">Timetable</a></span>
								<span class="edusec-link-box-number"></span> <span
									class="edusec-link-box-desc"></span> <span
									class="edusec-link-box-bottom"><a href="/web/timetable/default/home"><i
										class="fa fa-edit"></i> Update</a></span>
							</div>
							<!-- /.info-box-content -->
						</div>
						<!-- /.info-box -->
					</div>

					<div class="col-md-4 col-sm-6 col-xs-12">
						<div class="edusec-link-box">
							<span class="edusec-link-box-icon bg-aqua"><i
								class="fa fa-university"></i></span>
							<div class="edusec-link-box-content">
								<span class="edusec-link-box-text"><a href="/web/attendance/default/home">Attendance</a></span>
								<span class="edusec-link-box-number"></span> <span
									class="edusec-link-box-desc"></span> <span
									class="edusec-link-box-bottom"><a href="/web/attendance/default/home"><i
										class="fa fa-edit"></i>Update Attendance </a></span>
							</div>
							<!-- /.info-box-content -->
						</div>
						<!-- /.info-box -->
					</div>
					
					
				</div>
				
			</div>
			
		</div>	
		
	</section>
</div>