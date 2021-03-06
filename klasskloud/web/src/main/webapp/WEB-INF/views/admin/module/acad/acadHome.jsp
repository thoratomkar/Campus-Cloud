<%@include file="../../taglib_includes.jsp"%>
    rel="stylesheet" type="text/css" />
<script type="text/javascript">
	$(function() {
		$.fn.dataTable.ext.errMode = 'none';
		fetchList();
		
		$('.btn-create').on('click',function(e) {
			if (validate()) {
				var postData = $('#acad-form').serializeArray();
				var formURL = $('#acad-form').attr("action");
				$.ajax({
					url : formURL,
					type : "POST",
					data : postData,
					success : function(data, textStatus, jqXHR) {
						if (data.status == false) {
							alert(data.statusText);
						} else {
							$(location).attr('href',
									'${contextroot}/acad/default/home');
						}
					},
					error : function(jqXHR, textStatus, errorThrown) {
					}
				});
			}
		});

		$('.btn-reset').on('click',function(e) {
			if($(this).text() == 'Cancel'){
				$('#acad-form').find('input[name="name"]').attr('value','');
				$('#acad-form').find('input[name="id"]').attr('value','');
				$('.box-primary').find('.box-title').find('i').removeClass('fa-pencil-square');
				$('.box-primary').find('.box-title').find('i').addClass('fa-plus-square');
				$('.box-primary').find('.box-title').find('span').text('Create Academic Year');
				$('.btn-reset').text('Reset');
				$('.btn-create').text('Create');
			}else{
				$('.error-block').text('');
				$('.form-control').css('border', '');
			}
			
		});

		
		$('#example').on('click','a',function(e) {
				var op = $(this).attr("class");
				var row = $(this).closest('tr');
				var data = $('#example').dataTable().fnGetData(row);
				var id = data.id;
				if (op == 'ajaxDelete') {
					$.confirm({
						title : "<strong>Delete confirmation</strong>",
						text : "Do you really want to delete this Academic Year?",
						confirmButton : "Yes",
						cancelButton : "Cancel",
						confirm : function() {
							$.ajax({
										url : '${contextroot}/rest/acadyears/'+ data.id,
										type : 'DELETE',
										success : function(data,textStatus,jqXHR) {
											$('#example').dataTable().fnDeleteRow(row.index());
										},
										error : function(jqXHR,textStatus,errorThrown) {
										}
									});
						},
						cancel : function() {
						}
					});
				} else if(op == 'ajaxEdit'){
					$.ajax({
						url : '${contextroot}/rest/acadyears/'+ data.id,
						type : 'GET',
						success : function(data,textStatus,jqXHR) {
							if (data.status == true) {
								$('.box-primary').find('.box-title').find('i').removeClass('fa-plus-square');
								$('.box-primary').find('.box-title').find('i').addClass('fa-pencil-square');
								$('.box-primary').find('.box-title').find('span').text('Edit Academic Year');
								$('#acad-form').find('input[name="name"]').attr('value',data.object.name);
								$('#acad-form').find('input[name="id"]').attr('value',data.object.id);
								$('#acad-form').find('#startYear').val(data.object.startYear);
								$('#acad-form').find('#startMonth').val(data.object.startMonth);
								$('#acad-form').find('#endYear').val(data.object.endYear);
								$('#acad-form').find('#endMonth').val(data.object.endMonth);
								$('#acad-form').find('#isCurrent').prop('checked',data.object.isCurrent );
								$('.btn-create').text('Update');
								$('.btn-reset').text('Cancel');
							}
						},
						error : function(jqXHR,textStatus,errorThrown) {
						}
					});
				} else {

				}
				e.preventDefault();
			});
	});

	function fetchList() {
		$('#example').DataTable({
			//"processing":true,
			"ajax" : "${contextroot}/rest/acadyears",
			"columns" : [ {
				"data" : "id"
			}, {
				"data" : "name"
			}, {
				"data" : "acadYear"
			}, {
				"data" : "isCurrent"
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

	function validate(){
		var flag = true;
		var name = $('#acad-form').find('input[name="name"]').val();
		var startYear = $('#acad-form').find('#startYear').val();
		var startMonth = $('#acad-form').find('#startMonth').val();
		var endYear = $('#acad-form').find('#endYear').val();
		var endMonth = $('#acad-form').find('#endMonth').val();
		if (name.length == 0) {
			flag = false;
			$('#name').css('border', '1px solid #CD5C5C');
			$('#acad-form').find('#name').siblings('.error-block').text('Name is required field');
		} else {
			$('#name').css('border', '');
			$('#acad-form').find('#name').siblings('.error-block').text('');
		}

		if (startYear.length == 0) {
			flag = false;
			$('#startYear').css('border', '1px solid #CD5C5C');
			$('#acad-form').find('#startYear').siblings('.error-block').text('Start Year is required field');
		} else {
			$('#startYear').css('border', '');
			$('#acad-form').find('#startYear').siblings('.error-block').text('');
		}

		if (startMonth.length == 0) {
			flag = false;
			$('#startMonth').css('border', '1px solid #CD5C5C');
			$('#acad-form').find('#startMonth').siblings('.error-block').text('Start Month is required field');
		} else {
			$('#startMonth').css('border', '');
			$('#acad-form').find('#startMonth').siblings('.error-block').text('');
		}

		if (endYear.length == 0) {
			flag = false;
			$('#endYear').css('border', '1px solid #CD5C5C');
			$('#acad-form').find('#endYear').siblings('.error-block').text('End Year is required field');
		} else {
			$('#endYear').css('border', '');
			$('#acad-form').find('#endYear').siblings('.error-block').text('');
		}

		if (endMonth.length == 0) {
			flag = false;
			$('#endMonth').css('border', '1px solid #CD5C5C');
			$('#acad-form').find('#endMonth').siblings('.error-block').text('End Month is required field');
		} else {
			$('#endMonth').css('border', '');
			$('#acad-form').find('#endMonth').siblings('.error-block').text('');
		}
		
		return flag;

	}

</script>
<div class="content-wrapper" style="min-height: 100%;">
	<section class="content-header">
		<h1>
			<i class="fa fa-th-list"></i>Manage<small>Academic Years</small>
		</h1>
		<ul class="breadcrumb">
			<li><a href="${contextroot}/dashboard/secure/home"><i
					class="fa fa-home"></i>Home</a></li>
			<li><a href="${contextroot}/config/default/home">Configuration</a></li>
			<li class="active">${maintab}</li>
		</ul>
	</section>

	<section class="content">


		<div class="box box-primary">
			<div class="box-header with-border">
				<h3 class="box-title">
					<i class="fa fa-plus-square"></i> <span class="header-text">Create Academic Year</span>
				</h3>
			</div>


			<form id="acad-form" action="${contextroot}/rest/acadyears"
				method="post">
				<input type="hidden" id="id" name="id" value=""/>
				<input type="hidden" id="orgId" name="orgId" value="${context.selectedOrgId}" />
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
					</div>
					<div class="row">
						<div class="col-sm-3">
							<div class="form-group field-userRoleId required">
								<label class="control-label" for="userRoleId">Start
									Month</label> <select id="startMonth" class="form-control"
									name="startMonth" data-validation="required">
									<option value="">--- Select Month ---</option>
									<c:forEach items="${MONTHLIST}" var="month">
										<option value="${month.value}">${month.label}</option>
									</c:forEach>
								</select>

								<div class="help-block"></div>
								<div class="error-block "></div>
							</div>
						</div>
						<div class="col-sm-3">
							<div class="form-group field-moduleId required">
								<label class="control-label" for="moduleId">Start Year</label> <select
									id="startYear" class="form-control" name="startYear" data-validation="required">
									<option value="">--- Select Year ---</option>
									<c:forEach items="${YEARLIST}" var="year">
										<option value="${year.value}">${year.label}</option>
									</c:forEach>
								</select>

								<div class="help-block"></div>
								<div class="error-block "></div>
							</div>
						</div>

						<div class="col-sm-3">
							<div class="form-group field-userRoleId required">
								<label class="control-label" for="userRoleId">End Month</label>
								<select id="endMonth" class="form-control" name="endMonth" data-validation="required">
									<option value="">--- Select Month ---</option	>
									<c:forEach items="${MONTHLIST}" var="month">
										<option value="${month.value}">${month.label}</option>
									</c:forEach>
								</select>

								<div class="help-block"></div>
								<div class="error-block "></div>
							</div>
						</div>
						<div class="col-sm-3">
							<div class="form-group field-moduleId required">
								<label class="control-label" for="moduleId">End Year</label> <select
									id="endYear" class="form-control" name="endYear" data-validation="required">
									<option value="">--- Select Year ---</option>
									<c:forEach items="${YEARLIST}" var="year">
										<option value="${year.value}">${year.label}</option>
									</c:forEach>
								</select>

								<div class="help-block"></div>
								<div class="error-block "></div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-12">
							<label><input type="checkbox" id="isCurrent"
								name="isCurrent" value="true"> Current Year</label>
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
		<!-- /.box-->

		<div class="box box-info">
			<div class="box-header with-border">
				<h3 class="box-title">
					<i class="fa fa-search"></i> View List of Academic Years
				</h3>
			</div>

			<div class="box-body table-responsive">
				<table id="example" class="table table-striped table-bordered"
					cellspacing="0" width="100%">
					<thead>
						<tr>
							<th>Id</th>
							<th>Name</th>
							<th>Date Range</th>
							<th>Is Current</th>
							<th>Manage</th>
						</tr>
					</thead>
				</table>
			</div>
		</div>
	</section>
</div>