<%@include file="./includes/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="en-US">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="shortcut icon"
		href="#"
		type="image/x-icon">
	<title>CampusCloud | Login</title>
	<link href="${csspath}/font-awesome.min.css" rel="stylesheet">
	<link href="${csspath}/bootstrap.css" rel="stylesheet">
	<link href="${csspath}/AdminLTE.min.css" rel="stylesheet">
	<link href="${csspath}/_all-skins.min.css" rel="stylesheet">
	<link href="${csspath}/kk-login.css" rel="stylesheet">
	<script src="${javascriptpath}/jquery.js"></script>
	<script src="${javascriptpath}/yii.js"></script>
	<script src="${javascriptpath}/yii.activeForm.js"></script>
	<script src="${javascriptpath}/bootstrap.js"></script>
	<script src="${javascriptpath}/app.js"></script>
	<script src="${javascriptpath}/demo.js"></script>
	<script src="${javascriptpath}/jquery.slimscroll.min.js"></script>
	<script src="${javascriptpath}/bootstrapx-clickover.js"></script>
	<script type="text/javascript">
		jQuery(document).ready(function() {
			jQuery('#login-form').yiiActiveForm([], []);
		});
	</script>
</head>
<body class="login-page" style="margin-top: -80px;">
	<div class="login-box">
		<div class="login-logo">&nbsp;</div>
		<!-- /.login-logo -->
		<div class="login-box-body login-header">
			<h1>
				<img src="${imagepath}/campuscloud.png" width="150px;" alt="">
			</h1>
		</div>
		<!--/.login-header-->
		<div class="login-box-body">
			<p class="login-box-msg">Please fill out the following fields to
				login</p>
			${message}
			<form id="login-form"  action="<c:url value='j_spring_security_check' />"
				method="post" role="form">
				<div
					class="form-group has-feedback field-loginform-username required">

					<input type="text" id="loginform-username" class="form-control"
						name="username" placeholder="Username"><span
						class="glyphicon glyphicon-user form-control-feedback"></span>

					<p class="help-block help-block-error"></p>
				</div>
				<div
					class="form-group has-feedback field-loginform-password required">

					<input type="password" id="loginform-password" class="form-control"
						name="password" placeholder="Password"><span
						class="glyphicon glyphicon-lock form-control-feedback"></span>

					<p class="help-block help-block-error"></p>
				</div>
				<div class="row">
					<div class="col-xs-8">
						<div class="form-group field-loginform-rememberme">
							<div class="checkbox">
								<label> <input type="hidden"
									name="LoginForm[rememberMe]" value="0"><input
									type="checkbox" id="loginform-rememberme"
									name="LoginForm[rememberMe]" value="1" checked="">
									Remember Me
								</label>
								<p class="help-block help-block-error"></p>

							</div>
						</div>
					</div>
					<!-- /.col -->
					<div class="col-xs-4">
						<button type="submit" class="btn btn-primary btn-block btn-flat"
							name="login-button">Login</button>
					</div>
					<!-- /.col -->
				</div>

			</form>
			<a class="text-center" href="#">I forgot my password</a> <br> <a
				class="text-center" href="${contextroot}/register">Register</a>
		</div>
		<!-- /.login-box-body -->

	</div>
	<!-- /.login-box -->

	<div class="login-footer">
		<strong>Copyright © 2017 <a href="http://www.classcloud.com/"
			target="_BLANK">Campus Cloud LLP</a>.
		</strong> All rights reserved.
	</div>


</body>
</html>