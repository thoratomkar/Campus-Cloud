<%@include file="../../taglib_includes.jsp"%>
<script type="text/javascript">
	$(function() {
		$.fn.dataTable.ext.errMode = 'none';
		fetchList();
		$('.btn-create').on('click',function(e) {
							
								var postData = $('#timetable-form').serializeArray();
								var formURL = $('#timetable-form').attr("action");
								$.ajax({
											url : formURL,
											type : "POST",
											data : postData,
											success : function(data,
													textStatus, jqXHR) {
												if (data.status == false) {
													alert("Failed");
												} else {
													alert("Success");
													$(location)
															.attr('href',
																	'${contextroot}/timetable/default/home');
												}
											},
											error : function(jqXHR, textStatus,
													errorThrown) {
												alert("Something went wrong.");
											}
										});
							
						});

		$('.btn-reset').on(
				'click',
				function(e) {
					if ($(this).text() == 'Cancel') {
						$('#timetable-form').find('input[name="classid"]')
								.attr('value', '');
						$('#timetable-form').find('input[name="day"]')
								.attr('value', '');
						$('#timetable-form').find('input[name="slot1"]')
						.attr('value', '');
						$('#timetable-form').find('input[name="slot2"]')
						.attr('value', '');
						$('#timetable-form').find('input[name="slot3"]')
						.attr('value', '');
						$('#timetable-form').find('input[name="slot4"]')
						.attr('value', '');
						$('#timetable-form').find('input[name="slot5"]')
						.attr('value', '');
						$('#timetable-form').find('input[name="slot6"]')
						.attr('value', '');
						$('#timetable-form').find('input[name="slot7"]')
						.attr('value', '');
						$('#timetable-form').find('input[name="slot8"]')
						.attr('value', '');
						$('#timetable-form').find('input[name="slot9"]')
						.attr('value', '');
						$('#timetable-form').find('input[name="id"]').attr(
								'value', '');
						$('.box-primary').find('.box-title').find('i')
								.removeClass('fa-pencil-square');
						$('.box-primary').find('.box-title').find('i')
								.addClass('fa-plus-square');
						$('.box-primary').find('.box-title').find('span').text(
								'Add Organization');
						$('.btn-reset').text('Reset');
						$('.btn-create').text('Create');
					} else {
						$('.error-block').text('');
						$('.form-control').css('border', '');
					}
				});

		$('#example')
				.on('click','a',function(e) {
							var op = $(this).attr("class");
							var row = $(this).closest('tr');
							var data = $('#example').dataTable().fnGetData(row);
							var id = data.id;
							if (op == 'ajaxDelete') {
								$
										.confirm({
											title : "<strong>Delete confirmation</strong>",
											text : "Do you really want to delete this day?",
											confirmButton : "Yes",
											cancelButton : "Cancel",
											confirm : function() {
												$
														.ajax({
															url : '${contextroot}/rest/timetable/'
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
											url : '${contextroot}/rest/timetable/'
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
													$('.box-primary')
															.find('.box-title')
															.find('span')
															.text(
																	'Edit Timetable');
													$('#timetable-form')
															.find(
																	'input[name="classid"]')
															.attr(
																	'value',
																	data.object.classid);
													$('#timetable-form')
															.find(
																	'input[name="day"]')
															.attr(
																	'value',
																	data.object.day);
													$('#timetable-form')
													.find(
															'input[name="slot1"]')
													.attr(
															'value',
															data.object.slot1);
													$('#timetable-form')
													.find(
															'input[name="slot2"]')
													.attr(
															'value',
															data.object.slot2);
													$('#timetable-form')
													.find(
															'input[name="slot3"]')
													.attr(
															'value',
															data.object.slot3);
													$('#timetable-form')
													.find(
															'input[name="slot4"]')
													.attr(
															'value',
															data.object.slot4);
													$('#timetable-form')
													.find(
															'input[name="slot5"]')
													.attr(
															'value',
															data.object.slot5);
													$('#timetable-form')
													.find(
															'input[name="slot6"]')
													.attr(
															'value',
															data.object.slot6);
													$('#timetable-form')
													.find(
															'input[name="slot7"]')
													.attr(
															'value',
															data.object.slot7);
													$('#timetable-form')
													.find(
															'input[name="slot8"]')
													.attr(
															'value',
															data.object.slot8);
													$('#timetable-form')
													.find(
															'input[name="slot9"]')
													.attr(
															'value',
															data.object.slot9);
													$('#timetable-form')
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

	function fetchList() {
		$('#example')
				.DataTable(
						{
							//"processing":true,
							"ajax" : "${contextroot}/rest/timetable",
							"columns" : [ {
								"data" : "id"
							}, {
								"data" : "classid"
							}, {
								"data" : "day"
							}, {
								"data" : "slot1"
							}, {
								"data" : "slot2"
							}, {
								"data" : "slot3"
							}, {
								"data" : "slot4"
							}, {
								"data" : "slot5"
							}, {
								"data" : "slot6"
							}, {
								"data" : "slot7"
							}, {
								"data" : "slot8"
							}, {
								"data" : "slot9"
							}, {
								"" : "",
								"width" : "5%"
							} ],
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
	}

	function validate() {
		var flag = true;
		var name = $('#timetable-form').find('input[name="classid"]').val();
		var roll = $('#timetable-form').find('input[name="day"]').val();
		if (name.length == 0) {
			flag = false;
			$('#classid').css('border', '1px solid #CD5C5C');
			$('#timetable-form').find('#classid').siblings('.error-block')
					.text('Name is required field');
		} else {
			$('#classid').css('border', '');
			$('#timetable-form').find('#classid').siblings('.error-block')
					.text('');
		}

		if (roll.length == 0) {
			flag = false;
			$('#day').css('border', '1px solid #CD5C5C');
			$('#timetable-form').find('#day').siblings('.error-block')
					.text('Code is required field');
		} else {
			$('#day').css('border', '');
			$('#timetable-form').find('#day').siblings('.error-block').text('');
		}

		return flag;
	}
</script>

<div class="content-wrapper" style="min-height: 100%;">
	<section class="content-header">
		<h1>
			<i class="fa fa-th-list"></i>Manage<small>Timetable</small>
		</h1>
		<ul class="breadcrumb">
			<li><a href="${contextroot}/dashboard/secure/home"><i
					class="fa fa-home"></i>Home</a></li>
			<li><a href="${contextroot}/student/default/home">StudentConfiguration</a></li>
			<li class="active" style="text-transform: capitalize;">${maintab}</li>
		</ul>
	</section>

	<section class="content">
		<security:authorize ifAllGranted="CREATE_ORG">
			<div class="box box-primary">
				<div class="box-header with-border">
					<h3 class="box-title">
						<i class="fa fa-plus-square"></i> <span class="header-text">
							Add Timetable </span>
					</h3>
				</div>

				<form id="timetable-form"
					action="${contextroot}/rest/timetable" method="post">
					<input type="hidden" id="id" name="id" value="" />
					<div class="box-body">
						<div class="row">
							<div class="col-sm-3">
								<div class="form-group field-name required">
									<label class="control-label" for="classid">Class ID</label> <input
										type="text" id="classid" class="form-control" name="classid"
										maxlength="50" placeholder="classid">
									
									<div class="help-block"></div>
									<div class="error-block "></div>
								</div>
							</div>
							<div class="col-sm-3">
								<div class="form-group field-code required">
									<label class="control-label" for="day">Day</label> <select
										id="day" class="form-control" name="day" data-validation="required">
										<option value="">Pick the day</option>
										<option value="Monday">Monday</option>
										<option value="Tuesday">Tuesday</option>
										<option value="Wednesday">Wednesday</option>
										<option value="Thursday">Thursday</option>
										<option value="Friday">Friday</option>
										<option value="Saturday">Saturday</option>
										<option value="Sunday">Sunday</option>
									</select>
									<div class="help-block"></div>
									<div class="error-block "></div>
								</div>
							</div>
							<div class="col-sm-3">
								<div class="form-group field-code required">
									<label class="control-label" for="slot1">Slot 1</label> <input
										type="text" id="slot1" class="form-control" name="slot1"
										maxlength="50" placeholder="Slot 1" data-validation="required">

									<div class="help-block"></div>
									<div class="error-block "></div>
								</div>
							</div>
							<div class="col-sm-3">
								<div class="form-group field-code required">
									<label class="control-label" for="slot2">Slot 2</label> <input
										type="text" id="slot2" class="form-control" name="slot2"
										maxlength="50" placeholder="Slot 2" data-validation="required">

									<div class="help-block"></div>
									<div class="error-block "></div>
								</div>
							</div>						
						</div>
						<div class="row">
							<div class="col-sm-3">
								<div class="form-group field-name required">
									<label class="control-label" for="slot3">Slot 3</label> <input
										type="text" id="slot3" class="form-control" name="slot3"
										maxlength="50" placeholder="Slot 3" data-validation="required">

									<div class="help-block"></div>
									<div class="error-block "></div>
								</div>
							</div>
							<div class="col-sm-3">
								<div class="form-group field-code required">
									<label class="control-label" for="slot4">Slot 4</label> <input
										type="text" id="slot4" class="form-control" name="slot4"
										maxlength="50" placeholder="Slot 4" data-validation="required">

									<div class="help-block"></div>
									<div class="error-block "></div>
								</div>
							</div>
							<div class="col-sm-3">
								<div class="form-group field-code required">
									<label class="control-label" for="slot5">Slot 5</label> <input
										type="text" id="slot5" class="form-control" name="slot5"
										maxlength="50" placeholder="Slot 5" data-validation="required">

									<div class="help-block"></div>
									<div class="error-block "></div>
								</div>
							</div>
							<div class="col-sm-3">
								<div class="form-group field-name required">
									<label class="control-label" for="slot6">Slot 6</label> <input
										type="text" id="slot6" class="form-control" name="slot6"
										maxlength="50" placeholder="Slot 6" data-validation="required">

									<div class="help-block"></div>
									<div class="error-block "></div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-3">
								<div class="form-group field-code required">
									<label class="control-label" for="slot7">Slot 7</label> <input
										type="text" id="slot7" class="form-control" name="slot7"
										maxlength="50" placeholder="Slot 7" data-validation="required">

									<div class="help-block"></div>
									<div class="error-block "></div>
								</div>
							</div>
							<div class="col-sm-3">
								<div class="form-group field-code required">
									<label class="control-label" for="slot8">Slot 8</label> <input
										type="text" id="slot8" class="form-control" name="slot8"
										maxlength="50" placeholder="Slot 8" data-validation="required">

									<div class="help-block"></div>
									<div class="error-block "></div>
								</div>
							</div>
							<div class="col-sm-3">
								<div class="form-group field-code required">
									<label class="control-label" for="slot9">Slot 9</label> <input
										type="text" id="slot9" class="form-control" name="slot9"
										maxlength="50" placeholder="Slot 9" data-validation="required">

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
		</security:authorize>
		<div class="box box-info">
			<div class="box-header with-border">
				<h3 class="box-title">
					<i class="fa fa-search"></i> View Timetable
				</h3>
			</div>

			<div class="box-body table-responsive">
				<table id="example" class="table table-striped table-bordered"
					cellspacing="0" width="100%">
					<thead>
						<tr>
							<th>Id</th>
							<th>Class</th>
							<th>Day</th>
							<th>Slot1</th>
							<th>Slot2</th>
							<th>Slot3</th>
							<th>Slot4</th>
							<th>Slot5</th>
							<th>Slot6</th>
							<th>Slot7</th>
							<th>Slot8</th>
							<th>Slot9</th>
							<th>Manage</th>
							</tr>
					</thead>
				</table>

			</div>

		</div>
	</section>
</div>