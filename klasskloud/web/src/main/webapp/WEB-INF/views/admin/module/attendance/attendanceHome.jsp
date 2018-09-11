<%@include file="../../taglib_includes.jsp"%>
<script type="text/javascript">
	$(function() {
		$.fn.dataTable.ext.errMode = 'none';
		$('.btn-create').on(
				'click',
				function(e) {

					var postData = $('#attendance-form').serializeArray();
					var formURL = $('#attendance-form').attr("action");
					$.ajax({
						url : formURL,
						type : "POST",
						data : postData,
						success : function(data, textStatus, jqXHR) {
							if (data.status == false) {
								alert("Failed");
							} else {
								alert("Success");
								$(location).attr('href',
										'${contextroot}/attendance/default/home');
							}
						},
						error : function(jqXHR, textStatus, errorThrown) {
						}
					});

				});

		$('.btn-reset').on(
				'click',
				function(e) {
					if ($(this).text() == 'Cancel') {
						$('#attendance-form').find('input[name="rollno"]').attr('value', '');
						$('#attendance-form').find('input[name="sub"]').attr('value', '');
						$('#attendance-form').find('input[name="w1"]').attr('value', '');
						$('#attendance-form').find('input[name="w2"]').attr('value', '');
						$('#attendance-form').find('input[name="w3"]').attr('value','');
						$('#attendance-form').find('input[name="w4"]').attr('value','');
						$('#attendance-form').find('input[name="w5"]').attr('value','');
						$('#attendance-form').find('input[name="w6"]').attr('value','');
						$('#attendance-form').find('input[name="w7"]').attr('value','');
						$('#attendance-form').find('input[name="w8"]').attr('value','');
						$('#attendance-form').find('input[name="w9"]').attr('value','');
						$('.box-primary').find('.box-title').find('i')
								.removeClass('fa-pencil-square');
						$('.box-primary').find('.box-title').find('i')
								.addClass('fa-plus-square');
						$('.box-primary').find('.box-title').find('span').text(
								'Add Marks');
						$('.btn-reset').text('Reset');
						$('.btn-create').text('Create');
					} else {
						$('.error-block').text('');
						$('.form-control').css('border', '');
					}
				});

		$('#example')
				.on(
						'click',
						'a',
						function(e) {
							var op = $(this).attr("class");
							var row = $(this).closest('tr');
							var data = $('#example').dataTable().fnGetData(row);
							var id = data.id;
							if (op == 'ajaxDelete') {
								$
										.confirm({
											title : "<strong>Delete confirmation</strong>",
											text : "Do you really want to delete this student?",
											confirmButton : "Yes",
											cancelButton : "Cancel",
											confirm : function() {
												$
														.ajax({
															url : '${contextroot}/rest/attendance/'
																	+ data.id,
															type : 'DELETE',
															success : function(
																	data,
																	textStatus,
																	jqXHR) {
																$('#example')
																		.dataTable()
																		.fnDeleteRow(
																				row
																						.index());
															},
															error : function(
																	jqXHR,
																	textStatus,
																	errorThrown) {
															}
														});
											},
											cancel : function() {
											}
										});
							} else if (op == 'ajaxEdit') {
								$
										.ajax({
											url : '${contextroot}/rest/attendance/'
													+ data.id,
											type : 'GET',
											success : function(data,
													textStatus, jqXHR) {
												if (data.status == true) {
													$('.box-primary').find(
															'.box-title').find(
															'i').removeClass(
															'fa-plus-square');
													$('.box-primary').find(
															'.box-title').find(
															'i').addClass(
															'fa-pencil-square');
													$('.box-primary').find(
															'.box-title').find(
															'span').text(
															'Edit Marks');
													$('#attendance-form')
															.find(
																	'input[name="rollno"]')
															.attr(
																	'value',
																	data.object.rollno);
													$('#attendance-form')
															.find(
																	'input[name="sub"]')
															.attr(
																	'value',
																	data.object.sub);
													$('#attendance-form')
															.find(
																	'input[name="w1"]')
															.attr(
																	'value',
																	data.object.w1);
													$('#attendance-form')
															.find(
																	'input[name="w2"]')
															.attr(
																	'value',
																	data.object.w2);
													$('#attendance-form')
															.find(
																	'input[name="w3"]')
															.attr(
																	'value',
																	data.object.w3);
													$('#attendance-form')
															.find(
																	'input[name="w4"]')
															.attr(
																	'value',
																	data.object.w4);
													$('#attendance-form')
															.find(
																	'input[name="w5"]')
															.attr(
																	'value',
																	data.object.w5);
													$('#attendance-form')
													.find(
															'input[name="w6"]')
													.attr(
															'value',
															data.object.w6);
													$('#attendance-form')
													.find(
															'input[name="w7"]')
													.attr(
															'value',
															data.object.w7);
													$('#attendance-form')
													.find(
															'input[name="w8"]')
													.attr(
															'value',
															data.object.w8);
													$('#attendance-form')
													.find(
															'input[name="w9"]')
													.attr(
															'value',
															data.object.w9);
													$('#attendance-form')
															.find(
																	'input[name="id"]')
															.attr(
																	'value',
																	data.object.id);
													$('.btn-create').text(
															'Update');
													$('.btn-reset').text(
															'Cancel');
												}
											},
											error : function(jqXHR, textStatus,
													errorThrown) {
											}
										});

							} else {

							}
							e.preventDefault();
						});

	});

	$('#getlist').on(
			'click',
			function(e) {
				var sec = $("#sectionId").val();
				var sub = $("#subjectId").val();
				$('#example')
				.DataTable(
						{
							//"processing":true,
							"ajax" : "${contextroot}/rest/attendance/"+sec+"/"+sub,
							"columns" : [ {"data" : "id"}, 
							              {"data" : "rollno"}, 
							              {"data" : "sub"}, 
							              {"data" : "w1"}, 
							              {"data" : "w2"}, 
							              {"data" : "w3"}, 
							              {"data" : "w4"}, 
							              {"data" : "w5"}, 
							              {"data" : "w6"}, 
							              {"data" : "w7"}, 
							              {"data" : "w8"}, 
							              {"data" : "w9"}, 
							              {"" : "","width" : "5%"} ],
							'order' : [],
							'aoColumnDefs' : [
									{
										"targets" : [ 0 ],
										"visible" : false,
										"searchable" : false
									},
									{
										'bSortable' : false,
										'aTargets' : [ -1 ],
										"defaultContent" : "<a href='#' class='ajaxEdit' title='Edit'><span class='glyphicon glyphicon-pencil'></a>&nbsp;</span> <a href='#' class='ajaxDelete' title='Delete'> <span class='glyphicon glyphicon-remove' style='color:RED;'></span></a>"
									/* 1st one, start by the right */
									} ]
						});
			});


	function validate() {
		var flag = true;
		var roll = $('#marks-form').find('input[name="rollno"]').val();
		var sub = $('#marks-form').find('input[name="sub"]').val();
		if (name.length == 0) {
			flag = false;
			$('#rollno').css('border', '1px solid #CD5C5C');
			$('#marks-form').find('#rollno').siblings('.error-block').text(
					'Name is required field');
		} else {
			$('#rollno').css('border', '');
			$('#marks-form').find('#rollno').siblings('.error-block').text('');
		}

		if (sub.length == 0) {
			flag = false;
			$('#sub').css('border', '1px solid #CD5C5C');
			$('#marks-form').find('#sub').siblings('.error-block').text(
					'Code is required field');
		} else {
			$('#sub').css('border', '');
			$('#marks-form').find('#sub').siblings('.error-block').text('');
		}

		return flag;
	}
