<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="kor">

<head>
<meta charset="UTF-8">
<title>생산 계획 관리</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/productionPlan.css">
<style>
.popup {
	display: none;
	/* 기본적으로 숨김 */
	position: fixed;
	z-index: 1;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgb(0, 0, 0);
	background-color: rgba(0, 0, 0, 0.4);
	/* 배경을 반투명하게 */
	padding-top: 60px;
}

/* 모달 콘텐츠 */
.popup-content {
	background-color: #fefefe;
	margin: 5% auto;
	padding: 20px;
	border: 1px solid #888;
	width: 80%;
	height: 600px;
	max-width: 500px;
	box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.3);
	/* 그림자 효과 */
	border-radius: 10px;
	/* 모서리 둥글게 */
}

/* 입력 필드 스타일 */
#popup input[type="text"], #popup input[type="date"], #popup input[type="number"],
	#popup textarea {
	width: 100%;
	padding: 10px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

/* 저장 버튼 스타일 */
#popup button {
	width: 100%;
	background-color: #e6e6e6;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

#popup button:hover {
	background-color: #007bff;
	color: white;
}

/* 모달 닫기 버튼 */
.close-popup {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close-popup:hover, .close-popup:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}
</style>
</head>

<body>
	<jsp:include page="/WEB-INF/views/header.jsp" />
	<jsp:include page="/WEB-INF/views/sidebar_생산계획.jsp" />

	<!-- 내용페이지 -->
	<div class="content">
		<!-- 검색 입력 필드 및 버튼 추가 -->
		<div class="search-container">
			<input type="text" id="search-input" placeholder="검색어를 입력하세요...">
			<button id="search-button">검색</button>
			<button id="cancel-button">취소</button>
		</div>

		<!-- 		<!-- 생산계획 버튼들 -->
		<!-- 		<div class="wrap"> -->
		<!-- 			<div class="action-buttons"> -->
		<!-- 				<button id="add-button">등록</button> -->
		<!-- 				<form id="delete-form" method="post" action="deleteProductionPlan" -->
		<!-- 					style="display: inline;"> -->
		<!-- 					<input type="hidden" name="plan_id" value="plan_id"> -->
		<!-- 					<button type="submit" id="delete-button">삭제</button> -->
		<!-- 				</form> -->
		<!-- 			</div> -->
		<!-- 		</div> -->





		<form id="plan-list-form" method="post" action="deleteProductionPlan">
			<div class="action-buttons">
				<input type="button" id="add-button" value="등록">
				<button type="submit" id="delete-button">삭제</button>
			</div>
			<div class="flex round srTh" style="border: 0px;">
				<div>선택</div>
				<div>계획 ID</div>
				<div>계획 이름</div>
				<div>계획 시작일</div>
				<div>계획 종료일</div>
				<div>계획 수량</div>
				<div>계획 내용</div>
			</div>
			<input type="hidden" name="action" value="delete">
			<div id="data-container">
				<c:forEach var="plan" items="${list}">
					<div class="flex round">
						<div>
							<input type="checkbox" class="item-checkbox" name="plan_id"
								value="${plan.plan_id}">
						</div>
						<div>${plan.plan_id}</div>
						<div>${plan.plan_contents}</div>
						<div>
							<fmt:formatDate value="${plan.plan_date}" pattern="yyyy-MM-dd" />
						</div>
						<div>
							<fmt:formatDate value="${plan.plan_end_date}"
								pattern="yyyy-MM-dd" />
						</div>
						<div>${plan.plan_count}</div>
						<div class="mover">${plan.plan_name}</div>
					</div>
				</c:forEach>
			</div>
		</form>


		<!-- 페이징 -->
		<div class="pagination">
			<c:if test="${currentPage > 1}">
				<a href="/mandoo/ProductPlan?page=${currentPage - 1}">이전</a>
			</c:if>

			<c:forEach var="i" begin="1" end="${totalPages}">
				<a href="/mandoo/ProductPlan?page=${i}"
					class="${i == currentPage ? 'active' : ''}">${i}</a>
			</c:forEach>

			<c:if test="${currentPage < totalPages}">
				<a href="/mandoo/ProductPlan?page=${currentPage + 1}">다음</a>
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

	<!-- 모달 창 -->
	<div id="popup" class="popup" style="display: none;">
		<div class="popup-content">
			<span id="close-popup" class="close-popup">&times;</span>
			<h2>생산계획 등록</h2>
			<form id="registration-form" method="post" action="insertProductionPlan">
			    <input type="hidden" name="action" value="add">
			
			    <label for="plan-number">생산계획 ID:</label><br>
			    <input type="text" id="plan-number" name="plan_id" placeholder="생산계획 ID" required><br>
			
			    <label for="item-name">생산계획 내용:</label><br>
			    <input type="text" id="item-name" name="plan_contents" placeholder="생산계획 내용" required><br>
			
			    <label for="plan-date">생산계획 날짜:</label><br>
			    <input type="date" id="plan-date" name="plan_date" required><br>
			
			    <label for="plan-end-date">종료 날짜:</label><br>
			    <input type="date" id="plan-end-date" name="plan_end_date" required><br>
			
			    <label for="production-quantity">생산 수량:</label><br>
			    <input type="number" id="production-quantity" name="plan_count" placeholder="생산 수량" required><br>
			
			    <label for="status">생산계획 이름:</label><br>
			    <input type="text" id="status" name="plan_name" placeholder="생산계획 이름" required><br><br>
			
			    <button type="submit">등록</button>
			</form>	
		</div>
	</div>

	<script src="resources/JS/productionPlan.js"></script>
</body>

</html>