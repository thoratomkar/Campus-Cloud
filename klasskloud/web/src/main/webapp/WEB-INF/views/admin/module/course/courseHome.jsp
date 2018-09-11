<%@include file="../../taglib_includes.jsp"%>
<script type="text/javascript">
	$(function() {
		$.fn.dataTable.ext.errMode = 'none';
		fetchList(); 
		$('.btn-create').on('click',function(e) {
			if (validate()) {
				var postData = $('#course-form').serializeArray();
				var formURL = $('#course-form').attr("action");
				$.ajax({
					url : formURL,
					type : "POST",
					data : postData,
					success : function(data, textStatus, jqXHR) {
						if (data.status == false) {
							alert(data.statusText);
						} else {
							$(location).attr('href',
									'${contextroot}/course/default/home');
						}
					},
					error : function(jqXHR, textStatus, errorThrown) {
					}
				});
			}
		});

		$('.btn-reset').on('click',function(e) {
			if($(this).text() == 'Cancel'){
				$('#course-form').find('input[name="name"]').attr('value','');
				$('#course-form').find('input[name="code"]').attr('value','');
				$('#course-form').find('input[name="id"]').attr('value','');
				$('.box-primary').find('.box-title').find('i').removeClass('fa-pencil-square');
				$('.box-primary').find('.box-title').find('i').addClass('fa-plus-square');
				$('.box-primary').find('.box-title').find('span').text('Add Course');
				$('.btn-reset').text('Reset');
				$('.btn-create').text('Create');
			}else{
				$('.error-block').text('');
				$('.form-control').css('border', '');
			}
		});

		$('#example').on( 'click', 'a', function (e) {
			var op = $(this).attr("class");
			var row = $(this).closest('tr');
			var data = $('#example').dataTable().fnGetData(row);
			var id = data.id;
			if(op == 'ajaxDelete'){
	            $.confirm({
	            	title:"<strong>Delete confirmation</strong>",
	                text: "Do you really want to delete this course?",
	                confirmButton: "Yes",
	                cancelButton: "Cancel",
	                confirm: function() {
	                	$.ajax({
							url : '${contextroot}/rest/course/'+data.id,
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
			} else if(op == 'ajaxEdit'){
				$.ajax({
					url : '${contextroot}/rest/course/'+ data.id,
					type : 'GET',
					success : function(data,textStatus,jqXHR) {
						if (data.status == true) {
							$('.box-primary').find('.box-title').find('i').removeClass('fa-plus-square');
							$('.box-primary').find('.box-title').find('i').addClass('fa-pencil-square');
							$('.box-primary').find('.box-title').find('span').text('Edit Course');
							$('#course-form').find('input[name="name"]').attr('value',data.object.name);
							$('#course-form').find('input[name="code"]').attr('value',data.object.code);
							$('#course-form').find('input[name="label"]').attr('value',data.object.label);
							$('#course-form').find('input[name="description"]').attr('value',data.object.description);
							$('#course-form').find('input[name="id"]').attr('value',data.object.id);
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
		
	});

	function fetchList(){
		$('#example').DataTable( {
			//"processing":true,
	        "ajax": "${contextroot}/rest/course",
	        "columns": [
	            { "data": "id" },
	            { "data": "name" },
	            { "data": "code" },
	            { "data": "label" },
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

	function validate(){
		var flag = true;
		var name = $('#course-form').find('input[name="name"]').val();
		var code = $('#course-form').find('input[name="code"]').val();
		var label = $('#course-form').find('input[name="label"]').val();
		if (name.length == 0) {
			flag = false;
			$('#name').css('border', '1px solid #CD5C5C');
			$('#course-form').find('#name').siblings('.error-block').text('Name is required field');
		} else {
			$('#name').css('border', '');
			$('#course-form').find('#name').siblings('.error-block').text('');
		}

		if (code.length == 0) {
			flag = false;
			$('#code').css('border', '1px solid #CD5C5C');
			$('#course-form').find('#code').siblings('.error-block').text('Code is required field');
		} else {
			$('#code').css('border', '');
			$('#course-form').find('#code').siblings('.error-block').text('');
		}

		if (label.length == 0) {
			flag = false;
			$('#label').css('border', '1px solid #CD5C5C');
			$('#course-form').find('#label').siblings('.error-block').text('Label is required field');
		} else {
			$('#code').css('border', '');
			$('#course-form').find('#label').siblings('.error-block').text('');
		}
		
		return flag;
	}
	

</script>	

<div class="content-wrapper" style="min-height: 100%;">
	<section class="content-header">
		<h1>
			<i class="fa fa-th-list"></i>Manage<small>Courses</small>
		</h1>
		<ul class="breadcrumb">
			<li><a href="${contextroot}/dashboard/secure/home"><i
					class="fa fa-home"></i>Home</a></li>
			<li><a href="${contextroot}/config/default/home">Configuration</a></li>
			<li class="active" style="text-transform: capitalize;">${maintab}</li>
		</ul>
	</section>

	<section class="content">
		<div class="box box-primary">
			<div class="box-header with-border">
				<h3 class="box-title">
					<i class="fa fa-plus-square"></i> <span class="header-text"> Add Course </span>
				</h3>
			</div>
			
			<form id="course-form" action="${contextroot}/rest/course"
				method="post">
				<input type="hidden" id="id" name="id" value=""/>
				<input type="hidden" id="orgId" name="orgId" value="${context.selectedOrgId}"/>
				<div class="box-body">
					<div class="row">
						<div class="col-sm-3">
							<div class="form-group field-name required">
								<label class="control-label" for="name">Name</label> 
								<input type="text" id="name" class="form-control" name="name"
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
						<div class="col-sm-3">
							<div class="form-group field-label">
								<label class="control-label" for="label">Description</label> <input
									type="text" id="description" class="form-control" name="description"
									maxlength="50" placeholder="Description">

								<div class="help-block"></div>
								<div class="error-block "></div>
							</div>
						</div>
						<div class="col-sm-3">
							<div class="form-group field-label required">
								<label class="control-label" for="label">Label</label> <input
									type="text" id="label" class="form-control" name="label"
									maxlength="50" placeholder="Label" data-validation="required">

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

		<div class="box box-info">
			<div class="box-header with-border">
				<h3 class="box-title">
					<i class="fa fa-search"></i> View List of Courses
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
							<th>Label</th>
							<th>Manage</th>
						</tr>
					</thead>
				</table>

			</div>
			
		</div>
	</section>
</div>