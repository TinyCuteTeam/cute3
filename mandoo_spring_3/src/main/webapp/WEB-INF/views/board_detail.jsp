<%@ page contentType="text/html; charset=UTF-8" language="java"%>
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
	href="${pageContext.request.contextPath}/CSS/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/CSS/사내게시판상세페이지.css">
</head>

<body>
	<!-- 메인 -->
	<jsp:include page="/WEB-INF/views/header.jsp" />

	<!-- 사이드바 -->
	<jsp:include page="/WEB-INF/views/sidebar_마이페이지.jsp" />

	<!-- 내용페이지 -->
	<div class="content">
		<div class="post-details">
			<h2 id="post-title">${post.boardTitle}</h2>
			<table>
				<tr class="menu">
					<td><strong>작성자</strong></td>
					<td><strong>날짜</strong></td>
				</tr>
				<tr>
					<td><span id="post-author">${post.userName}</span></td>
					<td><span id="post-date"><fmt:formatDate
								value="${post.boardDate}" pattern="yyyy-MM-dd" /></span></td>

				</tr>
			</table>

			<div id="post-content">${post.boardContents}</div>
			<button id="back-button" onclick="history.back();">목록으로 돌아가기</button>
		</div>

		<!-- 댓글 섹션 (추가 가능) -->
		<div class="comment-section">
			<h3>댓글</h3>
			<form id="comment-form">
				<div id="comment-id"></div>
				<textarea id="comment-content" placeholder="댓글을 입력하세요." required></textarea>
				<button type="submit">댓글 추가</button>
			</form>
			<div id="comment-list"></div>
		</div>
	</div>

	<script src="${pageContext.request.contextPath}/JS/사내게시판상세페이지.js"></script>
</body>

</html>
