<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mandoo</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/출하확인.css">
</head>

<body>
    <jsp:include page="/WEB-INF/views/header.jsp" />
    <jsp:include page="/WEB-INF/views/sidebar_실적및출하.jsp" />

    <div class="content">
        <div id="content-display"></div>

        <div class="main">
            <h1>출하 목록</h1>
            
            <div class="flex srTh">
                <div>거래처명</div>
                <div>상품명</div>
                <div>수량</div>
                <div>금액</div>
                <div>주문일</div>
                <div>출고</div>
            </div>

            <c:forEach var="shipment" items="${pagedShipments}">
                <div class="flex round">
                    <div>
                        <a href="/mandoo/client">${shipment.client_Id}</a>
                    </div>
                    <div>${shipment.product_Name}</div>
                    <div>${shipment.order_Count}</div>
                    <div>${shipment.order_Price}</div>
                    <div>${shipment.order_Enddate}</div>
                    <div>
                        <form method="post" action="/mandoo/shipments">
                            <input type="hidden" name="shipmentId" value="${shipment.order_Id}" />
                            <button type="submit" class="btn">출고</button>
                        </form>
                    </div>
                </div>
            </c:forEach>

            <!-- 페이징 영역 -->
            <div class="pagination">
                <c:if test="${currentPage > 1}">
                    <a href="${pageContext.request.contextPath}/shipment?page=${currentPage - 1}">&laquo; 이전</a>
                </c:if>
                
                <c:forEach var="i" begin="1" end="${totalPages}">
                    <c:choose>
                        <c:when test="${i == currentPage}">
                            <a href="#" class="active">${i}</a> <!-- 현재 페이지 -->
                        </c:when>
                        <c:otherwise>
                            <a href="${pageContext.request.contextPath}/shipment?page=${i}">${i}</a>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>

                <c:if test="${currentPage < totalPages}">
                    <a href="${pageContext.request.contextPath}/shipment?page=${currentPage + 1}">다음 &raquo;</a>
                </c:if>
            </div>
        </div>
    </div>

</body>

</html>
