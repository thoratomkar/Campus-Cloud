<%@include file="../../taglib_includes.jsp"%>
<div class="content-wrapper" style="min-height: 661px;">
	<section class="content-header">
		<h1>
			<i class="fa fa-dashboard"></i> Test Management<small>Dashboard</small>
		</h1>
		<ul class="breadcrumb">
			<li><a href="${contextroot}/dashboard/secure/home"><i class="fa fa-home"></i>Home</a></li>
			<li class="active" style="text-transform: capitalize;">Test Configuration</li>
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
								<span class="edusec-link-box-text"><a href="/web/test/default/manage">Manage Tests
										</a></span> <span class="edusec-link-box-number">${TOTALTESTS} </span> <span
									class="edusec-link-box-desc"> </span> <span
									class="edusec-link-box-bottom"><a href="/web/test/default/add"><i
										class="fa fa-plus-square"></i> Create New</a></span>
							</div>
							<!-- /.info-box-content -->
						</div>
						<!-- /.info-box -->
					</div>
					
					<security:authorize ifAllGranted="ALL_MARKS">
					<div class="col-md-4 col-sm-6 col-xs-12">
						<div class="edusec-link-box">
							<span class="edusec-link-box-icon bg-aqua"><i
								class="fa fa-flag-checkered"></i></span>
							<div class="edusec-link-box-content">
								<span class="edusec-link-box-text"><a href="/web/score/default/manage">Manage Scores
								</a></span> <span class="edusec-link-box-number">${TOTALMARKS}</span> <span
									class="edusec-link-box-desc"></span> <span
									class="edusec-link-box-bottom"><a href="/web/score/default/add"><i
										class="fa fa-plus-square"></i> Student Scores</a></span>
							</div>
							<!-- /.info-box-content -->
						</div>
						<!-- /.info-box -->
					</div>
					</security:authorize>
					
				</div>
			</div>
			<!-- /.box-body -->
		</div>
		
		
		
	</section>
</div>