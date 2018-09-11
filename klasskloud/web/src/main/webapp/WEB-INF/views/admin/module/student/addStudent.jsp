<%@include file="../../taglib_includes.jsp"%>
<script type="text/javascript">
	var flag = true;
	var usernameFlag = true;
	var rollNoFlag = true;
	$(function() {
		$('.date').datepicker();

		$("#courseId").change(function() {
			$("#batchId").empty();
			$("#sectionId").empty();
			var options1 = $("#batchId");
			options1.append(new Option("--- Select Batch ---", ""));
			var options2 = $("#sectionId");
			options2.append(new Option("--- Select Section ---", ""));
			populateBatches();
		});

		$("#batchId").change(function() {
			populateSections();
			$("#sectionId").empty()
			var options2 = $("#sectionId");
			options2.append(new Option("--- Select Section ---", ""));
		});

		$("#sectionId").change(function() {
		});

		$("#loginUserName").bind("change", function(e) {
			validateUserName();
		})
		$("#rollNo").bind("change", function(e) {
			validateRollNo();
		})
		
		
		$('.btn-create').on('click',function(e) {
			validate();
			alert(flag);
			if (flag) {
				var postData = $('#students-form').serializeArray();
				var formURL = $('#students-form').attr("action");
				$.ajax({
					url : formURL,
					type : "POST",
					data : postData,
					success : function(data,textStatus, jqXHR) {
						if (data.status == false) {
							alert("Failed");
						} else {
							alert("Success");
							$(location).attr('href','${contextroot}/student/default/manage');
						}
					},
					error : function(jqXHR, textStatus,errorThrown) {
					}
				});
			}
			
		});

		$('.btn-reset').on('click',function(e) {
			$('.error-block').text('');
			$('.form-control').css('border', '');
		});

		

	});

	function validateUserName(){
		 var formURL = "${contextroot}/rest/user/json/check";
		 var loginUserName = $('#students-form').find('#loginUserName').val();
		    $.ajax({
				beforeSend: function(xhrObj){
			        xhrObj.setRequestHeader('Content-Type','application/json');
			        xhrObj.setRequestHeader('Accept','application/json');
			    },
				url : formURL,
				type : 'POST',
				dataType: 'json',
				data : '{"username":"'+loginUserName+'"}',
				success : function(data, textStatus, jqXHR) {
				  if(data.userExists){
                 	$('#students-form').find('input[name="loginUserName"]').css('border', '1px solid #CD5C5C')
         			$('#students-form').find('input[name="loginUserName"]').siblings('.error-block').text('Login/Username is already exists.');   
         			flag = false; 
         			usernameFlag = false;
                 }else{
                 	$('#students-form').find('input[name="loginUserName"]').css('border', '');
         			$('#students-form').find('input[name="loginUserName"]').siblings('.error-block').text('');
         			flag = true;
         			usernameFlag = true;
                 }
				},
				error : function(jqXHR, textStatus, errorThrown) {
				}
			});
	}

	function validateRollNo(){
		var batch = $('#students-form').find('#batchId').val();
		var rollNo = $('#students-form').find('#rollNo').val();
		if(batch != '' && rollNo != ''){
			$.get("${contextroot}/rest/students/rollNo/unique/"+batch+"/"+rollNo,
	              function(data) {
	                if(data.userExists){
	                	$('#students-form').find('input[name="rollNo"]').css('border', '1px solid #CD5C5C')
	        			$('#students-form').find('input[name="rollNo"]').siblings('.error-block').text('Roll No already assigned.');   
	        			flag = false; 
	        			rollNoFlag = false;
	                }else{
	                	$('#students-form').find('input[name="rollNo"]').css('border', '');
	        			$('#students-form').find('input[name="rollNo"]').siblings('.error-block').text('');
	        			flag = true;
	        			rollNoFlag = true;
	                }
	              }
	        );
		}

	}

	function populateBatches(){
	 	var ayId = $('#students-form').find('#ayId').val();
		var cId = $('#students-form').find('#courseId').val();
		if(cId == '' || ayId == ''){
			alert('Please select both academic year and course.')
		}else{
		    $.getJSON("${contextroot}/rest/batch/"+ayId+"/"+cId, function(result) {
				var options = $("#batchId");
				$("#batchId").empty()
				options.append(new Option("--- Select Batch ---", ""));
				$.each(result.list, function(i, v) {
					options.append(new Option(v.name, v.id));
				});
			});
		}
	}

	function populateSections(){
	  	var ayId = $('#students-form').find('#ayId').val();
		var bId = $('#students-form').find('#batchId').val();
		if(bId == '' || ayId == ''){
			alert('Please select both academic year and batch.');
		}else{
		    $.getJSON("${contextroot}/rest/section/"+ayId+"/"+bId, function(result) {
				var options = $("#sectionId");
				$("#sectionId").empty()
				options.append(new Option("--- Select Section ---", ""));
				$.each(result.list, function(i, v) {
					options.append(new Option(v.name, v.id));
				});
			});
		}
	}

	function validate() {
		var loginUserName = $('#students-form').find('#loginUserName').val();
		var title = $('#students-form').find('#title').val();
		var firstName = $('#students-form').find('input[name="firstName"]').val();
		var lastName = $('#students-form').find('input[name="lastName"]').val();
		var gender = $('#students-form').find('#gender').val();
		var emailId = $('#students-form').find('input[name="emailAddress"]').val();
		var contactNumber = $('#students-form').find('input[name="contactNumber"]').val();
		var dob = $('#students-form').find('input[name="dateOfBirth"]').val();
		var ay = $('#students-form').find('#ayId').val();
		var course = $('#students-form').find('#courseId').val();
		var batch = $('#students-form').find('#batchId').val();
		var section = $('#students-form').find('#sectionId').val();
		var enrollDate = $('#students-form').find('#enrollDate').val();
		var rollNo = $('#students-form').find('#rollNo').val();

		if(loginUserName.length == 0){
			flag = false;
			$('#students-form').find('#loginUserName').css('border', '1px solid #CD5C5C')
			$('#students-form').find('#loginUserName').siblings('.error-block').text('Login/Username is required field');
		}else{
			if(flag && usernameFlag){
				validateUserName();
			}
		}
		
		if (title.length == 0) {
			flag = false;
			$('#students-form').find('#title').css('border', '1px solid #CD5C5C')
			$('#students-form').find('#title').siblings('.error-block').text('Title is required field');
		} else {
			$('#students-form').find('#title').css('border', '');
			$('#students-form').find('#title').siblings('.error-block').text('');
		}

		if (firstName.length == 0) {
			flag = false;
			$('#students-form').find('input[name="firstName"]').css('border', '1px solid #CD5C5C')
			$('#students-form').find('input[name="firstName"]').siblings('.error-block').text('First Name is required field');
		} else {
			$('#students-form').find('input[name="firstName"]').css('border', '');
			$('#students-form').find('input[name="firstName"]').siblings('.error-block').text('');
		}

		if (lastName.length == 0) {
			flag = false;
			$('#students-form').find('input[name="lastName"]').css('border', '1px solid #CD5C5C')
			$('#students-form').find('input[name="lastName"]').siblings('.error-block').text('Last Name is required field');
		} else {
			$('#students-form').find('input[name="lastName"]').css('border', '');
			$('#students-form').find('input[name="lastName"]').siblings('.error-block').text('');
		}

		if (gender.length == 0) {
			flag = false;
			$('#students-form').find('#gender').css('border', '1px solid #CD5C5C')
			$('#students-form').find('#gender').siblings('.error-block').text('Gender is required field');
		} else {
			$('#students-form').find('#gender').css('border', '');
			$('#students-form').find('#gender').siblings('.error-block').text('');
		}

		if (emailId.length == 0) {
			flag = false;
			$('#students-form').find('input[name="emailAddress"]').css('border', '1px solid #CD5C5C')
			$('#students-form').find('input[name="emailAddress"]').siblings('.error-block').text('Email Address is required field');
		} else {
			$('#students-form').find('input[name="emailAddress"]').css('border', '');
			$('#students-form').find('input[name="emailAddress"]').siblings('.error-block').text('');
		}

		if (contactNumber.length == 0) {
			flag = false;
			$('#students-form').find('input[name="contactNumber"]').css('border', '1px solid #CD5C5C')
			$('#students-form').find('input[name="contactNumber"]').siblings('.error-block').text('Contact Number is required field');
		} else {
			$('#students-form').find('input[name="contactNumber"]').css('border', '');
			$('#students-form').find('input[name="contactNumber"]').siblings('.error-block').text('');
		}

		if (dob.length == 0) {
			flag = false;
			$('#dateOfBirth').css('border', '1px solid #CD5C5C');
			$('#dateOfBirth').parent().siblings('.error-block').text('Date Of Birth is required field');
		} else {
			$('#dateOfBirth').css('border', '');
			$('#dateOfBirth').parent().siblings('.error-block').text('');
		}

		if (enrollDate.length == 0) {
			flag = false;
			$('#enrollDate').css('border', '1px solid #CD5C5C')
			$('#enrollDate').parent().siblings('.error-block').text('Enroll Date is required field');
		} else {
			$('#enrollDate').css('border', '');
			$('#enrollDate').parent().siblings('.error-block').text('');
		}

		if (rollNo.length == 0) {
			flag = false;
			$('#students-form').find('input[name="rollNo"]').css('border', '1px solid #CD5C5C')
			$('#students-form').find('input[name="rollNo"]').siblings('.error-block').text('Roll No is required field');
		} else {
			if(flag && rollNoFlag){
				validateRollNo();
			}
		}

		if (ay.length == 0) {
			flag = false;
			$('#students-form').find('#ayId').css('border', '1px solid #CD5C5C');
			$('#students-form').find('#ayId').siblings('.error-block').text('Academic Year is required field');
		} else {
			$('#students-form').find('#ayId').css('border', '');
			$('#students-form').find('#ayId').siblings('.error-block').text('');
		}

		if (course.length == 0) {
			flag = false;
			$('#courseId').css('border', '1px solid #CD5C5C');
			$('#students-form').find('#courseId').siblings('.error-block').text('Course is required field.');
		} else {
			$('#courseId').css('border', '');
			$('#students-form').find('#courseId').siblings('.error-block').text('');
		}


		if (batch.length == 0) {
			flag = false;
			$('#students-form').find('#batchId').css('border', '1px solid #CD5C5C');
			$('#students-form').find('#batchId').siblings('.error-block').text('Batch is required field');
		} else {
			$('#students-form').find('#batchId').css('border', '');
			$('#students-form').find('#batchId').siblings('.error-block').text('');
		}

		if (section.length == 0) {
			flag = false;
			$('#students-form').find('#sectionId').css('border', '1px solid #CD5C5C');
			$('#students-form').find('#sectionId').siblings('.error-block').text('Section is required field');
		} else {
			$('#students-form').find('#sectionId').css('border', '');
			$('#students-form').find('#sectionId').siblings('.error-block').text('');
		}


		return flag;
	}


