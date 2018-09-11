<%@include file="../../taglib_includes.jsp"%>

<script type="text/javascript">
	$(function() {
		$('.btn-register').on('click', function(e) {
			if (validate()) {
				var postData = $('#register-form').serializeArray();
				var formURL = $('#register-form').attr("action");
				$.ajax({
					url : formURL,
					type : "POST",
					data : postData,
					success : function(data, textStatus, jqXHR) {
						if (data.status == false) {
							$('#username').css('border', '1px solid #CD5C5C');
							$('#register-form').find('#username').siblings('.error-block')
									.text('username is already exists');
						} else {
							$(location).attr('href', '${contextroot}/login');
						}
					},
					error : function(jqXHR, textStatus, errorThrown) {
					}
				});
			}
		});

		
		$('.btn-reset').on('click',function(e) {
				$('#register-form').find('input[name="username"]').attr('value','');
				$('#register-form').find('input[name="password"]').attr('value','');
				$('#register-form').find('input[name="confirmPassword"]').attr('value','');
				$('#register-form').find('input[name="contactEmail"]').attr('value','');
				$('.error-block').text('');
				$('.form-control').css('border', '');
		});

		function validate() {
			var flag = true;
			var username = $('#register-form').find('input[name="username"]')
					.val();
			var password = $('#register-form').find('input[name="password"]')
					.val();
			var confirmPassword = $('#register-form').find(
					'input[name="confirmPassword"]').val();
			var contactEmail = $('#register-form').find(
					'input[name="contactEmail"]').val();
			if (username.length == 0) {
				flag = false;
				$('#username').css('border', '1px solid #CD5C5C');
				$('#register-form').find('#username').siblings('.error-block')
						.text('username is required field');
			} else {
				$('#username').css('border', '');
				$('#register-form').find('#username').siblings('.error-block')
						.text('');
			}

			if (password.length == 0) {
				flag = false;
				$('#password').css('border', '1px solid #CD5C5C');
				$('#register-form').find('#password').siblings('.error-block')
						.text('Password is required field');
			} else {
				$('#password').css('border', '');
				$('#register-form').find('#password').siblings('.error-block')
						.text('');
			}

			if (confirmPassword.length == 0) {
				flag = false;
				$('#confirmPassword').css('border', '1px solid #CD5C5C');
				$('#register-form').find('#confirmPassword').siblings(
						'.error-block').text(
						'Confirm Password is required field');
			} else {
				$('#confirmPassword').css('border', '');
				$('#register-form').find('#confirmPassword').siblings(
						'.error-block').text('');
			}

			if (password != confirmPassword) {
				flag = false;
				$('#confirmPassword').css('border', '1px solid #CD5C5C');
				$('#register-form').find('#confirmPassword').siblings(
						'.error-block').text(
						'Confirm Password is not matching with password');
			}

			if (contactEmail.length == 0) {
				flag = false;
				$('#contactEmail').css('border', '1px solid #CD5C5C');
				$('#register-form').find('#contactEmail').siblings(
						'.error-block').text('Contact Email is required field');
			} else {

				if (!validateEmail(contactEmail)) {
					flag = false;
					$('#contactEmail').css('border', '1px solid #CD5C5C');
					$('#register-form').find('#contactEmail').siblings(
							'.error-block').text('Invalid Email Address');
				} else {
					$('#contactEmail').css('border', '');
					$('#register-form').find('#contactEmail').siblings(
							'.error-block').text('');
				}
			}

			

			return flag;
		}

		function validateEmail(sEmail) {
			if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(sEmail)) {
				return true;
			}
			return false;
		}

	});
</script>

<div class="content-wrapper">
	<section class="content" style="background-color: white;">
		<div class="login-box">
			<div class="login-box-body">
				<p class="login-box-msg">Please fill out the following fields to
					register</p>
				<form id="register-form" action="${contextroot}/rest/user"
					method="post">
					<div class="row">
						<div class="form-group field-register-form-username required">
							<label class="control-label" for="name">Username</label> <input
								type="text" id="username" class="form-control"
								name="username" placeholder="Username"><span
								class="glyphicon glyphicon-user form-control-feedback"></span>

							<div class="help-block"></div>
								<div class="error-block "></div>
						</div>
					</div>
					<div class="row">
						<div class="form-group field-register-form-password required">
							<label class="control-label" for="name">Password</label> <input
								type="password" id="password" class="form-control"
								name="password" placeholder="Password"><span
								class="glyphicon glyphicon-lock form-control-feedback"></span>

							<div class="help-block"></div>
								<div class="error-block "></div>
						</div>
					</div>
					<div class="row">
						<div class="form-group field-register-form-password required">
							<label class="control-label" for="name">Confirm Password</label>
							<input type="password" id="confirmPassword"
								class="form-control" name="confirmPassword"
								placeholder="Confirm Password"><span
								class="glyphicon glyphicon-lock form-control-feedback"></span>

							<div class="help-block"></div>
								<div class="error-block "></div>
						</div>
					</div>
					<div class="row">
						<div class="form-group field-register-form-password required">
							<label class="control-label" for="name">Contact Email</label> <input
								type="text" id="contactEmail" class="form-control"
								name="contactEmail" placeholder="Email Address"><span
								class="glyphicon glyphicon-envelope form-control-feedback"></span>

							<div class="help-block"></div>
								<div class="error-block "></div>
						</div>
					</div>
					
					<div class="row" >
					<button type="button" class="btn btn-primary btn-register">Register</button>
					<button type="reset" class="btn btn-default btn-reset">Reset</button>
				</div>

				</form>
			</div>
			<!-- /.login-box-body -->

		</div>
	</section>
</div>
<!-- /.login-box -->

