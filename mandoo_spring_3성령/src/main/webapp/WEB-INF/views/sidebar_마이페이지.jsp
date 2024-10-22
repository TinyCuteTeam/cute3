<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<div class="sidebar">
	<ul id="sidebar-content">
		<li><a href="/mandoo/mypage" class="category-link ${fn:contains(pageContext.request.requestURI, '/mypage') ? 'title' : ''}">마이페이지</a></li>
		<!-- user_access가 2가 아닐 때만 계정관리 링크를 표시 -->
		<c:if test="${sessionScope.user_access != 2}">
			<li><a href="/mandoo/account" class="category-link ${fn:contains(pageContext.request.requestURI, '/account') ? 'title' : ''}">계정관리</a></li>
		</c:if>
		<li><a href="/mandoo/boardList" class="category-link ${fn:contains(pageContext.request.requestURI, '/board') ? 'title' : ''}">사내게시판</a></li>
		<li><a href="/mandoo/todo" class="category-link ${fn:contains(pageContext.request.requestURI, '/todo') ? 'title' : ''}">일정관리</a></li>
	</ul>
</div>
