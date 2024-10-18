<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Mandoo</title>
<link rel="stylesheet" href="resources/CSS/style.css">
<link rel="stylesheet" href="resources/CSS/item.css">
<style>
/* 스타일 */
/* 모달창 스타일 */
/* 모달 배경 */
.popup {
	display: none; /* 기본적으로 숨김 */
	position: fixed;
	z-index: 1;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgba(0, 0, 0, 0.4); /* 배경을 반투명하게 */
	padding-top: 60px;
}

/* 모달 콘텐츠 */
.popup-content {
	background-color: #fefefe;
	margin: 5% auto;
	padding: 20px;
	border: 1px solid #888;
	width: 80%;
	max-width: 500px;
	box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.3); /* 그림자 효과 */
	border-radius: 10px; /* 모서리 둥글게 */
}

/* 입력 필드 스타일 */
.modalStyle input[type="text"], .modalStyle textarea {
	width: 100%;
	padding: 10px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

/* 저장 버튼 스타일 */
.modalStyle button {
	width: 100%;
	background-color: #e6e6e6;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

.modalStyle button:hover {
	background-color: #0085FF;
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

	<!-- 헤더 포함 -->
	<jsp:include page="/WEB-INF/views/header.jsp" />
	<!-- 사이드바 -->
	<jsp:include page="/WEB-INF/views/sidebar_기준관리.jsp" />
	<!-- 내용페이지 -->
	<div class="content">
		<h1>품목 코드 조회</h1>

		<!-- 품목 추가 모달창 오픈 버튼 -->
		<div class="srPlus">
			<button class="plus" id="addButton">품목추가</button>
		</div>

		<!-- 품목코드표 테이블 -->
		<table id="table" class="srTable" border="solid black 1px;">
			<tr>
				<th class="srTh thwidth">품목코드</th>
				<th class="srTh ">품목명</th>
<!-- 				<th class="srTh">품목종류</th> -->
<!-- 				<th class="srTh">이미지</th> -->
				<th class="srTh thwidth">수정</th>
				<th class="srTh thwidth">삭제</th>
			</tr>
			<c:forEach var="item" items="${list}">
				<tr>
					<td>${item.item_Code}</td>
					<td>${item.item_Name}</td>
<%-- 					<td>${item.type}</td> --%>
<!-- 					이미지 나오는 부분 -->
<!-- 					<td><img class="ingre" -->
<%-- 						src="resources/image/${item.item_Code}.jpg"></td> --%>
						
<!-- 						이게 원래 수정 코드  -->
<!-- 					<td><button class="pen editButton"> 수정</button></td> -->
							
					<td>
                    <form method="post" action="update" class="updateForm">
                        <input type="hidden" name="item_Code" value="${item.item_Code}">
                        <input type="hidden" name="item_Name" value="${item.item_Name}">
                        <input type="hidden" name="type" value="${item.type}">
                        <button type="button" class="editButton" 
    					data-item-code="${item.item_Code}" 
    					data-item-name="${item.item_Name}" 
    					data-item-type="${item.type}">수정</button>
                    </form>
                	</td>		
							
							
					<td><form method="post" action="itemDelete">
							<!-- 							<input type="hidden" name="action" value="delete">  -->
							<input type="hidden" name="item_Code" value="${item.item_Code}">
							<button type="submit" class="editButton">삭제</button>
						</form></td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<!-- 페이징 네비게이션 -->
	<div class="pagination">
    <c:if test="${currentPage > 1}">
        <a href="${pageContext.request.contextPath}/item?page=${currentPage - 1}">이전</a>
    </c:if>

    <c:forEach begin="1" end="${totalPages}" var="i">
        <a href="${pageContext.request.contextPath}/item?page=${i}" class="${i == currentPage ? 'active' : ''}">
            ${i}
        </a>
    </c:forEach>

    <c:if test="${currentPage < totalPages}">
        <a href="${pageContext.request.contextPath}/item?page=${currentPage + 1}">다음</a>
    </c:if>
</div>

	<!-- 모달 창 -->
	<div id="popup" class="popup modalStyle">
		<div class="popup-content">
			<span class="close-popup" id="close-popup">&times;</span>
			<h2>품목 추가</h2>

			<form id="itemForm" method="post" action="itemInsert">

				<input type="hidden" name="action" id="action" value="add">

				* 품목 코드 : <br> 
				<input type="text" id="itemCode" name="item_Code" placeholder="품목코드"><br> 
				* 품 목 명 : <br> 
				<input type="text" id="itemName" name="item_Name" placeholder="품목명"><br>
				* 종   류 : 원재료, 완제품 <br> 
				<input type="text" id="itemType" name="type" placeholder="종류"><br> 
<!-- 				이미지추가: <br>  -->
<!-- 				<input type="file" id="itemImage" name="itemImage" accept="image/*"><br> -->
				<br>	
				<div class=required> * 표시는 필수 항목입니다. </div>
				<button type="submit" id="saveItem">저장</button>

			</form>
		</div>
	</div>

	<!-- 수정용 모달창 -->
	<div id="popup_update" class="popup modalStyle">
		<div class="popup-content">
			<span class="close-popup" id="updateClose">&times;</span>
			<h2>품목 상세수정</h2>
			<form id="item_editForm" method="post" action="itemUpdate">

				<input type="hidden" name="action" id="actionEdit" value="update">

				품목 코드: <br>
				 ※ 품목코드는 수정할 수 없습니다 <br>  
				
				<input type="hidden" id="edit_itemCode" name="item_Code" placeholder="품목코드"><br> 
				품 목 명: <br> 
				<input type="text" id="edit_itemName" name="item_Name" placeholder="품목명"><br>
				종 류: 원재료, 완제품 <br> 
				<input type="text" id="edit_itemType" name="type" placeholder="종류"><br> 
<!-- 				이미지추가: <br>  -->
<!-- 				<input type="file" id="edit_itemImage" name="itemImage" accept="image/*"><br> -->
				<button type="submit" id="saveUpdate">저장</button>

			</form>
		</div>
	</div>




	<script src="resources/JS/item.js"></script>
</body>
</html>
