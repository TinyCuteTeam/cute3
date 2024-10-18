<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<div class="sidebar">
	<ul id="sidebar-content">
		<li><a href="/mandoo/item" class="category-link ${fn:contains(pageContext.request.requestURI, '/item') ? 'title' : ''}">품목 코드 조회</a></li>
		<li><a href="/mandoo/bom?bom_Id=A00001" class="category-link ${fn:contains(pageContext.request.requestURI, '/BOM') ? 'title' : ''}">BOM(레시피관리)</a></li>
		<li><a href="/mandoo/client" class="category-link ${fn:contains(pageContext.request.requestURI, '/client') ? 'title' : ''}">거래처 관리</a></li>
		<li><a href="/mandoo/error" class="category-link ${fn:contains(pageContext.request.requestURI, '/error') ? 'title' : ''}">에러코드</a><br></li>
	</ul>
</div>
