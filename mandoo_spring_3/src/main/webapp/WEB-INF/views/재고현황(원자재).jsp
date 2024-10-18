<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="kor">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>재고 현황</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/CSS/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/CSS/재고현황.css">
</head>
<body>
	<!-- 메인 -->
	<jsp:include page="/WEB-INF/views/header.jsp" />
	<!-- 사이드바 -->
	<jsp:include page="/WEB-INF/views/sidebar_stockmanage.jsp" />

	<!-- 내용 페이지 -->
	<div class="content">
		<h1 id="head_title">재고 현황 (완제품)</h1>

		<div class="mtab">
			<form method="get"
				action="${pageContext.request.contextPath}/RawMaterialStockInventory">
				<input type="text" name="search" value="${searchKeyword}"
					placeholder="검색어 입력">
				<button type="submit" id="search-button">검색</button>
				<button type="button"
					onclick="location.href='${pageContext.request.contextPath}/RawMaterialStockInventory'"
					class="add-button">초기화</button>
			</form>
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
					</tr>
				</thead>
				<tbody>
					<c:forEach var="stock" items="${stockList}">
						<tr>
							<td><c:out value="${stock.itemCode}" /></td>
							<td><c:out value="${stock.stockName}" /></td>
							<td><c:out value="${stock.stockCount}" /></td>
							<td><c:out value="${stock.stockLocation}" /></td>
							<td><img class="imgg"
								src="${pageContext.request.contextPath}/image/${stock.itemCode}.jpg"
								alt="${stock.stockName}"></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>

		<div class="pagination">
			<c:forEach var="i" begin="1" end="${totalPages}" step="1">
				<a
					href="${pageContext.request.contextPath}/RawMaterialStockInventory?page=${i}&search=${searchKeyword}"
					class="${i == currentPage ? 'active' : ''}">${i}</a>
			</c:forEach>
		</div>
	</div>
</body>
</html>
