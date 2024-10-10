<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Mandoo</title>
<link rel="stylesheet"
	href="resources/CSS/style.css">
<link rel="stylesheet"
	href="resources/CSS/item.css">
	<style>
/* 스타일 */
/* 모달창 스타일 */
#addModal { /*모달창 열었을 때 까만배경*/
	display: none; /* 기본적으로 숨김 */
	position: fixed;
	z-index: 1;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgb(0, 0, 0);
	background-color: rgba(0, 0, 0, 0.4); /* 배경을 반투명하게 */
	padding-top: 60px;
}

.modalContent {
	background-color: #fefefe;
	margin: 5% auto;
	padding: 20px;
	border: 1px solid #888;
	width: 80%;
	max-width: 500px;
	box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.3); /* 그림자 효과 */
	border-radius: 10px; /* 모서리 둥글게 */
}

#addModal input[type="text"], #addModal input[type="file"] {
	width: 100%;
	padding: 10px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

#addModal button {
	width: 100%;
	background-color: #e6e6e6;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

#addModal button:hover {
	background-color: #0085FF;
	color: white;
}

/* 모달창을 닫는 버튼 */
#addModal .close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
	/*    margin-right: -15px; */
	/*    margin-top: -15px; */
}

#addModal .close:hover, #addModal .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}
</style>
</head>

<body>
	<!-- 헤더 포함 -->
	<jsp:include page="/WEB-INF/views/header.jsp" />
	<!-- 사이드바 -->
	<jsp:include page="/WEB-INF/views/sidebar_기준관리.jsp" />
	<!-- 내용페이지 -->
	<div class="content">
		<h1>품목 코드 조회</h1>

		<!-- 품목 추가 모달창 오픈 버튼 -->
		<div class="srPlus">
			<button class="plus addBtn" onclick="openAddModal()">품목추가</button>
		</div>

		<!-- 품목코드표 테이블 -->
		<table id="table" class="srTable" border="solid black 1px;">
			<tr>
				<th class="srTh">품목코드</th>
				<th class="srTh">품목명</th>
				<th class="srTh">이미지</th>
				<th class="srTh">수정</th>
				<th class="srTh">삭제</th>
			</tr>
			<c:forEach var="item" items="${list}">
				<tr>
					<td>${item.item_Code}</td>
					<td>${item.item_Name}</td>
					<td><img class="ingre"
						src="resources/image/${item.item_Code}.jpg"></td>
					<td>
						<button class="pen editButton"
							onclick="openEditModal('${item.item_Code}', '${item.item_Name}')">
							수정</button>
					</td>
					<td>
<%-- 						<form action="${pageContext.request.contextPath}/Item" --%>
<!-- 							method="post"> -->
						<form action="/WEB-INF/views/item" 
							method="post">
							<input type="hidden" name="action" value="delete"> <input
								type="hidden" name="itemCode" value="${item.item_Code}">
							<button class="editButton" type="submit">삭제</button>
						</form>
					</td>
				</tr>
			</c:forEach>
		</table>

		<!-- 페이징 네비게이션 -->
		<div class="pagination">
			<c:if test="${currentPage > 1}">
				<a
					href="${pageContext.request.contextPath}/Item?page=${currentPage - 1}">이전</a>
			</c:if>

			<c:forEach begin="1" end="${totalPages}" var="i">
				<a href="${pageContext.request.contextPath}/Item?page=${i}"
					class="${i == currentPage ? 'active' : ''}"> ${i} </a>
			</c:forEach>

			<c:if test="${currentPage < totalPages}">
				<a
					href="${pageContext.request.contextPath}/Item?page=${currentPage + 1}">다음</a>
			</c:if>
		</div>

		<!-- 모달 창 -->
		<div id="addModal">
			<div class="modalContent">
				<span class="close">&times;</span>
				<h2 id="modalTitle">품목 추가</h2>
				<form id="itemForm" action="${pageContext.request.contextPath}/Item"
					method="post" enctype="multipart/form-data">
					<input type="hidden" id="itemId" name="itemId"> 품목 코드: <br>
					<input type="text" id="itemCode" name="itemCode" placeholder="품목코드"><br>
					품 목 명: <br> <input type="text" id="itemName" name="itemName"
						placeholder="품목명"><br> 이미지추가:<input type="file"
						id="itemImage" name="itemImage" accept="image/*"><br>
					<button type="submit" id="saveItem">저장</button>
				</form>
			</div>
		</div>

		<script>
			function openAddModal() {
				document.getElementById('modalTitle').textContent = '품목 추가';
				document.getElementById('itemForm').reset(); // 폼 리셋
				document.getElementById('itemForm').action = '${pageContext.request.contextPath}/Item?action=add';
				document.getElementById('addModal').style.display = 'block';
			}

			function openEditModal(code, name) {
				document.getElementById('modalTitle').textContent = '품목 수정';
				document.getElementById('itemCode').value = code;
				document.getElementById('itemName').value = name;
				document.getElementById('itemForm').action = '${pageContext.request.contextPath}/Item?action=update';
				document.getElementById('addModal').style.display = 'block';
			}

			document
					.querySelector('.close')
					.addEventListener(
							'click',
							function() {
								document.getElementById('addModal').style.display = 'none';
							});

			window.onclick = function(event) {
				if (event.target == document.getElementById('addModal')) {
					document.getElementById('addModal').style.display = 'none';
				}
			}
		</script>
	</div>
</body>
</html>
