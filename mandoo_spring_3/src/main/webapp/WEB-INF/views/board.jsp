<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ page import="kr.co.mandoo.dto.UserDTO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="kor">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Mandoo</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/CSS/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/CSS/사내게시판.css">
</head>

<body>
	<jsp:include page="/WEB-INF/views/header.jsp" />
	<!-- 사이드바 -->
	<jsp:include page="/WEB-INF/views/sidebar_마이페이지.jsp" />
	<div class="content">
		<h1>사내 게시판</h1>
		<button id="write-button" onclick="window.location.href='/boardAdd'">글쓰기</button>

		<table id="posts-table">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>날짜</th>
					<th>글쓴이</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="post" items="${posts}">
					<tr>
						<td>${fn:substring(post.bord_Id, 1, fn:length(post.bord_Id))}</td>
						<td><a
							href="${pageContext.request.contextPath}/board/detail?bord_id=${post.bord_Id}">${post.board_Title}</a></td>
						<td><fmt:formatDate value="${post.board_Date}"
								pattern="yyyy-MM-dd" /></td>
						<td>${post.user_Name}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
		
		<!-- 페이징 -->
<div class="pagination">
    <c:if test="${currentPage > 1}">
        <a href="${pageContext.request.contextPath}/boardList?page=${currentPage - 1}">이전</a>
    </c:if>

    <c:forEach var="i" begin="1" end="${totalPages}">
        <a href="${pageContext.request.contextPath}/boardList?page=${i}"
            class="${i == currentPage ? 'active' : ''}">${i}</a>
    </c:forEach>

    <c:if test="${currentPage < totalPages}">
        <a href="${pageContext.request.contextPath}/boardList?page=${currentPage + 1}">다음</a>
    </c:if>
</div>



		<!-- 성공 및 오류 메시지 표시 -->
		<c:if test="${not empty param.success}">
			<div class="success-message">${param.success}</div>
		</c:if>
		<c:if test="${not empty param.error}">
			<div class="error-message">${param.error}</div>
		</c:if>
	</div>
	</div>
	<script src="${pageContext.request.contextPath}/resources/JS/사내게시판.js"></script>
</body>

</html>
