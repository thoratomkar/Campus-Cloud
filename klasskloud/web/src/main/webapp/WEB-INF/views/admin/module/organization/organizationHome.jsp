<%@include file="../../taglib_includes.jsp"%>
<script type="text/javascript">
	$(function() {
		$.fn.dataTable.ext.errMode = 'none';
		fetchList();
		$('.btn-create')
				.on(
						'click',
						function(e) {
							if (validate()) {
								var postData = $('#organizations-form')
										.serializeArray();
								var formURL = $('#organizations-form').attr(
										"action");
								$
										.ajax({
											url : formURL,
											type : "POST",
											data : postData,
											success : function(data,
													textStatus, jqXHR) {
												if (data.status == false) {
													alert(data.statusText);
												} else {
													$(location)
															.attr('href',
																	'${contextroot}/organization/default/home');
												}
											},
											error : function(jqXHR, textStatus,
													errorThrown) {
											}
										});
							}
						});

		$('.btn-reset').on(
				'click',
				function(e) {
					if ($(this).text() == 'Cancel') {
						$('#organizations-form').find('input[name="name"]')
								.attr('value', '');
						$('#organizations-form').find('input[name="code"]')
								.attr('value', '');
						$('#organizations-form').find('input[name="id"]').attr(
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
											text : "Do you really want to delete this organization?",
											confirmButton : "Yes",
											cancelButton : "Cancel",
											confirm : function() {
												$
														.ajax({
															url : '${contextroot}/rest/organizations/'
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
											url : '${contextroot}/rest/organizations/'
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
																	'Edit Organization');
													$('#organizations-form')
															.find(
																	'input[name="name"]')
															.attr(
																	'value',
																	data.object.name);
													$('#organizations-form')
															.find(
																	'input[name="code"]')
															.attr(
																	'value',
																	data.object.code);
													$('#organizations-form')
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
							"ajax" : "${contextroot}/rest/organizations",
							"columns" : [ {
								"data" : "id"
							}, {
								"data" : "name"
							}, {
								"data" : "code"
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
										"defaultContent" : "<a href='#' class='ajaxEdit' title='Edit'><span class='glyphicon glyphicon-pencil'></a>&nbsp;</span>"
									/* 1st one, start by the right */
									} ]
						});
	}

	function validate() {
		var flag = true;
		var name = $('#organizations-form').find('input[name="name"]').val();
		var code = $('#organizations-form').find('input[name="code"]').val();
		if (name.length == 0) {
			flag = false;
			$('#name').css('border', '1px solid #CD5C5C');
			$('#organizations-form').find('#name').siblings('.error-block')
					.text('Name is required field');
		} else {
			$('#name').css('border', '');
			$('#organizations-form').find('#name').siblings('.error-block')
					.text('');
		}

		if (code.length == 0) {
			flag = false;
			$('#code').css('border', '1px solid #CD5C5C');
			$('#organizations-form').find('#code').siblings('.error-block')
					.text('Code is required field');
		} else {
			$('#code').css('border', '');
			$('#mdoules-form').find('#code').siblings('.error-block').text('');
		}

		return flag;
	}
</script>

<div class="content-wrapper" style="min-height: 100%;">
	<section class="content-header">
		<h1>
			<i class="fa fa-th-list"></i>Manage<small>Organizations</small>
		</h1>
		<ul class="breadcrumb">
			<li><a href="${contextroot}/dashboard/secure/home"><i
					class="fa fa-home"></i>Home</a></li>
			<li><a href="${contextroot}/config/default/home">Configuration</a></li>
			<li class="active" style="text-transform: capitalize;">${maintab}</li>
		</ul>
	</section>

	<section class="content">
		<security:authorize ifAllGranted="CREATE_ORG">
			<div class="box box-primary">
				<div class="box-header with-border">
					<h3 class="box-title">
						<i class="fa fa-plus-square"></i> <span class="header-text">
							Add Organization </span>
					</h3>
				</div>

				<form id="organizations-form"
					action="${contextroot}/rest/organizations" method="post">
					<input type="hidden" id="id" name="id" value="" />
					<div class="box-body">
						<div class="row">
							<div class="col-sm-3">
								<div class="form-group field-name required">
									<label class="control-label" for="name">Name</label> <input
										type="text" id="name" class="form-control" name="name"
										maxlength="50" placeholder="Name" data-validation="required">

									<div class="help-block"></div>
									<div class="error-block "></div>
								</div>
							</div>
							<div class="col-sm-3">
								<div class="form-group field-code required">
									<label class="control-label" for="code">Code</label> <input
										type="text" id="code" class="form-control" name="code"
										maxlength="50" placeholder="Code" data-validation="required">

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
					<i class="fa fa-search"></i> View List of Organizations
				</h3>
			</div>

			<div class="box-body table-responsive">
				<table id="example" class="table table-striped table-bordered"
					cellspacing="0" width="100%">
					<thead>
						<tr>
							<th>Id</th>
							<th>Name</th>
							<th>Code</th>
							<th>Manage</th>
						</tr>
					</thead>
				</table>

			</div>

		</div>
	</section>
</div>