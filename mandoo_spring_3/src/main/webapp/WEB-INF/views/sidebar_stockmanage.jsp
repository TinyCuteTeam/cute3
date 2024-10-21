<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<div class="sidebar">
	<ul id="sidebar-content">
		<li>
			<a href="/mandoo/Stock" class="category-link ${fn:contains(pageContext.request.requestURI, '/Stock') || fn:contains(pageContext.request.requestURI, '/Stockog') || fn:contains(pageContext.request.requestURI, '/Stocksub') ? 'title' : ''}">재고현황</a>
		</li>
		<ul>
			<li>
				<a href="/mandoo/Stockog" class="category-link ${fn:contains(pageContext.request.requestURI, '/Stockog') ? 'title' : ''}">완제품</a>
			</li>
			<li>
				<a href="/mandoo/Stocksub" class="category-link ${fn:contains(pageContext.request.requestURI, '/Stocksub') ? 'title' : ''}">원재료</a>
			</li>
		</ul>
	</ul>
</div>
