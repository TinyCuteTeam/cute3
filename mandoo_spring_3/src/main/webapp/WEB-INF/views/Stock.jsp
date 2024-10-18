<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="kor">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>재고 현황</title>
<link rel="stylesheet" href="resources/CSS/style.css">
<link rel="stylesheet" href="resources/CSS/stock.css">
</head>
<body>
	<!-- 메인 -->
	<jsp:include page="/WEB-INF/views/header.jsp" />
	<!-- 사이드바 -->
	<jsp:include page="/WEB-INF/views/sidebar_stockmanage.jsp" />

	<!-- 내용 페이지 -->
	<div class="content">
		<h1 id="head_title">재고 현황</h1>

		<div class="mtab" style="background-color: white;">
			<form method="get" action="stockSort">
				<div style=" text-align : left;">
				<select name="item_Code" class="selectBox">
					<option value="" ${empty param.item_Code ? 'selected' : ''}>전체</option>
					<option value="P" ${param.item_Code == 'P' ? 'selected' : ''}>완제품</option>
					<option value="I" ${param.item_Code == 'I' ? 'selected' : ''}>재료</option>
				</select> <input type="submit" value="정렬">
				</div>
			</form>


			<form method="get" action="StockSelect">
				<div id="search-input" style="text-align : right;">
				<input type="text" name="search" placeholder="검색어 입력">
				<button type="submit" id="search-button">검색</button>
				<button type="button" onclick="location.href='Stock'"
					class="add-button">초기화</button>
				</div>
			</form>
			<div id="open-add-popup"></div>
		</div>

		<div class="table-container">
			<table border="1" class="inventory_table">
				<thead>
					<tr>
						<th>품목 코드</th>
						<th>품목명</th>
						<th>재고 수량</th>
						<th>창고</th>
						<th>이미지</th>
						<th>수정</th>
						<th>삭제</th>
						<th>발주</th>
						<th>증감량</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="stock" items="${list}">
						<tr>
							<td><c:out value="${stock.item_Code}" /></td>
							<td><c:out value="${stock.stock_Name}" /></td>
							<td><c:out value="${stock.stock_Count}" /></td>
							<td><c:out value="${stock.stock_Location}" /></td>
							<td><img class="imgg"
								src="resources/image/${stock.item_Code}.jpg"
								alt="${stock.stock_Name}"></td>
							<td>
								<button type="button" class="update-button btn"
									data-id="${stock.stock_Id}" data-code="${stock.item_Code}"
									data-name="${stock.stock_Name}"
									data-count="${stock.stock_Count}"
									data-location="${stock.stock_Location}"
									data-sort="${stock.stock_Sort}">수정</button>
							</td>
							<td>
								<form method="post" action="deleteStock">
									<input type="hidden" name="item_Code"
										value="${stock.item_Code}"> <input type="submit"
										class="btn" value="삭제">
								</form>
							</td>

							<td>
								<button type="button" class="stock-update-button btn"
									data-id="${stock.stock_Id}" data-code="${stock.item_Code}"
									data-name="${stock.stock_Name}"
									data-location="${stock.stock_Location}"
									data-sort="${stock.stock_Sort}">발주</button>
							</td>
							
							<form method="get" action="StockSort(info)">
							<c:if test="${stock.stock_difference > 0}">
								<td style="color: blue; text-decoration: underline;"><a
									href="StockSort(info)?stock_name=${stock.stock_Name}"
									style="color: blue;"> ▲<c:out
											value="${stock.stock_difference} BOX" />
								</a></td>
							</c:if>

							<c:if test="${stock.stock_difference == 0}">
								<td>
									<h1>
										<a href="StockSort(info)?stock_name=${stock.stock_Name}"> <c:out
												value="-" />
										</a>
									</h1>
								</td>
							</c:if>

							<c:if test="${stock.stock_difference < 0}">
								<td style="color: red;"><a
									href="StockSort(info)?stock_name=${stock.stock_Name}"
									style="color: red; text-decoration: underline;"> ▼<c:out
											value="${stock.stock_difference * -1} BOX" />
								</a></td>
							</c:if>
							</form>

						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>

		<div class="pagination">
			<!-- 이전 페이지 링크 -->
			<c:choose>
				<c:when test="${currentPage > 1}">
					<a
						href="${pageContext.request.contextPath}/stockSort?page=${currentPage - 1}&item_Code=${searchKeyword}"
						class="prev-next">이전</a>
				</c:when>
				<c:otherwise>
					<span class="prev-next disabled">이전</span>
				</c:otherwise>
			</c:choose>

			<!-- 페이지 번호 링크 -->
			<c:forEach var="i" begin="1" end="${totalPages}" step="1">
				<a
					href="${pageContext.request.contextPath}/stockSort?page=${i}&item_Code=${searchKeyword}"
					class="${i == currentPage ? 'active' : ''}">${i}</a>
			</c:forEach>

			<!-- 다음 페이지 링크 -->
			<c:choose>
				<c:when test="${currentPage < totalPages}">
					<a
						href="${pageContext.request.contextPath}/stockSort?page=${currentPage + 1}&item_Code=${searchKeyword}"
						class="prev-next">다음</a>
				</c:when>
				<c:otherwise>
					<span class="prev-next disabled">다음</span>
				</c:otherwise>
			</c:choose>
		</div>

		<!-- Add Item Popup -->
		<div id="add-item-popup" class="modal">
			<div class="modal-content">
				<span id="close-add-item-popup" class="close">&times;</span>
				<h2>발주</h2>
				<form method="post" action="insert">
					<input type="hidden" name="action" value="add"> <label>품목
						코드:</label> <input type="text" name="item_Code" required><br>
					<label>품목명:</label> <input type="text" name="stock_Name" required><br>
					<label>재고 수량:</label> <input type="number" name="stock_Count"
						required><br> <label>창고:</label> <input type="text"
						name="stock_Location" required><br> <label>종류:</label>
					<input type="text" name="stock_Sort" required><br> <input
						type="submit" value="등록">
				</form>
			</div>
		</div>

		<!-- Update Popup -->
		<div id="update-popup" class="modal">
			<div class="modal-content">
				<span id="close-update-popup" class="close">&times;</span>
				<h2>재고 수정</h2>
				<form id="update-form" method="post" action="updateAll"
					accept-charset="UTF-8">
					<input type="hidden" name="action" value="update"> <input
						type="hidden" id="update-item-id" name="stock_Id"> <label>품목
						코드:</label> <input type="text" id="update-item-code" name="item_Code"
						required><br> <label>품목명:</label> <input type="text"
						id="update-item-name" name="stock_Name" required><br>
					<label>재고 수량:</label> <input type="number" id="update-item-stock"
						name="stock_Count" required><br> <label>창고:</label> <input
						type="text" id="update-item-location" name="stock_Location"
						required><br> <label>종류:</label> <input type="text"
						id="update-item-sort" name="stock_Sort" required><br>
					<input type="submit" value="수정">
				</form>
			</div>
		</div>

		<!-- Stock Count Update Popup -->
		<div id="stock-update-popup" class="modal">
			<div class="modal-content">
				<span id="close-stock-update-popup" class="close">&times;</span>
				<h2>발주</h2>
				<form id="stock-update-form" method="post" action="updateOne">
					<input type="hidden" name="action" value="updateQuantity">
					<input type="hidden" id="stock-update-item-id" name="stock_Id">
					<select name="order_supply">
						<option name="order_supply" value="A식자재 마트">A식자재 마트</option>
						<option name="order_supply" value="B식자재 마트">B식자재 마트</option>
						<option name="order_supply" value="C식자재 마트">C식자재 마트</option>
						<option name="order_supply" value="D식자재 마트">D식자재 마트</option>
					</select>
					<!-- <input type="hidden" name="order_supply" value="OO 식자재 마트"> 상수로 설정 -->


					<input type="hidden" name="order_time"
						value="<%=new java.sql.Date(System.currentTimeMillis())%>">
					<!-- 현재 시간 설정 -->
					<input type="hidden" name="order_name" id="order_name">
					<!-- 발주할 품목명 -->
					<label>발주 할 수량 :</label> <input type="number"
						id="stock-update-item-stock" name="order_count"
						placeholder="발주 할 수량 입력" required><br> <input
						type="submit" value="발주하기">
				</form>
			</div>
		</div>

		<script src="resources/JS/stock.js"></script>
	</div>
</body>
</html>
