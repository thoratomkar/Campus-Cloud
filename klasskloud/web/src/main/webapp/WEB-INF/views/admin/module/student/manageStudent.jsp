<%@include file="../../taglib_includes.jsp"%>
<script type="text/javascript">
$(function() {
	$.fn.dataTable.ext.errMode = 'none';
	fetchList();

	$('#example').on('click','a',function(e) {
		var op = $(this).attr("class");
		var row = $(this).closest('tr');
		var data = $('#example').dataTable().fnGetData(row);
		var id = data.id;
		if (op == 'ajaxDelete') {
			$.confirm({
				title : "<strong>Delete confirmation</strong>",
				text : "Do you really want to delete this student?",
				confirmButton : "Yes",
				cancelButton : "Cancel",
				confirm : function() {
					$.ajax({
						url : '${contextroot}/rest/students/'+ data.id,
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
		} else if (op == 'ajaxEdit') {
		} else {
		}
		e.preventDefault();
	});
});

function fetchList() {
	$('#example').DataTable(
	{
		//"processing":true,
		"ajax" : "${contextroot}/rest/students",
		"columns" : [ 
		     {"data" : "id"},
			 {"data" : "firstName","render": function(data, type, full, meta) {
	                return '<a href="view/' + full.id + '">' + data + '</a>';
	            }}, 
			 {"data" : "lastName"},
			 {"data" : "course.name"}, 
			 {"data" : "batch.name"}, 
			 {"data" : "section.name"}, 
			 {"data" : "rollNo"}, 
			 {"" : "", "width" : "5%"} 
			],
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

</script>

<div class="content-wrapper" style="min-height: 100%;">
	<section class="content-header">
		<h1>
			<i class="fa fa-th-list"></i>Manage<small>Students</small>
		</h1>
		<ul class="breadcrumb">
			<li><a href="${contextroot}/dashboard/secure/home"><i
					class="fa fa-home"></i>Home</a></li>
			<li><a href="${contextroot}/student/default/home">StudentConfiguration</a></li>
			<li class="active" style="text-transform: capitalize;">${maintab}</li>
		</ul>
	</section>
	
	<section class="content">
		<div class="box box-info">
			<div class="box-header with-border">
				<h3 class="box-title">
					<i class="fa fa-search"></i> View List of Students
				</h3>
				<div class="box-tools">
					<a class="btn btn-success btn-sm btn-add" href="/web/student/default/add">
						<i class="fa fa-plus-square"></i>
					Add</a>
				</div>
			</div>

			<div class="box-body table-responsive">
				<table id="example" class="table table-striped table-bordered"
					cellspacing="0" width="100%">
					<thead>
						<tr>
							<th>Id</th>
							<th>Firstname</th>
							<th>Lastname</th>
							<th>Course</th>
							<th>Batch</th>
							<th>Section</th>
							<th>Roll No</th>
							<th>Manage</th>
						</tr>
					</thead>
				</table>
			</div>
		</div>
	
	</section>

</div>