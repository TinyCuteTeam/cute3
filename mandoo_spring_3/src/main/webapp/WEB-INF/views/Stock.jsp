<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
			<form method="get" action="StockSelect">
				<input type="text" name="search" value="${searchKeyword}"
					placeholder="검색어 입력">
				<button type="submit" id="search-button">검색</button>
				<button type="button" onclick="location.href='Stock'"
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
						<th>수정</th>
						<th>삭제</th>
						<th>재고 추가</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="stock" items="${list}">
						<!-- list 대신 pagedList로 변경 -->
						<tr>
							<td><c:out value="${stock.item_Code}" /></td>
							<td><c:out value="${stock.stock_Name}" /></td>
							<td><c:out value="${stock.stock_Count}" /></td>
							<td><c:out value="${stock.stock_Location}" /></td>
							<td><img class="imgg"
								src="resources/image/${stock.item_Code}.jpg"
								alt="${stock.stock_Name}"></td>
							<td>
								<button type="button" class="update-button btn">수정</button>
							</td>
							<td>
								<form method="post" action="deleteStock">
									<input type="hidden" name="stock_Id" value="${stock.stock_Id}">
									<input type="submit" class="btn" value="삭제">
								</form>
							</td>
							<td>
								<button type="button" class="stock-update-button btn">재고
									추가</button>
							</td>
						</tr>
					</c:forEach>
				</tbody>

				</tbody>
			</table>
		</div>

		<div class="pagination">
			<!-- 이전 페이지 링크 -->
			<c:choose>
				<c:when test="${currentPage > 1}">
					<a
						href="?page=${currentPage - 1}${not empty searchKeyword ? '&search=' + searchKeyword : ''}"
						class="prev-next">이전</a>
				</c:when>
				<c:otherwise>
					<span class="prev-next disabled">이전</span>
				</c:otherwise>
			</c:choose>

			<!-- 페이지 번호 링크 -->
			<c:forEach var="i" begin="1" end="${totalPages}">
				<a
					href="?page=${i}${not empty searchKeyword ? '&search=' + searchKeyword : ''}"
					class="${i == currentPage ? 'active' : ''}">${i}</a>
			</c:forEach>

			<!-- 다음 페이지 링크 -->
			<c:choose>
				<c:when test="${currentPage < totalPages}">
					<a
						href="?page=${currentPage + 1}${not empty searchKeyword ? '&search=' + searchKeyword : ''}"
						class="prev-next">다음</a>
				</c:when>
				<c:otherwise>
					<span class="prev-next disabled">다음</span>
				</c:otherwise>
			</c:choose>
		</div>
	</div>

	<script src="resources/JS/stock.js"></script>
</body>
</html>