</script>
<c:set var="now" value="<%=new java.util.Date()%>" />
<div class="content-wrapper" style="min-height: 100%;">
	<section class="content-header">
		<h1>
			<i class="fa fa-th-list"></i>Manage<small>Students</small>
		</h1>
		<ul class="breadcrumb">
			<li><a href="${contextroot}/dashboard/secure/home"><i
					class="fa fa-home"></i>Home</a></li>
			<li><a href="${contextroot}/student/default/home">Student Configuration</a></li>
			<li class="active" style="text-transform: capitalize;">${maintab}</li>
		</ul>
	</section>

	<section class="content">
			<div class="box box-primary">
				<div class="box-header with-border">
					<h3 class="box-title">
						<i class="fa fa-plus-square"></i> <span class="header-text">
							Add Student </span>
					</h3>
				</div>

				<form id="students-form"
					action="${contextroot}/rest/students" method="post">
					<input type="hidden" id="id" name="id" value="" />
					<input type="hidden" id="orgId" name="orgId" value="${context.selectedOrgId}" />
					<div class="box-body">
						<h4 class="page-header" style="font-size: 15px; font-weight: bold;">
							<i class="fa fa-info-circle"></i> <span class="header-text">
							Student Details</span>
						</h4>
						
						<div class="row">
							<div class="col-sm-3">
								<div class="form-group field-name required">
									<label class="control-label" >Login/User Name</label> <input
										type="text" id="loginUserName" class="form-control" name="loginUserName"
										maxlength="50" placeholder="Username" data-validation="required">

									<div class="help-block"></div>
									<div class="error-block "></div>
								</div>
							</div>
						</div>
						<div class="row">
						
							<div class="col-sm-3">
								<div class="form-group field-name required">
									<label class="control-label" >Title</label> <select
										id="title" class="form-control"
										name="title">
										<option value="">--- Select Title ---</option>
										<option value="Mr.">Mr.</option>
										<option value="Mrs.">Mrs.</option>
										<option value="Ms.">Ms.</option>
									</select>
									<div class="help-block"></div>
									<div class="error-block "></div>
								</div>
							</div>
						
							<div class="col-sm-3">
								<div class="form-group field-name required">
									<label class="control-label" >First Name</label> <input
										type="text" id="firstName" class="form-control" name="firstName"
										maxlength="50" placeholder="First Student" data-validation="required">

									<div class="help-block"></div>
									<div class="error-block "></div>
								</div>
							</div>
							<div class="col-sm-3">
								<div class="form-group field-name">
									<label class="control-label" >Middle Name</label> <input
										type="text" id="middleName" class="form-control" name="middleName"
										maxlength="50" placeholder="Middle Name" data-validation="required">

									<div class="help-block"></div>
									<div class="error-block "></div>
								</div>
							</div>
							<div class="col-sm-3">
								<div class="form-group field-name required">
									<label class="control-label" >Last Name</label> <input
										type="text" id="lastName" class="form-control" name="lastName"
										maxlength="50" placeholder="Last Name" data-validation="required">

									<div class="help-block"></div>
									<div class="error-block "></div>
								</div>
							</div>
							
						</div>
						<div class="row">
							<div class="col-sm-3">
								<div class="form-group field-name required">
									<label class="control-label" >Gender</label> <select
										id="gender" class="form-control"
										name="gender">
										<option value="">--- Select Gender ---</option>
										<option value="Male">Male</option>
										<option value="Female">Female</option>
										<option value="Other">Other</option>
									</select>
									<div class="help-block"></div>
									<div class="error-block "></div>
								</div>
							</div>
							<div class="col-sm-3">
								<div class="form-group field-code required">
									<label class="control-label" >Email Id</label> <input
										type="text" id="emailAddress" class="form-control" name="emailAddress"
										maxlength="50" placeholder="Email Address" data-validation="required">

									<div class="help-block"></div>
									<div class="error-block "></div>
								</div>
							</div>
							<div class="col-sm-3">
								<div class="form-group field-code required">
									<label class="control-label" >Contact Number</label> <input
										type="text" id="contactNumber" class="form-control" name="contactNumber"
										maxlength="50" placeholder="Contact Number" data-validation="required">

									<div class="help-block"></div>
									<div class="error-block "></div>
								</div>
							</div>				
							
							<div class="col-sm-3">
								<label class="control-label">Date Of Birth <span style="color: RED;">*</span>
								</label>
								<div class="input-group date required">
									<input type="text" class="form-control" value="" id="dateOfBirth"
										name="dateOfBirth">
									<div class="input-group-addon">
										<span class="glyphicon glyphicon-th"></span>
									</div>

								</div>
								<div class="help-block"></div>
								<div class="error-block"></div>
							</div>
									
						</div>
						<h4 class="page-header" style="font-size: 15px; font-weight: bold;">
							<i class="fa fa-info-circle"></i> <span class="header-text">Academic Details </span>
						</h4>
						<div class="row">

							<div class="col-sm-3">
								<div class="form-group required">
									<label class="control-label">Academic Year</label> <select
										id="ayId" class="form-control" name="ayId"
										aria-required="true">
										<option value="">--- Select Academic Year ---</option>
										<c:forEach items="${AYLIST}" var="ay">
											<option value="${ay.id}">${ay.name}</option>
										</c:forEach>
									</select>

									<div class="help-block"></div>
									<div class="error-block"></div>
								</div>
							</div>

							<div class="col-sm-3">
								<div class="form-group required">
									<label class="control-label" >Course </label> <select
										id="courseId" class="form-control" name="courseId"
										aria-required="true">
										<option value="">--- Select Course ---</option>
										<c:forEach items="${COURSELIST}" var="course">
											<option value="${course.id}">${course.name}</option>
										</c:forEach>
									</select>

									<div class="help-block"></div>
									<div class="error-block "></div>
								</div>
							</div>
							<div class="col-sm-3">
								<div class="form-group required">
									<label class="control-label">Batch
										</label> <select id="batchId" class="form-control"
										name="batchId" aria-required="true">
										<option value="">--- Select Batch ---</option>
									</select>

									<div class="help-block"></div>
									<div class="error-block "></div>
								</div>
							</div>
							<div class="col-sm-3">
								<div class="form-group required">
									<label class="control-label" for="courseId">Section
										</label> <select id="sectionId" class="form-control"
										name="sectionId" aria-required="true">
										<option value="">--- Select Section ---</option>
									</select>

									<div class="help-block"></div>
									<div class="error-block "></div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-3">
								<div class="form-group field-code required">
									<label class="control-label" >Roll No</label> <input
										type="text" id="rollNo" class="form-control" name="rollNo"
										maxlength="50" placeholder="Roll No" data-validation="required">

									<div class="help-block"></div>
									<div class="error-block "></div>
								</div>
							</div>
							<div class="col-sm-3">
								<label class="control-label">Enrollment Date <span style="color: RED;">*</span>
								</label>
								<div class="input-group date">
									<input type="text" class="form-control" value="<fmt:formatDate pattern='MM-dd-yyyy' 
            value='${now}' />" id="enrollDate"
										name="enrollDate">
									<div class="input-group-addon">
										<span class="glyphicon glyphicon-th"></span>
									</div>

								</div>
								<div class="help-block"></div>
								<div class="error-block"></div>
							</div>
						</div>
					</div>
					<!-- /.box-body -->

					<div class="box-footer">
						<button type="button" class="btn btn-primary btn-create">Create</button>
						<button type="reset" class="btn btn-default btn-reset">Reset</button>
					</div>
					<!-- /.box-footer-->

				</form>
			</div>
	</section>
</div>