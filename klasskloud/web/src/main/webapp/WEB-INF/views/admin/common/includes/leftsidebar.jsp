<%@include file="../../taglib_includes.jsp"%>

<script type="text/javascript">
$(function() {
	var orgCount = '${fn:length(context.orgList)}';
	$(".treeview").click(function(e){
		
		if(orgCount == 0 && $(this).find('span').text() != 'Configuration'){
			$.confirm({
				title : "<strong>Alert!</strong>",
				text : "Please create a new organization",
				confirmButton : "Yes",
				cancelButton : "Cancel",
				confirm : function() {
					$(location)
					.attr('href',
							'${contextroot}/organization/default/home');
				},
				cancel : function() {
				}
			});

			e.preventDefault();
		}

    }); 
});

</script>
<aside class="main-sidebar">

	<section class="sidebar" style="height: auto;">

		<!-- Sidebar user panel -->
		<div class="user-panel">
			<div class="image">
				<img class="center-block img-responsive" src="${imagepath}/campuscloud.png"
					alt="College Logo" style="max-width: 85px; max-height: 50px;">
			</div>
			<!-- <div class="info">
				<p>Klass Kloud</p>
			</div> -->
		</div>

		<ul class="sidebar-menu">
			
			<li class="treeview <c:if test='${maintab == "dashboard"}'> active</c:if>"><a href="/web/dashboard/secure/home"> <i
							class="fa fa-home"></i><span> Home</span></a></li>
					<li class="treeview <c:if test='${maintab == "config"}'> active</c:if>"><a href="/web/config/default/home"><i
							class="fa fa-cogs"></i><span>Configuration</span></a></li>
					<li class="treeview <c:if test='${maintab == "academic"}'> active</c:if>"><a href="/web/academic/default/home"><i
							class="fa fa-calendar-o"></i><span>Academics</span></a></li>
					<li class="treeview <c:if test='${maintab == "admission"}'> active</c:if>"><a href="/web/admission/default/home"><i
							class="fa fa-user-plus"></i><span>Admission</span></a></li>
					<li class="treeview <c:if test='${maintab == "student"}'> active</c:if>"><a href="/web/student/default/home"><i class="fa fa-users"></i><span>Student</span></a></li>
					<li class="treeview <c:if test='${maintab == "test"}'> active</c:if>"><a href="/web/test/default/home"><i class="fa fa-tasks"></i><span>Tests</span></a></li>
					
					<li class="treeview <c:if test='${maintab == "fees"}'> active</c:if>"><a href="#"><i class="fa fa-money"></i><span>Fees</span></a></li>
					<li class="treeview <c:if test='${maintab == "humanresources"}'> active</c:if>"><a href="#"><i class="fa fa-user"></i><span>Human
								Resource</span></a></li>
					<li class="treeview <c:if test='${maintab == "communication"}'> active</c:if>"><a href="#"><i
							class="fa fa-comments-o"></i><span>Communication</span></a></li>
					<li class="treeview <c:if test='${maintab == "usermgmt"}'> active</c:if>"><a href="#"><i
							class="fa fa-user-secret"></i><span>User Management</span></a></li>
					<li class="treeview <c:if test='${maintab == "reports"}'> active</c:if>"><a href="#"><i
							class="fa fa-line-chart"></i><span>Reports Center</span></a></li>
					<li class="treeview <c:if test='${maintab == "administration"}'> active</c:if>"><a href="#"><i class="fa fa-wrench"></i><span>Administration</span></a></li>
					<li class="treeview <c:if test='${maintab == "library"}'> active</c:if>"><a href="#"><i
							class="fa fa-university"></i><span>Library</span></a></li>
			

		</ul>
	</section>

</aside>