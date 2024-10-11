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

        <div class="mtab" style="background-color:white;">
            <form method="get" action="StockSelect">
                <input type="text" name="search" value="${searchKeyword}" placeholder="검색어 입력">
                <button type="submit" id="search-button">검색</button>
                <button type="button" onclick="location.href='Stock'" class="add-button">초기화</button>
            </form>
            <div id="open-add-popup"></div>
        </div>

        <form method="post" action="${pageContext.request.contextPath}/StockInventory">
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
                            <tr>
                                <td><c:out value="${stock.item_Code}" /></td>
                                <td><c:out value="${stock.stock_Name}" /></td>
                                <td><c:out value="${stock.stock_Count}" /></td>
                                <td><c:out value="${stock.stock_Location}" /></td>
                                <td><img class="imgg" src="resources/image/${stock.item_Code}.jpg" alt="${stock.stock_Name}"></td>
                                <td>
                                    <button type="button" class="update-button btn"
                                            data-id="${stock.stock_Id}" data-code="${stock.item_Code}"
                                            data-name="${stock.stock_Name}" data-count="${stock.stock_Count}"
                                            data-location="${stock.stock_Location}" data-sort="${stock.stock_Sort}">수정</button>
                                </td>
                                <td>
                                    <form method="post" action="deleteStock">
                                        <input type="hidden" name="action" value="${pageContext.request.contextPath}/delete"> 
                                        <input type="hidden" name="stock_Id" value="${stock.stock_Id}">
                                        <input type="submit" class="btn" value="삭제">
                                    </form>
                                </td>
                                <td>
                                    <button type="button" class="stock-update-button btn"
                                            data-id="${stock.stock_Id}" data-code="${stock.item_Code}"
                                            data-name="${stock.stock_Name}" data-count="${stock.stock_Count}"
                                            data-location="${stock.stock_Location}" data-sort="${stock.stock_Sort}" >재고 추가</button>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </form>

        <div class="pagination">
    <!-- 이전 페이지 링크 -->
    <c:choose>
        <c:when test="${currentPage > 1}">
            <a href="${pageContext.request.contextPath}/StockInventory?page=${currentPage - 1}&search=${searchKeyword}" class="prev-next">이전</a>
        </c:when>
        <c:otherwise>
            <span class="prev-next disabled">이전</span>
        </c:otherwise>
    </c:choose>
    
    <!-- 페이지 번호 링크 -->
    <c:forEach var="i" begin="1" end="${totalPages}" step="1">
        <a href="${pageContext.request.contextPath}/StockInventory?page=${i}&search=${searchKeyword}"
           class="${i == currentPage ? 'active' : ''}">${i}</a>
    </c:forEach>

    <!-- 다음 페이지 링크 -->
    <c:choose>
        <c:when test="${currentPage < totalPages}">
            <a href="${pageContext.request.contextPath}/StockInventory?page=${currentPage + 1}&search=${searchKeyword}" class="prev-next">다음</a>
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
            <h2>재고 추가</h2>
            <form method="post" action="insert">
                <input type="hidden" name="action" value="add"> 
                <label>품목 코드:</label> <input type="text" name="item_Code" required><br> 
                <label>품목명:</label> <input type="text" name="stock_Name" required><br> 
                <label>재고 수량:</label> <input type="number" name="stock_Count" required><br>
                <label>창고:</label> <input type="text" name="stock_Location" required><br>
                <label>종류:</label> <input type="text" name="stock_Sort" required><br>
                <input type="submit" value="등록">
            </form>
        </div>
    </div>

    <!-- Update Popup -->
    <div id="update-popup" class="modal">
        <div class="modal-content">
            <span id="close-update-popup" class="close">&times;</span>
            <h2>재고 수정</h2>
            <form id="update-form" method="post" action="updateAll" accept-charset="UTF-8">
                <input type="hidden" name="action" value="update"> 
                <input type="hidden" id="update-item-id" name="stock_Id"> 
                <label>품목 코드:</label> 
                <input type="text" id="update-item-code" name="item_Code" required><br> 
                <label>품목명:</label> 
                <input type="text" id="update-item-name" name="stock_Name" required><br> 
                <label>재고 수량:</label> 
                <input type="number" id="update-item-stock" name="stock_Count" required><br> 
                <label>창고:</label> 
                <input type="text" id="update-item-location" name="stock_Location" required><br>
                <label>종류:</label> 
                <input type="text" id="update-item-sort" name="stock_Sort" required><br> 
                <input type="submit" value="수정">
            </form>
        </div>
    </div>

    <!-- Stock Count Update Popup -->
    <div id="stock-update-popup" class="modal">
        <div class="modal-content">
            <span id="close-stock-update-popup" class="close">&times;</span>
            <h2>재고 수량 수정</h2>
            <form id="stock-update-form" method="post" action="updateOne">
                <input type="hidden" name="action" value="updateQuantity"> 
                <input type="hidden" id="stock-update-item-id" name="stock_Id"> 
                <label>재고 수량:</label> 
                <input type="number" id="stock-update-item-stock" name="stock_Count" required><br> 
                <input type="submit" value="수정">
            </form>
        </div>
    </div>

    <script src="resources/JS/stock.js"></script>
</body>
</html>