</script>

<div class="content-wrapper" style="min-height: 100%;">
	<section class="content-header">
		<h1>
			<i class="fa fa-th-list"></i>Manage<small>Attendance</small>
		</h1>
		<ul class="breadcrumb">
			<li><a href="${contextroot}/dashboard/secure/home"><i
					class="fa fa-home"></i>Home</a></li>
			<li><a href="${contextroot}/student/default/home">Student Configuration</a></li>
			<li class="active" style="text-transform: capitalize;">${maintab}</li>
		</ul>
	</section>

	<section class="content">
		<security:authorize ifAllGranted="CREATE_ORG">

			<div class="box box-primary">
				<div class="box-header with-border">
					<h3 class="box-title">
						<i class="fa fa-plus-square"></i> <span class="header-text">
							Add Attendance </span>
					</h3>
				</div>

				<form id="attendance-form" action="${contextroot}/rest/attendance"
					method="post">
					
					<input type="hidden" id="id" name="id" value="" />
					<div class="box-body">
						<div class="row">
							<div class="col-sm-3">
								<div class="form-group field-code required">
									<label class="control-label" for="sectionId">Section</label> 
									<select id="sectionId" class="form-control"
										name="sectionId" data-validation="required">
										<option value="">--- Select Section ---</option>
										<c:forEach items="${SECTIONS}" var="section">
											<option value="${section.id}">${section.name}
											</option>
										</c:forEach>
									</select>
									<div class="help-block"></div>
									<div class="error-block "></div>
								</div>
							</div>
							<div class="col-sm-3">
								<div class="form-group field-code required">
									<label class="control-label" for="ayId">Academic Year</label> 
									<select id="ayId" class="form-control"
										name="ayId" data-validation="required">
										<option value="">--- Select Academic Year ---</option>
										<c:forEach items="${YEARS}" var="year">
											<option value="${year.id}">${year.name}
											</option>
										</c:forEach>
									</select>
									<div class="help-block"></div>
									<div class="error-block "></div>
								</div>
							</div>						
							<div class="col-sm-3">
								<div class="form-group field-code required">
									<label class="control-label" for="courseId">Course</label> 
									<select id="courseId" class="form-control"
										name="courseId" data-validation="required">
										<option value="">--- Select Subject ---</option>
										<c:forEach items="${COURSES}" var="course">
											<option value="${course.id}">${course.name}
											</option>
										</c:forEach>
									</select>
									<div class="help-block"></div>
									<div class="error-block "></div>
								</div>
							</div>						
							<div class="col-sm-3">
								<div class="form-group field-code required">
									<label class="control-label" for="batchId">Batch</label> 
									<select id="batchId" class="form-control"
										name="batchId" data-validation="required">
										<option value="">--- Select Batch ---</option>
										<c:forEach items="${BATCHES}" var="batch">
											<option value="${batch.id}">${batch.name}
											</option>
										</c:forEach>
									</select>
									<div class="help-block"></div>
									<div class="error-block "></div>
								</div>
							</div>						
						</div>
						<div class="row">
							<div class="col-sm-3">
								<div class="form-group field-code required">
									<label class="control-label" for="studentId">Student
										Name</label> <select id="studentId" class="form-control"
										name="studentId" data-validation="required">
										<option value="">--- Select Student ---</option>
										<c:forEach items="${STUDENTS}" var="student">
											<option value="${student.id}">${student.fullName}
											</option>
										</c:forEach>
									</select>
									<div class="help-block"></div>
									<div class="error-block "></div>
								</div>
							</div>
							<div class="col-sm-3">
								<div class="form-group field-code required">
									<label class="control-label" for="subjectId">Subject</label> 
									<select id="subjectId" class="form-control"
										name="subjectId" data-validation="required">
										<option value="">--- Select Subject ---</option>
										<c:forEach items="${SUBJECTS}" var="subject">
											<option value="${subject.id}">${subject.name}
											</option>
										</c:forEach>
									</select>
									<div class="help-block"></div>
									<div class="error-block "></div>
								</div>
							</div>						
							
						</div>
						<div class="row">
							<div class="col-sm-3">
								<div class="form-group field-code required">
									<label class="control-label" for="w1">Lecture 1</label> <input
										type="text" id="w1" class="form-control" name="w1"
										maxlength="50" placeholder="Lecture 1">

									<div class="help-block"></div>
									<div class="error-block "></div>
								</div>
							</div>
							<div class="col-sm-3">
								<div class="form-group field-code required">
									<label class="control-label" for="w2">Lecture 2</label> <input
										type="text" id="w2" class="form-control" name="w2"
										maxlength="50" placeholder="Lecture 2">

									<div class="help-block"></div>
									<div class="error-block "></div>
								</div>
							</div>
							<div class="col-sm-3">
								<div class="form-group field-name required">
									<label class="control-label" for="w3">Lecture 3</label> <input
										type="text" id="w3" class="form-control" name="w3"
										maxlength="50" placeholder="Lecture 3">

									<div class="help-block"></div>
									<div class="error-block "></div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-3">
								<div class="form-group field-code required">
									<label class="control-label" for="w4">Lecture 4</label> <input
										type="text" id="w4" class="form-control" name="w4"
										maxlength="50" placeholder="Lecture 4">

									<div class="help-block"></div>
									<div class="error-block "></div>
								</div>
							</div>
							<div class="col-sm-3">
								<div class="form-group field-code required">
									<label class="control-label" for="w5">Lecture 5</label> <input
										type="text" id="w5" class="form-control" name="w5"
										maxlength="50" placeholder="Lecture 5">

									<div class="help-block"></div>
									<div class="error-block "></div>
								</div>
							</div>
							<div class="col-sm-3">
								<div class="form-group field-code required">
									<label class="control-label" for="w6">Lecture 6</label> <input
										type="text" id="w6" class="form-control" name="w6"
										maxlength="50" placeholder="Lecture 6">

									<div class="help-block"></div>
									<div class="error-block "></div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-3">
								<div class="form-group field-code required">
									<label class="control-label" for="w7">Lecture 7</label> <input
										type="text" id="w7" class="form-control" name="w7"
										maxlength="50" placeholder="Lecture 7">

									<div class="help-block"></div>
									<div class="error-block "></div>
								</div>
							</div>
							<div class="col-sm-3">
								<div class="form-group field-code required">
									<label class="control-label" for="w8">Lecture 8</label> <input
										type="text" id="w8" class="form-control" name="w8"
										maxlength="50" placeholder="Lecture 8">

									<div class="help-block"></div>
									<div class="error-block "></div>
								</div>
							</div>
							<div class="col-sm-3">
								<div class="form-group field-code required">
									<label class="control-label" for="w9">Lecture 9</label> <input
										type="text" id="w9" class="form-control" name="w9"
										maxlength="50" placeholder="Lecture 9">

									<div class="help-block"></div>
									<div class="error-block "></div>
								</div>
							</div>
						</div>
					</div>
					<!-- /.box-body -->

					<div class="box-footer">
						<button type="button" id="getlist" name="getlist" class="btn btn-primary">Get List</button>
						<button type="button" class="btn btn-primary btn-create">Create</button>
						<button type="reset" class="btn btn-default btn-reset">Reset</button>
					</div>
					<!-- /.box-footer-->

				</form>
			</div>
		</security:authorize>
		<div class="box box-info">
			<div class="box-header with-border">
				<h3 class="box-title">
					<i class="fa fa-search"></i> View Attendance
				</h3>
			</div>

			<div class="box-body table-responsive">
				<table id="example" class="table table-striped table-bordered"
					cellspacing="0" width="100%">
					<thead>
						<tr>
							<th>Id</th>
							<th>Roll No</th>
							<th>Subject</th>
							<th>Week 1</th>
							<th>Week 2</th>
							<th>Week 3</th>
							<th>Week 4</th>
							<th>Week 5</th>
							<th>Week 6</th>
							<th>Week 7</th>
							<th>Week 8</th>
							<th>Week 9</th>
							<th>Manage</th>
						</tr>
					</thead>
				</table>

			</div>

		</div>
	</section>
</div>