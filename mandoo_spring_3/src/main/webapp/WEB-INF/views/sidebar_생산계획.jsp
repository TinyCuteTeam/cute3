<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="sidebar">
	<ul id="sidebar-content">
		<!-- user_access가 2가 아닐 때 발주확인과 생산계획이 보이도록 설정 -->
		<c:if test="${sessionScope.user_access != 2}">
			<li><a href="/mandoo/OrderInfo" class="category-link">발주확인</a></li>
			<li><a href="/mandoo/ProductPlan" class="category-link">생산계획</a></li>
		</c:if>
		<!-- user_access가 2일 때나 아닐 때 모두 작업지시서가 보이도록 설정 -->
		<li><a href="/mandoo/Work" class="category-link">작업지시서</a></li>
	</ul>
</div>