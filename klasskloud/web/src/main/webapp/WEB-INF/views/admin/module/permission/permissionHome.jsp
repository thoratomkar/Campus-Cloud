<%@include file="../../taglib_includes.jsp"%>
<script type="text/javascript">
	$(function() {
		$.fn.dataTable.ext.errMode = 'none';

		fetchList(); 

		//$('#userRoleId').click(function() {
			if($("#userRoleId option").length == 1) {
				$.getJSON("${contextroot}/rest/roles", function(result) {
					var options = $("#userRoleId");
					var roles = $("#permission-edit").find('.row');
					$.each(result.list, function(i, v) {
						//options.append(new Option(v.role, v.userRoleId));
						options.append($("<option />").val(v.id).text(v.name));
						roles.append("<div class='col-sm-12'><label><input type='checkbox' id='assignedRoles' name='assignedRoles' value='"+v.id+"'> "+v.name+"</label></div>");
						
					});
				});
			}
		//});


		//$('#moduleId').click(function() {
			if($("#moduleId option").length == 1) {
				$.getJSON("${contextroot}/rest/modules", function(result) {
					var options = $("#moduleId");
					$.each(result.list, function(i, v) {
						options.append(new Option(v.name, v.id));
						//options.append($("<option />").val(v.id).text(v.name));
					});
				});
				
			}
		//});

		//$('#operationId').click(function() {
			if($("#operationId option").length == 1) {
				$.getJSON("${contextroot}/rest/operations", function(result) {
					var options = $("#operationId");
					$.each(result.list, function(i, v) {
						//options.append(new Option(v.role, v.userRoleId));
						options.append($("<option />").val(v.id).text(v.name));
					});

				});
			}
		//});

			$('#example').on( 'click', 'a', function (e) {
				var op = $(this).attr("class");
				var row = $(this).closest('tr');
				var data = $('#example').dataTable().fnGetData(row);
				var id = data.id;
				if(op == 'ajaxDelete'){
	                $.confirm({
	                	title:"<strong>Delete confirmation</strong>",
	                    text: "Do you really want to delete this permission?",
	                    confirmButton: "Yes",
	                    cancelButton: "Cancel",
	                    confirm: function() {
	                    	$.ajax({
								url : '${contextroot}/rest/privileges/'+data.id,
								type : 'DELETE',
								success : function(data, textStatus, jqXHR) {
									$('#example').dataTable().fnDeleteRow(row.index());
								},
								error : function(jqXHR, textStatus, errorThrown) {
								}
							});
	                    },
	                    cancel: function() {
	                    }
	                });
				}else if(op == 'ajaxEdit'){
					$.ajax({
						url : '${contextroot}/rest/privileges/'+ data.id,
						type : 'GET',
						success : function(data,textStatus,jqXHR) {
							if (data.status == true) {
								$('.box-primary').find('.box-title').find('i').removeClass('fa-plus-square');
								$('.box-primary').find('.box-title').find('i').addClass('fa-pencil-square');
								$('.box-primary').find('.box-title').find('span').text('Edit Permission');

								$('#permission-create').hide();
								$('#permission-edit').show();

								$.each(data.list, function(i, v) {
										$('#permission-edit').find('.row').find('input[type=checkbox][value='+v.roleId+']').attr('checked','checked');
								});
								//$('#permissions-form').find('#userRoleId').prop('value',data.object.userRole.userRoleId);
								/* $('#permissions-form').find('#operationId').prop('value',data.object.operation.id);
								$('#permissions-form').find('#moduleId').prop('value',data.object.module.id); */
								$('#permissions-form').find('input[name="id"]').attr('value',data.object.id);
								$('.btn-create').text('Update');
								$('.btn-reset').text('Cancel');
							}
						},
						error : function(jqXHR,textStatus,errorThrown) {
						}
					});
				}else{

				}
			    e.preventDefault();			
			} );
			
			$('.btn-reset').on('click',function(e) {
				if($(this).text() == 'Cancel'){
					$('.box-primary').find('.box-title').find('i').removeClass('fa-pencil-square');
					$('.box-primary').find('.box-title').find('i').addClass('fa-plus-square');
					$('.box-primary').find('.box-title').find('span').text('Assign Permissions');
					$('.btn-reset').text('Reset');
					$('.btn-create').text('Create');
					$('#permission-create').show();
					$('#permission-edit').hide();
				}else{
					$('.error-block').text('');
					$('.form-control').css('border', '');
				}

			});
		
	});

	function fetchList(){
		$('#example').DataTable( {
			//"processing":true,
	        "ajax": "${contextroot}/rest/privileges",
	        "columns": [
	            { "data": "id" },
	            { "data": "name" },
	            { "data": "module.name" },
	            { "data": "operation.name" },
	            { "": "", "width": "5%"}
	        ],
	        'order' : [],
			'aoColumnDefs' : [ {
                "targets": [ 0 ],
                "visible": false,
                "searchable": false
            	},{
				'bSortable' : false,
				'aTargets' : [ -1 ],
				"defaultContent": "<a href='#' class='ajaxEdit' title='Edit'><span class='glyphicon glyphicon-pencil'></a>&nbsp;</span><a href='#' class='ajaxDelete' title='Delete'> <span class='glyphicon glyphicon-remove' style='color:RED;'></span></a>"
			/* 1st one, start by the right */
			} ]
	    } );

	}
	
	function submitDetailsForm() {
		var userRoleId = $('#userRoleId').val();
		var moduleId = $('#moduleId').val();
		var operationId = $('#operationId').val();

		var flag = true;
		if($("#permission-edit").is(':hidden')){
			if (userRoleId.length == 0) {
				flag = false;
				$('#userRoleId').css('border', '1px solid #CD5C5C');
				$('#userRoleId').siblings('.error-block').text('Role is required field');
			} else {
				$('#userRoleId').css('border', '');
				$('#userRoleId').siblings('.error-block').text('');
			}
	
			if (moduleId.length == 0) {
				flag = false;
				$('#moduleId').css('border', '1px solid #CD5C5C');
				$('#moduleId').siblings('.error-block').text('Module is required field')
			} else {
				$('#moduleId').css('border', '');
				$('#moduleId').siblings('.error-block').text('')
			}
	
			if (operationId.length == 0) {
				flag = false;
				$('#operationId').css('border', '1px solid #CD5C5C');
				$('#operationId').siblings('.error-block').text('Operation is required field')
			} else {
				$('#operationId').css('border', '');
				$('#operationId').siblings('.error-block').text('')
			}
		}
		
		if (flag) {
			var postData = $('#permissions-form').serializeArray();
			var formURL = $('#permissions-form').attr("action");
			$.ajax({
				url : formURL,
				type : "POST",
				data : postData,
				success : function(data, textStatus, jqXHR) {
					if (data.status == false) {
						alert('Permission already created');
					} else {
					 	$(location).attr('href',
								'${contextroot}/permission/default/home'); 
					}
				},
				error : function(jqXHR, textStatus, errorThrown) {
				}
			});
		}

	}
