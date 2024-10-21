<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<div class="sidebar">
	<ul id="sidebar-content">
		<li><a href="/mandoo/FaultyRead" class="category-link ${fn:contains(pageContext.request.requestURI, 'Faulty') ? 'title' : ''}">불량률파악보고서</a></li>
		<li><a href="/mandoo/error/chart" class="category-link ${fn:contains(pageContext.request.requestURI, 'chart') ? 'title' : ''}">에러수량</a></li>
	</ul>
</div>
