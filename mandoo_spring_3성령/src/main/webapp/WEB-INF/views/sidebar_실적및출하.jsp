<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<div class="sidebar">
	<ul id="sidebar-content">
		<li><a href="/mandoo/productionOrder/monthly" class="category-link ${fn:contains(pageContext.request.requestURI, 'monthlyProduction') ? 'title' : ''}">실적마감</a></li>
		<li><a href="/mandoo/shipment" class="category-link ${fn:contains(pageContext.request.requestURI, '/shipment') ? 'title' : ''}">출고확인</a></li>
	</ul>
</div>
