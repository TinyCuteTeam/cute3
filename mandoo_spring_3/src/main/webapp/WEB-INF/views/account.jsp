<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Mandoo - 계정 관리</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/CSS/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/CSS/계정관리.css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp" />
	<jsp:include page="/WEB-INF/views/sidebar_마이페이지.jsp" />

	<div class="content">
		<div id="content-display">
			<div class="main">
				<div class="flex header srTh">
					<div></div>
					<div>아이디</div>
					<div>이름</div>
					<div>이메일</div>
					<div>승인</div>
					<div>거절</div>
				</div>

				<c:forEach var="account" items="${accounts}">
					<div class="flex round">
						<div>${account.account_Id}</div>
						<div>${account.account_Name}</div>
						<div>${account.account_Email}</div>
						<!-- 승인 버튼 -->
						<form method="post" action="${pageContext.request.contextPath}/account/approve">
							<input type="hidden" name="account_Id" value="${account.account_Id}">
							<button type="submit" class="btn1">승인</button>
						</form>
						<!-- 거절 버튼 -->
						<form method="post" action="${pageContext.request.contextPath}/account/reject">
							<input type="hidden" name="account_Id" value="${account.account_Id}">
							<button type="submit" class="btn2">거절</button>
						</form>
					</div>
				</c:forEach>

			</div>

			<!-- 페이징 네비게이션 -->
			<div class="pagination">
				<c:if test="${currentPage > 1}">
					<a href="${pageContext.request.contextPath}/account?page=${currentPage - 1}">이전</a>
				</c:if>
				<c:forEach var="i" begin="1" end="${totalPages}">
					<c:choose>
						<c:when test="${i == currentPage}">
							<span>${i}</span> <!-- 현재 페이지 -->
						</c:when>
						<c:otherwise>
							<a href="${pageContext.request.contextPath}/account?page=${i}">${i}</a> <!-- 페이지 링크 -->
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${currentPage < totalPages}">
					<a href="${pageContext.request.contextPath}/account?page=${currentPage + 1}">다음</a>
				</c:if>
			</div>

			<!-- 오류 메시지 표시 -->
			<c:if test="${not empty errorMessage}">
				<script>
					alert('${errorMessage}');
				</script>
			</c:if>

			<!-- 성공 메시지 표시 -->
			<c:if test="${not empty successMessage}">
				<script>
					alert('${successMessage}');
				</script>
			</c:if>
		</div>
	</div>
</body>
</html>
