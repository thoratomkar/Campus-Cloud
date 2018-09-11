<%@include file="../../taglib_includes.jsp"%>
<div class="content-wrapper" style="min-height: 661px;">
	<security:authentication var="user" property="principal" />
	<section class="content-header">
		<h1>
			<i class="fa fa-dashboard"></i> ${user.username} <small>Dashboard</small>
		</h1>
		<ul class="breadcrumb">
			<li><a href="/"><i class="fa fa-home"></i>Home</a></li>
			<li class="active">${user.username} : ${maintab} : ${tab} : ${subtab} </li>
		</ul>
	</section>

	<section class="content">
		<script>
			$(document).ready(function() {
				$('.nav-tabs-custom .tab-content').slimScroll({
					height : '300px'
				});
			});
			$(document).ready(function() {
				$('#coursList').slimScroll({
					height : '250px'
				});
			});
		</script>

		<style>
.tab-content {
	padding: 15px;
}

.box .box-body .fc-widget-header {
	background: none;
}

.popover {
	max-width: 450px;
}
</style>
		<div id="NoticeModal" class="fade modal" role="dialog" tabindex="-1">
			<div class="modal-dialog ">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">×</button>
						<h4>
							<i class="fa fa-eye"></i> View Notice Details
						</h4>
					</div>
					<div class="modal-body">
						<div id="NoticeModalContent"></div>
					</div>

				</div>
			</div>
		</div>

		<div class="callout callout-info msg-of-day">
			<h4>
				<i class="fa fa-bullhorn"></i> Message of day box
			</h4>
			<p>
				<marquee onmouseout="this.setAttribute('scrollamount', 2, 0);"
					onmouseover="this.setAttribute('scrollamount', 0, 0);"
					scrollamount="2" behavior="scroll" direction="left">A
					creative man is motivated by the desire to achieve, not by the
					desire to beat others.</marquee>
			</p>
		</div>

		<security:authorize access="hasRole('ROLE_ADMIN')" >
		<div class="row">
			<div class="col-lg-3 col-xs-6">
				<!-- small box -->
				<div class="small-box bg-teal">
					<div class="inner">
						<h3>12</h3>
						<p>Students</p>
					</div>
					<div class="icon">
						<i class="fa fa-users"></i>
					</div>
					<a class="small-box-footer" href="/student/stu-master/index"
						target="_blank">More info <i class="fa fa-arrow-circle-right"></i></a>
				</div>
			</div>
			<!-- ./col -->
			<div class="col-lg-3 col-xs-6">
				<!-- small box -->
				<div class="small-box bg-green">
					<div class="inner">
						<h3>12</h3>
						<p>Teachers</p>
					</div>
					<div class="icon">
						<i class="fa fa-user"></i>
					</div>
					<a class="small-box-footer" href="/employee/emp-master/index"
						target="_blank">More info <i class="fa fa-arrow-circle-right"></i></a>
				</div>
			</div>
			<!-- ./col -->
			<div class="col-lg-3 col-xs-6">
				<!-- small box -->
				<div class="small-box bg-yellow">
					<div class="inner">
						<h3>2</h3>
						<p>Active Courses</p>
					</div>
					<div class="icon">
						<i class="fa fa-graduation-cap"></i>
					</div>
					<a class="small-box-footer" href="/course/courses/index"
						target="_blank">More info <i class="fa fa-arrow-circle-right"></i></a>
				</div>
			</div>
			<!-- ./col -->
			<div class="col-lg-3 col-xs-6">
				<!-- small box -->
				<div class="small-box bg-red">
					<div class="inner">
						<h3>3</h3>
						<p>Active Batches</p>
					</div>
					<div class="icon">
						<i class="fa fa-sitemap"></i>
					</div>
					<a class="small-box-footer" href="/course/batches/index"
						target="_blank">More info <i class="fa fa-arrow-circle-right"></i></a>
				</div>
			</div>
			<!-- ./col -->
		</div>
		</security:authorize>


	</section>
</div>