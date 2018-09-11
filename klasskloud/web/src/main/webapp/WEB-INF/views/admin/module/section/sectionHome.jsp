<%@include file="../../taglib_includes.jsp"%>
<script type="text/javascript">
	$(function() {
		$.fn.dataTable.ext.errMode = 'none';
		fetchList(); 

		$(".btn-add").click(function(){
			$("#myModal").modal({
				remote: "add"
			});
		}); 
	});

	function fetchList(){
		$('#example').DataTable( {
			//"processing":true,
	        "ajax": "${contextroot}/rest/section",
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

	

</script>	

<div class="content-wrapper" style="min-height: 100%;">
	<section class="content-header">
		<h1>
			<i class="fa fa-th-list"></i>Manage<small>Sections</small>
		</h1>
		<ul class="breadcrumb">
			<li><a href="${contextroot}/dashboard/secure/home"><i
					class="fa fa-home"></i>Home</a></li>
			<li><a href="${contextroot}/config/default/home">Configuration</a></li>
			<li class="active" style="text-transform: capitalize;">${maintab}</li>
		</ul>
	</section>

	<section class="content">
		<div class="box box-info">
			<div class="box-header with-border">
				<h3 class="box-title">
					<i class="fa fa-search"></i> View List of Sections
				</h3>
				<div class="box-tools">
					<a class="btn btn-success btn-sm btn-add" href="#"
						data-target="#globalModal" data-toggle="modal"
						data-modal-size="modal-lg"><i class="fa fa-plus-square"></i>
						Add</a>
				</div>
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
	<div id="myModal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
            </div>
        </div>
    </div>
</div>