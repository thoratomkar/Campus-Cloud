<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@taglib  uri="http://www.springframework.org/security/tags" prefix="security" %>

<c:set var="contextroot" value="${pageContext.request.contextPath}" scope="application" />
<c:set var="imagepath" value="${contextroot}/static/images" scope="application" />
<c:set var="csspath" value="${contextroot}/static/css" scope="application" />
<c:set var="javascriptpath" value="${contextroot}/static/js" scope="application" />
<c:set var="jspathpage" value="${contextroot}/static/js/pages" scope="application" />
<c:set var="jspathjquery" value="${contextroot}/static/js/jquery-ui-1.11.2" scope="application" />
<c:set var="contextRootApp" value="${contextroot}/App" scope="application" />
<c:set var="pathinfo" value="${fn:split(requestScope['javax.servlet.forward.request_uri'], '/')}" />
<c:set var="subtab" value="${pathinfo[fn:length(pathinfo) - 1]}" />
<c:set var="tab" value="${pathinfo[fn:length(pathinfo) - 2]}" />
<c:set var="maintab" value="${pathinfo[fn:length(pathinfo) - 3]}" />

