<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Mandoo</title>
<link rel="stylesheet" href="resources/CSS/style.css">
<link rel="stylesheet" href="resources/CSS/orderInfo.css">
</head>

<body>

    <%-- 헤더 및 사이드바 포함 --%>
    <jsp:include page="/WEB-INF/views/header.jsp" />
    <jsp:include page="/WEB-INF/views/sidebar_생산계획.jsp" />

    <!-- 내용페이지 -->
    <div class="content">
        <div class="flex srTh">
            <div>거래처</div>
            <div>발주일</div>
            <div>출고예정일</div>
            <div>상품명</div>
            <div>개수(EA)</div>
            <div>단가(원)</div>
        </div>

        <c:forEach var="order" items="${list}">
            <div class="flex round">
                <div class="flex-client">
                    <a href="/mandoo/client">${order.client_Id}</a>
                </div>
                <div>${order.order_Date}</div>
                <div>${order.order_EndDate}</div>
                <div>${order.product_Name}</div>
                <div>${order.order_Count}</div>
                <div>${order.order_Price}</div>
            </div>
        </c:forEach>

        <!-- 페이징 -->
        <div class="pagination">
            <c:if test="${currentPage > 1}">
                <a href="/mandoo/OrderInfo?page=${currentPage - 1}">이전</a>
            </c:if>

            <c:forEach var="i" begin="1" end="${totalPages}">
                <a href="/mandoo/OrderInfo?page=${i}" class="${i == currentPage ? 'active' : ''}">${i}</a>
            </c:forEach>

            <c:if test="${currentPage < totalPages}">
                <a href="/mandoo/OrderInfo?page=${currentPage + 1}">다음</a>
            </c:if>
        </div>
    </div>

    <script src="resources/JS/orderInfo.js"></script>
</body>

</html>
