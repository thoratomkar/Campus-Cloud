<%@include file="../../taglib_includes.jsp"%>
<div class="content-wrapper" style="min-height: 661px;">
	<section class="content-header">
		<h1>
			<i class="fa fa-dashboard"></i> Master Configuration <small>Dashboard</small>
		</h1>
		<ul class="breadcrumb">
			<li><a href="${contextroot}/dashboard/secure/home"><i
					class="fa fa-home"></i>Home</a></li>
			<li class="active" style="text-transform: capitalize;">Master
				Configuration</li>
		</ul>
	</section>

	<section class="content">


		<div class="box box-default">
			<div class="box-header with-border">
				<h3 class="box-title">
					<i class="glyphicon glyphicon-cog"></i> General Configuration
				</h3>
			</div>
			<div class="box-body">
				<div class="row">
					<security:authorize ifAllGranted="ALL_PMS">
						<div class="col-md-4 col-sm-6 col-xs-12">
							<div class="edusec-link-box">
								<span class="edusec-link-box-icon bg-aqua"><i
									class="fa fa-flag"></i></span>
								<div class="edusec-link-box-content">
									<span class="edusec-link-box-text"><a
										href="/web/permission/default/home">Permissions </a></span> <span
										class="edusec-link-box-number">${TOTALPERMISSIONS}</span> <span
										class="edusec-link-box-desc">Manage Permissions</span> <span
										class="edusec-link-box-bottom"><a
										href="/web/permission/default/home"><i
											class="fa fa-plus-square"></i> Create New</a></span>
								</div>
								<!-- /.info-box-content -->
							</div>
							<!-- /.info-box -->
						</div>
					</security:authorize>

					<!---Start Second Row Display Configuration--->
					<div class="col-md-4 col-sm-6 col-xs-12">
						<div class="edusec-link-box">
							<span class="edusec-link-box-icon bg-aqua"><i
								class="fa fa-university"></i></span>
							<div class="edusec-link-box-content">
								<span class="edusec-link-box-text"><a
									href="/web/organization/default/home">Organization</a></span> <span
									class="edusec-link-box-number">${TOTALORGANIZATIONS}</span> <span
									class="edusec-link-box-desc">Manage Organization Setup</span>
								<security:authorize ifAllGranted="CREATE_ORG">
									<span class="edusec-link-box-bottom"><a
										href="/web/organization/default/home"><i
											class="fa fa-edit"></i> Create New</a></span>
								</security:authorize>
							</div>
							<!-- /.info-box-content -->
						</div>
						<!-- /.info-box -->
					</div>
					<security:authorize ifAllGranted="ALL_AY">
						<div class="col-md-4 col-sm-6 col-xs-12">
							<div class="edusec-link-box">
								<span class="edusec-link-box-icon bg-aqua"><i
									class="fa fa-flag-checkered"></i></span>
								<div class="edusec-link-box-content">
									<span class="edusec-link-box-text"><a
										href="/web/acad/default/home">Academic Year</a></span> <span
										class="edusec-link-box-number">${TOTALACADYEARS} </span> <span
										class="edusec-link-box-desc">Current : 2015-16 </span> <span
										class="edusec-link-box-bottom"><a
										href="/web/acad/default/home"><i class="fa fa-plus-square"></i>
											Create New</a></span>
								</div>
								<!-- /.info-box-content -->
							</div>
							<!-- /.info-box -->
						</div>
					</security:authorize>

				</div>

				<div class="row">
					<security:authorize ifAllGranted="ALL_MOD">
						<div class="col-md-4 col-sm-6 col-xs-12">
							<div class="edusec-link-box">
								<span class="edusec-link-box-icon bg-aqua"><i
									class="fa fa-flag"></i></span>
								<div class="edusec-link-box-content">
									<span class="edusec-link-box-text"><a
										href="/web/module/default/home">Modules</a></span> <span
										class="edusec-link-box-number">${TOTALMODULES}</span> <span
										class="edusec-link-box-desc">Manage Modules</span> <span
										class="edusec-link-box-bottom"><a
										href="/web/module/default/home"><i
											class="fa fa-plus-square"></i> Create New</a></span>
								</div>
								<!-- /.info-box-content -->
							</div>
							<!-- /.info-box -->
						</div>
					</security:authorize>


					<!---Start Second Row Display Configuration--->
					<security:authorize ifAllGranted="ALL_OP">
						<div class="col-md-4 col-sm-6 col-xs-12">
							<div class="edusec-link-box">
								<span class="edusec-link-box-icon bg-aqua"><i
									class="fa fa-university"></i></span>
								<div class="edusec-link-box-content">
									<span class="edusec-link-box-text"><a
										href="/web/operation/default/home">Operations</a></span> <span
										class="edusec-link-box-number">${TOTALOPERATIONS}</span> <span
										class="edusec-link-box-desc">Manage Operations</span> <span
										class="edusec-link-box-bottom"><a
										href="/web/operation/default/home"><i class="fa fa-edit"></i>
											Create New</a></span>
								</div>
								<!-- /.info-box-content -->
							</div>
							<!-- /.info-box -->
						</div>
					</security:authorize>

				</div>

				<!-- /. End Row-->
			</div>
			<!-- /.box-body -->
		</div>
	</section>
</div>