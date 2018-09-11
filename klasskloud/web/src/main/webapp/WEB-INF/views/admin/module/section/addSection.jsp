<%@include file="../../taglib_includes.jsp"%>
<script type="text/javascript">
	$(function() {
		$('.date').datepicker();

		$('.btn-create').on('click',
			function(e) {
				if (validate()) {
					var postData = $('#section-form').serializeArray();
					var formURL = $('#section-form').attr("action");
					$.ajax({
						url : formURL,
						type : "POST",
						data : postData,
						success : function(data,textStatus, jqXHR) {
							if (data.status == false) {
								alert(data.statusText);
							} else {
								$(location).attr('href','${contextroot}/section/default/home');
							}
						},
						error : function(jqXHR, textStatus,errorThrown) {
						}
					});
				}
		});
	});

	$('.btn-reset, .close').on('click',function(e) {
		$("#section-form")[0].reset();
	});

	function validate() {
		var flag = true;
		var name = $('#section-form').find('input[name="name"]').val();
		var code = $('#section-form').find('input[name="code"]').val();
		var label = $('#section-form').find('input[name="label"]').val();
		var ay = $('#section-form').find('#ayId').val();
		var batch = $('#section-form').find('#batchId').val();

		if (name.length == 0) {
			flag = false;
			$('#section-form').find('input[name="name"]').css('border', '1px solid #CD5C5C')
			$('#section-form').find('input[name="name"]').siblings('.error-block').text('Name is required field');
		} else {
			$('#section-form').find('input[name="name"]').css('border', '');
			$('#section-form').find('input[name="name"]').siblings('.error-block').text('');
		}

		if (code.length == 0) {
			flag = false;
			$('#code').css('border', '1px solid #CD5C5C');
			$('#section-form').find('#code').siblings('.error-block').text('Code is required field');
		} else {
			$('#code').css('border', '');
			$('#section-form').find('#code').siblings('.error-block').text('');
		}

		if (label.length == 0) {
			flag = false;
			$('#label').css('border', '1px solid #CD5C5C');
			$('#section-form').find('#label').siblings('.error-block').text('Label is required field');
		} else {
			$('#label').css('border', '');
			$('#section-form').find('#label').siblings('.error-block').text('');
		}


		if (ay.length == 0) {
			flag = false;
			$('#section-form').find('#ayId').css('border', '1px solid #CD5C5C');
			$('#section-form').find('#ayId').siblings('.error-block').text('Academic Year is required field');
		} else {
			$('#section-form').find('#ayId').css('border', '');
			$('#section-form').find('#ayId').siblings('.error-block').text('');
		}

		if (batch.length == 0) {
			flag = false;
			$('#batchId').css('border', '1px solid #CD5C5C');
			$('#section-form').find('#batchId').siblings('.error-block').text('Batch is required field.');
		} else {
			$('#batchId').css('border', '');
			$('#section-form').find('#batchId').siblings('.error-block').text('');
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
				<i class="fa fa-plus-square"></i> Create Section
			</h4>
		</div>
		<form id="section-form" action="${contextroot}/rest/section" method="post">
			<input type="hidden" id="id" name="id" value="" /> <input
				type="hidden" id="orgId" name="orgId"
				value="${context.selectedOrgId}" />
			<div class="modal-body box-body">
				<div class="row">
					<div class="col-sm-6">
						<div
							class="form-group field-sections-section_academic_year_id required">
							<label class="control-label" for="sections-section_academic_year_id">Academic
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
						<div class="form-group field-sections-section_course_id required">
							<label class="control-label" for="courseId">Section Batch
							</label> <select id="batchId" class="form-control" name="batchId"
								aria-required="true">
								<option value="">--- Select Batch ---</option>
								<c:forEach items="${BATCHLIST}" var="batch">
									<option value="${batch.id}">${batch.name}</option>
								</c:forEach>
							</select>

							<div class="help-block"></div>
							<div class="error-block "></div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-6">
						<div class="form-group field-sections-section_name required">
							<label class="control-label" for="sections-section_name">Section
								Name</label> <input type="text" id=" name" class="form-control"
								name="name" maxlength="100" placeholder="Enter Section Name"
								aria-required="true" data-validation="required">

							<div class="help-block"></div>
							<div class="error-block"></div>
						</div>
					</div>
					<div class="col-sm-6">
						<div class="form-group field-sections-section_alias required">
							<label class="control-label" for="sections-section_alias">Section
								Label</label> <input type="text" id="label" class="form-control"
								name="label" maxlength="35" placeholder="Enter Section Label"
								aria-required="true">

							<div class="help-block"></div>
							<div class="error-block"></div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-6">
						<div class="form-group field-sections-section_alias required">
							<label class="control-label" for="sections-section_alias">Section
								Code</label> <input type="text" id="code" class="form-control"
								name="code" maxlength="35" placeholder="Enter Section Code"
								aria-required="true">

							<div class="help-block"></div>
							<div class="error-block"></div>
						</div>
					</div>
					<div class="col-sm-6">

						<div class="form-group field-sections-section_alias">
							<label class="control-label" for="sections-section_alias">Section
								Description</label> <input type="text" id="description"
								class="form-control" name="description" maxlength="35"
								placeholder="Enter Section Description" aria-required="true">

							<div class="help-block"></div>
							<div class="error-block"></div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-6">
						<div class="form-group field-sections-section_alias">
							<label class="control-label" for="sections-section_alias">Section
								Intake</label> <input type="text" id="intake" class="form-control"
								name="intake" maxlength="35" placeholder="Enter Section Intake"
								aria-required="true">

							<div class="help-block"></div>
							<div class="error-block"></div>
						</div>
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