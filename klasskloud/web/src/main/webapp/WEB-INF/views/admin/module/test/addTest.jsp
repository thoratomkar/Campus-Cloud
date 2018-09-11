<%@include file="../../taglib_includes.jsp"%>
<script type="text/javascript">
	var flag = true;
	$(function() {
		$('.date').datepicker();

		$("#courseId").change(function() {
			$("#batchId").empty();
			var options1 = $("#batchId");
			options1.append(new Option("--- Select Batch ---", ""));
			populateBatches();
		});

		$("#batchId").change(function() {
		});

		
		$('.btn-create').on('click',function(e) {
			if (validate()) {
				var postData = $('#test-form').serializeArray();
				var formURL = $('#test-form').attr("action");
				$.ajax({
					url : formURL,
					type : "POST",
					data : postData,
					success : function(data,textStatus, jqXHR) {
						if (data.status == false) {
							alert("Failed");
						} else {
							alert("Success");
							$(location).attr('href','${contextroot}/test/default/manage');
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


	function populateBatches(){
	 	var ayId = $('#test-form').find('#ayId').val();
		var cId = $('#test-form').find('#courseId').val();
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


	function validate() {
		
		var name = $('#test-form').find('input[name="name"]').val();
		var code = $('#test-form').find('input[name="code"]').val();
		var label = $('#test-form').find('input[name="label"]').val();
		var desc = $('#test-form').find('input[name="description"]').val();
		var testDate = $('#test-form').find('input[name="testDate"]').val();
		var ay = $('#test-form').find('#ayId').val();
		var course = $('#test-form').find('#courseId').val();
		var batch = $('#test-form').find('#batchId').val();
		var subject = $('#test-form').find('#subjectId').val();
		var maxScore = $('#test-form').find('input[name="maxScore"]').val();
		var passingScore = $('#test-form').find('input[name="passingScore"]').val();
		if (name.length == 0) {
			flag = false;
			$('#test-form').find('#name').css('border', '1px solid #CD5C5C')
			$('#test-form').find('#name').siblings('.error-block').text('Name is required field');
		} else {
			$('#test-form').find('#name').css('border', '');
			$('#test-form').find('#name').siblings('.error-block').text('');
		}

		if (code.length == 0) {
			flag = false;
			$('#test-form').find('input[name="code"]').css('border', '1px solid #CD5C5C')
			$('#test-form').find('input[name="code"]').siblings('.error-block').text('Code is required field');
		} else {
			$('#test-form').find('input[name="code"]').css('border', '');
			$('#test-form').find('input[name="code"]').siblings('.error-block').text('');
		}

		if (label.length == 0) {
			flag = false;
			$('#test-form').find('input[name="label"]').css('border', '1px solid #CD5C5C')
			$('#test-form').find('input[name="label"]').siblings('.error-block').text('Label is required field');
		} else {
			$('#test-form').find('input[name="label"]').css('border', '');
			$('#test-form').find('input[name="label"]').siblings('.error-block').text('');
		}

		if (desc.length == 0) {
			flag = false;
			$('#test-form').find('input[name="description"]').css('border', '1px solid #CD5C5C')
			$('#test-form').find('input[name="description"]').siblings('.error-block').text('Description is required field');
		} else {
			$('#test-form').find('input[name="description"]').css('border', '');
			$('#test-form').find('input[name="description"]').siblings('.error-block').text('');
		}


		if (testDate.length == 0) {
			flag = false;
			$('#testDate').css('border', '1px solid #CD5C5C');
			$('#testDate').parent().siblings('.error-block').text('Test Date is required field');
		} else {
			$('#testDate').css('border', '');
			$('#testDate').parent().siblings('.error-block').text('');
		}

		if (ay.length == 0) {
			flag = false;
			$('#test-form').find('#ayId').css('border', '1px solid #CD5C5C');
			$('#test-form').find('#ayId').siblings('.error-block').text('Academic Year is required field');
		} else {
			$('#test-form').find('#ayId').css('border', '');
			$('#test-form').find('#ayId').siblings('.error-block').text('');
		}

		if (course.length == 0) {
			flag = false;
			$('#courseId').css('border', '1px solid #CD5C5C');
			$('#test-form').find('#courseId').siblings('.error-block').text('Course is required field.');
		} else {
			$('#courseId').css('border', '');
			$('#test-form').find('#courseId').siblings('.error-block').text('');
		}


		if (batch.length == 0) {
			flag = false;
			$('#test-form').find('#batchId').css('border', '1px solid #CD5C5C');
			$('#test-form').find('#batchId').siblings('.error-block').text('Batch is required field');
		} else {
			$('#test-form').find('#batchId').css('border', '');
			$('#test-form').find('#batchId').siblings('.error-block').text('');
		}

		if (subject.length == 0) {
			flag = false;
			$('#test-form').find('#subjectId').css('border', '1px solid #CD5C5C');
			$('#test-form').find('#subjectId').siblings('.error-block').text('Subject is required field');
		} else {
			$('#test-form').find('#subjectId').css('border', '');
			$('#test-form').find('#subjectId').siblings('.error-block').text('');
		}

		if (maxScore.length == 0) {
			flag = false;
			$('#test-form').find('#maxScore').css('border', '1px solid #CD5C5C')
			$('#test-form').find('#maxScore').siblings('.error-block').text('Maximum Score is required field');
		} else {
			$('#test-form').find('#maxScore').css('border', '');
			$('#test-form').find('#maxScore').siblings('.error-block').text('');
		}

		if (passingScore.length == 0) {
			flag = false;
			$('#test-form').find('#passingScore').css('border', '1px solid #CD5C5C')
			$('#test-form').find('#passingScore').siblings('.error-block').text('Passing Score is required field');
		} else {
			$('#test-form').find('#passingScore').css('border', '');
			$('#test-form').find('#passingScore').siblings('.error-block').text('');
		}

		return flag;
	}


</script>
<div class="content-wrapper" style="min-height: 100%;">
	<section class="content-header">
		<h1>
			<i class="fa fa-th-list"></i>Manage<small>Tests</small>
		</h1>
		<ul class="breadcrumb">
			<li><a href="${contextroot}/dashboard/secure/home"><i
					class="fa fa-home"></i>Home</a></li>
			<li><a href="${contextroot}/test/default/home">Test Configuration</a></li>
			<li class="active" style="text-transform: capitalize;">${maintab}</li>
		</ul>
	</section>

	<section class="content">
			<div class="box box-primary">
				<div class="box-header with-border">
					<h3 class="box-title">
						<i class="fa fa-plus-square"></i> <span class="header-text">
							Add Test </span>
					</h3>
				</div>

				<form id="test-form"
					action="${contextroot}/rest/tests" method="post">
					<input type="hidden" id="id" name="id" value="" />
					<input type="hidden" id="orgId" name="orgId" value="${context.selectedOrgId}" />
					<div class="box-body">
						<h4 class="page-header" style="font-size: 15px; font-weight: bold;">
							<i class="fa fa-info-circle"></i> <span class="header-text">
							Test Details</span>
						</h4>
						<div class="row">
						
							<div class="col-sm-3">
								<div class="form-group field-name required">
									<label class="control-label" >Name</label> <input
										type="text" id="name" class="form-control" name="name"
										maxlength="50" placeholder="Test Name" data-validation="required">

									<div class="help-block"></div>
									<div class="error-block "></div>
								</div>
							</div>
							<div class="col-sm-3">
								<div class="form-group field-name">
									<label class="control-label" >Code</label> <input
										type="text" id="code" class="form-control" name="code"
										maxlength="50" placeholder="Test Code" data-validation="required">

									<div class="help-block"></div>
									<div class="error-block "></div>
								</div>
							</div>
							<div class="col-sm-3">
								<div class="form-group field-name required">
									<label class="control-label" >Label</label> <input
										type="text" id="label" class="form-control" name="label"
										maxlength="50" placeholder="Test Label" data-validation="required">

									<div class="help-block"></div>
									<div class="error-block "></div>
								</div>
							</div>
							
							<div class="col-sm-3">
								<div class="form-group field-name required">
									<label class="control-label" >Description</label> <input
										type="text" id="description" class="form-control" name="description"
										maxlength="50" placeholder="Test Description" data-validation="required">

									<div class="help-block"></div>
									<div class="error-block "></div>
								</div>
							</div>
							
						</div>
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
									<label class="control-label">Subject</label> <select
										id="subjectId" class="form-control" name="subjectId"
										aria-required="true">
										<option value="">--- Select Subject ---</option>
										<c:forEach items="${SUBJECTLIST}" var="subject">
											<option value="${subject.id}">${subject.name}</option>
										</c:forEach>
									</select>

									<div class="help-block"></div>
									<div class="error-block"></div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-3">
								<label class="control-label">Test Date <span style="color: RED;">*</span>
								</label>
								<div class="input-group date">
									<input type="text" class="form-control" value="" id="testDate"
										name="testDate">
									<div class="input-group-addon">
										<span class="glyphicon glyphicon-th"></span>
									</div>

								</div>
								<div class="help-block"></div>
								<div class="error-block"></div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-3">
								<div class="form-group field-name required">
									<label class="control-label" >Max Score</label> <input
										type="text" id="maxScore" class="form-control" name="maxScore"
										maxlength="50" placeholder="Maximum Test Score" data-validation="required">

									<div class="help-block"></div>
									<div class="error-block "></div>
								</div>
							</div>
							<div class="col-sm-3">
								<div class="form-group field-name required">
									<label class="control-label" >Passing Score</label> <input
										type="text" id="passingScore" class="form-control" name="passingScore"
										maxlength="50" placeholder="Passing Test Score" data-validation="required">

									<div class="help-block"></div>
									<div class="error-block "></div>
								</div>
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