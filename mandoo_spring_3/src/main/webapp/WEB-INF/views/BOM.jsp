<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mandoo</title>
    <link rel="stylesheet" href="resources/CSS/style.css">
    <link rel="stylesheet" href="resources/CSS/BOM.css">
</head>
<body>

<jsp:include page="/WEB-INF/views/header.jsp" />
<jsp:include page="/WEB-INF/views/sidebar_기준관리.jsp" />

<div class="content">
    <h1>BOM 레시피 관리</h1>

    <!-- 제품 레시피 선택 -->
    <div class="srPlus">
        <form method="get" action="bom">
            <select id="recipeSelect" name="bom_Id" onchange="this.form.submit()">
                <option value="A00001" <c:if test="${param.bom_Id == 'A00001'}">selected</c:if>>A0001</option>
                <option value="A00002" <c:if test="${param.bom_Id == 'A00002'}">selected</c:if>>A0002</option>
            </select>
            <a href="/mandoo/BOMAdd">
                <button type="button" class="mho plus" id="addNewBomBtn">BOM 추가</button>
            </a>
            <button type="button" class="mho plus" id="addRowBtn">행 추가</button>
        </form>
    </div>

    <!-- 선택한 BOM ID에 대한 상세 정보 표시 테이블 -->
    <form id="bomForm" action="BOM" method="post">
        <input type="hidden" name="action" id="actionType"> 
        <input type="hidden" name="bom_Id" id="bomId" value="${param.bom_Id}">
        <table id="table" class="sr_bom" border="solid black 1px;">
            <tr>
                <th class="srTh thwidth">품목코드</th>
                <th class="srTh">품목명</th>
                <th class="srTh thwidth">수량</th>
                <th class="srTh thwidth">단위</th>
                <th class="srTh thwidth">수정</th>
                <th class="srTh thwidth">삭제</th>
            </tr>
            <c:forEach var="bom" items="${list}">
                <tr>
                    <td>${bom.item_Code}</td>
                    <td>${bom.item_Name}</td>
                    <td>${bom.bom_Count}</td>
                    <td>${bom.bom_Unit}</td>
                    <td>
                        <button type="button" class="editBtn" data-bomid="${bom.bom_Id}" 
                                data-itemcode="${bom.item_Code}" data-itemname="${bom.item_Name}"
                                data-bomcount="${bom.bom_Count}" data-bomunit="${bom.bom_Unit}">수정</button>
                    </td>
                    <td>
                        <button class="editBtn" type="submit" name="action" value="delete">삭제</button>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </form>

    <!-- 페이지 번호 표시 -->
    <div>
        <c:forEach begin="1" end="${totalPages}" var="pageNum">
            <a href="bom?page=${pageNum}&bom_Id=${bom_Id}" 
               style="${currentPage == pageNum ? 'font-weight:bold' : ''}">
                ${pageNum}
            </a>
        </c:forEach>
    </div>

</div>

<script src="resources/JS/BOM.js"></script>
</body>
</html>