</script>

<div class="content-wrapper" style="min-height: 100%;">
	<section class="content-header">
		<h1>
			<i class="fa fa-th-list"></i>Manage<small>Permissions</small>
		</h1>
		<ul class="breadcrumb">
			<li><a href="${contextroot}/dashboard/secure/home"><i class="fa fa-home"></i>Home</a></li>
			<li><a href="${contextroot}/config/default/home">Configuration</a></li>
			<li class="active" style="text-transform: capitalize;">${maintab}</li>
		</ul>
	</section>

	<section class="content">


		<div class="box box-primary">
			<div class="box-header with-border">
				<h3 class="box-title">
					<i class="fa fa-plus-square"></i> <span class="header-text">Assign Permissions
				</h3>
			</div>


			<form id="permissions-form" action="${contextroot}/rest/privileges"
				method="post">
				<input type="hidden" id="id" name="id" value=""/>
				<div class="box-body" id="permission-create">
					<div class="row">
						<div class="col-sm-4">
							<div class="form-group field-userRoleId required">
								<label class="control-label" for="userRoleId">Role</label> <select
									id="userRoleId" class="form-control" name="userRoleId">
									<option value="" id="roleOptions">--- Select Role ---</option>
								</select>

								<div class="help-block"></div>
								<div class="error-block "></div>
							</div>
						</div>
						<div class="col-sm-4">
							<div class="form-group field-moduleId required">
								<label class="control-label" for="moduleId">Module</label> <select
									id="moduleId" class="form-control" name="moduleId">
									<option value="">--- Select Module ---</option>
								</select>

								<div class="help-block"></div>
								<div class="error-block "></div>
							</div>
						</div>

						<div class="col-sm-4">
							<div class="form-group field-userRoleId required">
								<label class="control-label" for="operationId">Operation</label>
								<select id="operationId" class="form-control" name="operationId">
									<option value="">--- Select Operation ---</option>
								</select>

								<div class="help-block"></div>
								<div class="error-block "></div>
							</div>
						</div>
					</div>
				</div>
				<div class="box-body" id="permission-edit" style="display: none;">
					<div class="row">
						
					</div>
				</div>
				<!-- /.box-body -->

				<div class="box-footer">
					<button type="button" class="btn btn-primary btn-create"
						onclick="javascript:submitDetailsForm();">Create</button>
					<button type="reset" class="btn btn-default btn-reset">Reset</button>
				</div>
				<!-- /.box-footer-->

			</form>
		</div>
		<!-- /.box-->

		<div class="box box-info">
			<div class="box-header with-border">
				<h3 class="box-title">
					<i class="fa fa-search"></i> View List of Permissions
				</h3>
			</div>

			<div class="box-body table-responsive">
				<table id="example" class="table table-striped table-bordered"
					cellspacing="0" width="100%">
					<thead>
						<tr>
							<th>Id</th>
							<th>Name</th>
							<th>Module</th>
							<th>Operation</th>
							<th>Manage</th>
						</tr>
					</thead>
				</table>

			</div>
		</div>
	</section>
</div>