<%@include file="../../taglib_includes.jsp"%>
<script type="text/javascript">
	$(function() {
		$("#orgId").change(
				function() {
					$.ajax({
						url : '${contextroot}/rest/changescope/'
								+ $(this).val(),
						type : 'POST',
						success : function(data, textStatus, jqXHR) {
							$(location).attr('href',
									'${contextroot}/dashboard/secure/home');
						},
						error : function(jqXHR, textStatus, errorThrown) {
						}
					});
				});

	});
</script>
<security:authentication var="user" property="principal" />
<header class="main-header">

	<a class="logo" href="#"><span class="logo-mini">CC</span> <span
		class="logo-lg">CampusCloud<sup>TM</sup></span></a>
	<nav class="navbar navbar-static-top" role="navigation">

		<a href="#" class="sidebar-toggle" data-toggle="offcanvas"
			role="button"> <span class="sr-only">Toggle navigation</span>
		</a>

		<div class="navbar-custom-menu">

			<ul class="nav navbar-nav">
				<li class="dropdown module-menu"><a
					href="http://www.demo.edusec.org/#" class="dropdown-toggle"
					data-toggle="dropdown" aria-expanded="false" title="Main Menu">
						<span class="glyphicon glyphicon-th fa-lg"></span>
				</a>

					<ul class="dropdown-menu">
						<li>
							<div class="slimScrollDiv"
								style="position: relative; overflow: hidden; width: auto; height: 50px;">
								<ul class="menu"
									style="overflow: hidden; width: 100%; height: 50px;">
									<li><a href="#"><i class="fa fa-cogs text-aqua fa-2x"></i>
											<h4>Configuration</h4></a></li>
									<li><a
										href="http://www.demo.edusec.org/academics/default/index"><i
											class="fa fa-calendar-o text-yellow fa-2x"></i>
											<h4>Academics</h4></a></li>
									<li><a
										href="http://www.demo.edusec.org/admission/default/index"><i
											class="fa fa-user-plus text-red fa-2x"></i>
											<h4>Admission</h4></a></li>
									<li><a
										href="http://www.demo.edusec.org/student/default/index"><i
											class="fa fa-users text-yellow fa-2x"></i>
											<h4>Student</h4></a></li>
									<li><a
										href="http://www.demo.edusec.org/fees/default/index"><i
											class="fa fa-money text-green fa-2x"></i>
											<h4>Fees</h4></a></li>
									<li><a href="http://www.demo.edusec.org/hr/default/index"><i
											class="fa fa-user text-purple fa-2x"></i>
											<h4>HR</h4></a></li>
									<li><a
										href="http://www.demo.edusec.org/communication/default/index"><i
											class="fa fa-comments-o text-teal fa-2x"></i>
											<h4>Communication</h4></a></li>
									<li><a
										href="http://www.demo.edusec.org/userManage/default/index"><i
											class="fa fa-user-secret text-light-blue fa-2x"></i>
											<h4>User</h4></a></li>
									<li><a
										href="http://www.demo.edusec.org/report/default/index"><i
											class="fa fa-line-chart text-blue fa-2x"></i>
											<h4>Report</h4></a></li>
									<li><a
										href="http://www.demo.edusec.org/administration/default/index"><i
											class="fa fa-wrench text-green fa-2x"></i>
											<h4>Administration</h4></a></li>
									<li><a
										href="http://www.demo.edusec.org/library/default/index"><i
											class="fa fa-university text-blue fa-2x"></i>
											<h4>Library</h4></a></li>
								</ul>
								<div class="slimScrollBar"
									style="width: 3px; position: absolute; top: 0px; opacity: 0.4; display: none; border-radius: 7px; z-index: 99; right: 1px; background: rgb(0, 0, 0);"></div>
								<div class="slimScrollRail"
									style="width: 3px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; opacity: 0.2; z-index: 90; right: 1px; background: rgb(51, 51, 51);"></div>
							</div>
						</li>
					</ul></li>
				<!-- Notifications: style can be found in dropdown.less-->
				<li class="dropdown notifications-menu"><a
					href="http://www.demo.edusec.org/#" class="dropdown-toggle"
					data-toggle="dropdown"> <i class="fa fa-bell-o"></i> <span
						class="label label-warning">0</span>
				</a>
					<ul class="dropdown-menu">
						<li class="header">You have No notifications</li>
					</ul></li>
				<!-- User Account: style can be found in dropdown.less -->
				<li class="dropdown user user-menu"><a
					href="http://www.demo.edusec.org/#" class="dropdown-toggle"
					data-toggle="dropdown"> <img src="${imagepath}/no-photo.png"
						class="user-image" alt="User Image"> <span class="hidden-xs">${context.loggedInUser.username}
							User</span>
				</a>
					<ul class="dropdown-menu">
						<!-- User image -->
						<li class="user-header"><img src="${imagepath}/no-photo.png"
							class="img-circle" alt="User Image">

							<p style="font-size: 18px;">${user.username}User</p></li>
						<!-- Menu Body -->
						<li class="user-body" style="display: none">
							<div class="col-xs-6 no-padding">
								<a class="btn btn-default btn-flat" href="#"
									style="font-size: 13px">View Profile</a>
							</div>
						</li>
						<!-- Menu Footer-->
						<li class="user-footer">
							<div class="pull-left">
								<a class="btn btn-default btn-flat" href="#"
									style="font-size: 12px">Change Password</a>
							</div>
							<div class="pull-right">
								<a class="btn btn-default btn-flat"
									href="<c:url value='/j_spring_security_logout' />"
									data-method="post" style="font-size: 12px">Sign out</a>
							</div>
						</li>
					</ul></li>
			</ul>
		</div>
		<c:if test="${fn:length(context.orgList) > 0}">
			<div class="navbar-custom-menu" style="margin: 7px;">
				<select id="orgId" class="form-control" name="orgId">
					<c:forEach items="${context.orgList}" var="org">
						<option value="${org.id}"
							${org.id == context.selectedOrgId ? 'selected' : ' '}>${org.name}</option>
					</c:forEach>
				</select>
			</div>
		</c:if>
	</nav>
</header>