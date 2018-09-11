<%@include file="../../taglib_includes.jsp"%>
<script type="text/javascript">
	$(function() {
		$('.date').datepicker();

		$('.btn-create').on('click',
			function(e) {
				if (validate()) {
					var postData = $('#batch-form').serializeArray();
					var formURL = $('#batch-form').attr("action");
					$.ajax({
						url : formURL,
						type : "POST",
						data : postData,
						success : function(data,textStatus, jqXHR) {
							if (data.status == false) {
								alert(data.statusText);
							} else {
								$(location).attr('href','${contextroot}/batch/default/home');
							}
						},
						error : function(jqXHR, textStatus,errorThrown) {
						}
					});
				}
		});
	});

	$('.btn-reset, .close').on('click',function(e) {
		$("#batch-form")[0].reset();
	});

	function validate() {
		var flag = true;
		var name = $('#batch-form').find('input[name="name"]').val();
		var code = $('#batch-form').find('input[name="code"]').val();
		var label = $('#batch-form').find('input[name="label"]').val();
		var startDate = $('#batch-form').find('input[name="startDate"]').val();
		var endDate = $('#batch-form').find('input[name="endDate"]').val();
		var ay = $('#batch-form').find('#ayId').val();
		var course = $('#batch-form').find('#courseId').val();

		if (name.length == 0) {
			flag = false;
			$('#batch-form').find('input[name="name"]').css('border', '1px solid #CD5C5C')
			$('#batch-form').find('input[name="name"]').siblings('.error-block').text('Name is required field');
		} else {
			$('#batch-form').find('input[name="name"]').css('border', '');
			$('#batch-form').find('input[name="name"]').siblings('.error-block').text('');
		}

		if (code.length == 0) {
			flag = false;
			$('#code').css('border', '1px solid #CD5C5C');
			$('#batch-form').find('#code').siblings('.error-block').text('Code is required field');
		} else {
			$('#code').css('border', '');
			$('#batch-form').find('#code').siblings('.error-block').text('');
		}

		if (label.length == 0) {
			flag = false;
			$('#label').css('border', '1px solid #CD5C5C');
			$('#batch-form').find('#label').siblings('.error-block').text('Label is required field');
		} else {
			$('#label').css('border', '');
			$('#batch-form').find('#label').siblings('.error-block').text('');
		}

		if (startDate.length == 0) {
			flag = false;
			$('#startDate').css('border', '1px solid #CD5C5C');
			$('#startDate').parent().siblings('.error-block').text('Start Date is required field');
		} else {
			$('#startDate').css('border', '');
			$('#startDate').parent().siblings('.error-block').text('');
		}

		if (endDate.length == 0) {
			flag = false;
			$('#endDate').css('border', '1px solid #CD5C5C');
			$('#endDate').parent().siblings('.error-block').text('End Date is required field');
		} else {
			$('#code').css('border', '');
			$('#batch-form').find('#endDate').siblings('.error-block').text('');
		}

		if (ay.length == 0) {
			flag = false;
			$('#batch-form').find('#ayId').css('border', '1px solid #CD5C5C');
			$('#batch-form').find('#ayId').siblings('.error-block').text('Academic Year is required field');
		} else {
			$('#batch-form').find('#ayId').css('border', '');
			$('#batch-form').find('#ayId').siblings('.error-block').text('');
		}

		if (course.length == 0) {
			flag = false;
			$('#courseId').css('border', '1px solid #CD5C5C');
			$('#batch-form').find('#courseId').siblings('.error-block').text('Course is required field.');
		} else {
			$('#courseId').css('border', '');
			$('#batch-form').find('#courseId').siblings('.error-block').text('');
		}

		
		return flag;
	}
</script>

<div class="modal-dialog">
	<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true">&times;</button>
			<h4 class="modal-title">
				<i class="fa fa-plus-square"></i> Create Batch
			</h4>
		</div>
		<form id="batch-form" action="${contextroot}/rest/batch" method="post">
			<input type="hidden" id="id" name="id" value="" /> <input
				type="hidden" id="orgId" name="orgId"
				value="${context.selectedOrgId}" />
			<div class="modal-body box-body">
				<div class="row">
					<div class="col-sm-6">
						<div
							class="form-group field-batches-batch_academic_year_id required">
							<label class="control-label" for="batches-batch_academic_year_id">Academic
								Year</label> <select id="ayId" class="form-control" name="ayId"
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
					<div class="col-sm-6">
						<div class="form-group field-batches-batch_course_id required">
							<label class="control-label" for="courseId">Batch Course
							</label> <select id="courseId" class="form-control" name="courseId"
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
				</div>
				<div class="row">
					<div class="col-sm-6">
						<div class="form-group field-batches-batch_name required">
							<label class="control-label" for="batches-batch_name">Batch
								Name</label> <input type="text" id=" name" class="form-control"
								name="name" maxlength="100" placeholder="Enter Batch Name"
								aria-required="true" data-validation="required">

							<div class="help-block"></div>
							<div class="error-block"></div>
						</div>
					</div>
					<div class="col-sm-6">
						<div class="form-group field-batches-batch_alias required">
							<label class="control-label" for="batches-batch_alias">Batch
								Label</label> <input type="text" id="label" class="form-control"
								name="label" maxlength="35" placeholder="Enter Batch Label"
								aria-required="true">

							<div class="help-block"></div>
							<div class="error-block"></div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-6">
						<div class="form-group field-batches-batch_alias required">
							<label class="control-label" for="batches-batch_alias">Batch
								Code</label> <input type="text" id="code" class="form-control"
								name="code" maxlength="35" placeholder="Enter Batch Code"
								aria-required="true">

							<div class="help-block"></div>
							<div class="error-block"></div>
						</div>
					</div>
					<div class="col-sm-6">

						<div class="form-group field-batches-batch_alias">
							<label class="control-label" for="batches-batch_alias">Batch
								Description</label> <input type="text" id="description"
								class="form-control" name="description" maxlength="35"
								placeholder="Enter Batch Description" aria-required="true">

							<div class="help-block"></div>
							<div class="error-block"></div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-6 ">
						<label class="control-label" for="batches-batch_start_date">Batch
							Start Date <span style="color: RED;">*</span></label>
						<div class="input-group date">
							<input type="text" class="form-control" value="" id="startDate" name="startDate">
							<div class="input-group-addon">
								<span class="glyphicon glyphicon-th"></span>
							</div>
							
						</div>
						<div class="help-block"></div>
						<div class="error-block"></div>
					</div>
					<div class="col-sm-6">
						<label class="control-label" for="batches-batch_end_date">Batch
							End Date <span style="color: RED;">*</span></label>
						<div class="input-group date">
							<input type="text" class="form-control" value="" id="endDate" name="endDate">
							<div class="input-group-addon">
								<span class="glyphicon glyphicon-th"></span>
							</div>
						</div>
						<div class="help-block"></div>
						<div class="error-block"></div>
					</div>
				</div>

			</div>
		</form>
		<div class="modal-footer">
			<button type="button" class="btn btn-primary btn-create">Create</button>
			<button type="reset" class="btn btn-default btn-reset">Reset</button>
		</div>
	</div>
</div>