<%@include file="../../taglib_includes.jsp"%>
<security:authentication var="user" property="principal" />
<header class="main-header">

	<a class="logo" href="#"><span class="logo-mini">CC</span> <span
		class="logo-lg">CampusCloud<sup>TM</sup></span></a>

	<nav class="navbar navbar-static-top" >
		
		<div class="pull-right" style="margin: 8px;">
		<a class="text-center btn btn-primary btn-block btn-flat" href="${contextroot}/login">Back To Login Page</a>
		</div>
	</nav>

</header>