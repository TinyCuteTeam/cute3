<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="kor">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Mandoo</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/CSS/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/CSS/마이페이지.css">
	
	<style>
	.editBtn {
    background-color:rgba(0, 0, 0, 0);
    border: none;
    text-decoration: underline;
	text-decoration-thickness: 1px;
    cursor: pointer;
}
	
	</style>
</head>

<body>
	<!-- 메인 -->
	<jsp:include page="/WEB-INF/views/header.jsp" />
	<!-- 사이드바 -->
	<jsp:include page="/WEB-INF/views/sidebar_마이페이지.jsp" />
	<!-- 내용페이지  -->
	<div class="content">
		<div id="content-display">
			<div class="gwrap">
				<div style="text-align:right;"><h1>마이페이지</h1> <button class="editBtn" >수정</button></div>
				<div class="g_top">
					<table>
						<tr>
							<td rowspan="7"><img class="pic"
								src="${pageContext.request.contextPath}/resources/image/그로밋.png"></td>
							<td class="grey">이름</td>
							<td colspan="2">${mypage.mypage_Name}</td>
						</tr>
						<tr>
							<td class="grey">소속</td>
							<td colspan="2">${mypage.mypage_Affiliation}</td>
							<!-- 수정 -->
						</tr>
						<tr>
							<td class="grey">내선번호</td>
							<td>${mypage.mypage_Phone}</td>
							<!-- 수정 -->
						</tr>
						<tr>
							<td class="grey">이메일</td>
							<td>${mypage.mypage_Phone}</td>
							<!-- 수정 -->
							<td class="grey">휴대폰번호</td>
							<td>${mypage.mypage_Phone}</td>
							<!-- 수정 -->
						</tr>
						<tr>
							<td class="grey">직위 / 직책</td>
							<td>${mypage.mypage_Position}</td>
							<!-- 수정 -->
							<td class="grey">대표전화</td>
							<td>${mypage.mypage_Mainnum}</td>
							<!-- 수정 -->
						</tr>
					
					</table>
				</div>
			</div>
		</div>
	</div>

	<script
		src="${pageContext.request.contextPath}/resources/JS/마이페이지.js"></script>
</body>

</html>
