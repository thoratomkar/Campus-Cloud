<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../../taglib_includes.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>
<link href="${csspath}/font-awesome.min.css" rel="stylesheet">
<link href="${csspath}/bootstrap.css" rel="stylesheet">
<%-- <link href="${csspath}/AdminLTE.min.css" rel="stylesheet"> --%>
<link href="${csspath}/AdminLTE.css" rel="stylesheet">
<link href="${csspath}/_all-skins.min.css" rel="stylesheet">
<link href="${csspath}/jquery-ui.css" rel="stylesheet">
<link href="${csspath}/site.css" rel="stylesheet">
<link href="${csspath}/bootstrap-multiselect.css" rel="stylesheet">
<link href="${csspath}/EdusecCustome.css" rel="stylesheet">
<script src="${javascriptpath}/jquery.js"></script>
<script src="${javascriptpath}/yii.js"></script>
<script src="${javascriptpath}/yii.activeForm.js"></script>
<script src="${javascriptpath}/bootstrap.js"></script>
<script src="${javascriptpath}/app.js"></script>
<script src="${javascriptpath}/demo.js"></script>
<script src="${javascriptpath}/jquery.slimscroll.min.js"></script>
<script src="${javascriptpath}/bootstrapx-clickover.js"></script>
<script src="${javascriptpath}/bootbox.js"></script>
<script src="${javascriptpath}/custom.js"></script>
<script src="${javascriptpath}/confirmpopup/jquery.confirm.js"></script>
<script src="${javascriptpath}/confirmpopup/jquery.confirm.min.js"></script>

<!-- <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.6/css/bootstrap.min.css"/>-->
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.11/css/dataTables.bootstrap.min.css" />
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/responsive/2.0.2/css/responsive.bootstrap.min.css" />
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/scroller/1.4.1/css/scroller.bootstrap.min.css" />

<!-- <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.6/js/bootstrap.min.js"></script> -->
<script type="text/javascript"
	src="https://cdn.datatables.net/1.10.11/js/jquery.dataTables.min.js"></script>
<script type="text/javascript"
	src="https://cdn.datatables.net/1.10.11/js/dataTables.bootstrap.min.js"></script>
<script type="text/javascript"
	src="https://cdn.datatables.net/responsive/2.0.2/js/dataTables.responsive.min.js"></script>
<script type="text/javascript"
	src="https://cdn.datatables.net/responsive/2.0.2/js/responsive.bootstrap.min.js"></script>
<script type="text/javascript"
	src="https://cdn.datatables.net/scroller/1.4.1/js/dataTables.scroller.min.js"></script>

<style>
.legend span {
	border: 1px solid #ccc;
	float: left;
	height: 12px;
	margin: 2px;
	width: 12px;
}

.legend li {
	float: left;
	margin-right: 10px;
}

.legend {
	list-style: outside none none;
}
</style>

<style>
.tab-content {
	padding: 15px;
}

.box .box-body .fc-widget-header {
	background: none;
}

.popover {
	max-width: 450px;
}
</style>
<style>
.sidebar-collapse>.wrapper>.main-sidebar>.slimScrollDiv>.sidebar>.user-panel>.image>img
	{
	height: 30px;
}

.sidebar-collapse>.wrapper>.main-sidebar>.sidebar>.user-panel>.image>img
	{
	height: 30px;
}

.user-panel>.image>img {
	height: 45px;
}
</style>

</head>

<body class="skin-blue sidebar-mini sidebar-collapse fixed">

	<div id="wrapper">
	
		<tiles:insertAttribute name="header" />
		
		<tiles:insertAttribute name="body" />

		<tiles:insertAttribute name="footer" />

		<!-- Control Sidebar -->
		<aside class="control-sidebar control-sidebar-light">
		</aside>
		<div id="slideToTop">
			<i class="fa fa-chevron-up"></i>
		</div>

	</div>
	<!-- /#wrapper -->

</body>
</html>