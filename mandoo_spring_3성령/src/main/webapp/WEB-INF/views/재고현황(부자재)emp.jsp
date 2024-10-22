<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="kor">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mandoo</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/재고현황.css">
</head>

<body>

    <!-- 메인 -->
    <div class="category">

        <!-- 메뉴 아이콘 -->
        <div class="menu-icon">
            <img class="menu-icon" src="${pageContext.request.contextPath}/image/menu.png">
        </div>

        <!-- 로고 아이콘 -->
        <div class="category-item">
            <a href="indexemp.jsp" class="category-link">
                <img class="logo-icon" src="${pageContext.request.contextPath}/image/logo.png">
            </a>
        </div>

        <!-- 카테고리 -->
        <div class="category-item">
            <a href="BOMemp.jsp" class="category-link">BOM</a>
        </div>

        <div class="category-item">
            <a href="작업지시서(작업자용)emp.jsp" class="category-link">생산계획</a>
        </div>

        <div class="category-item">
            <a href="재고현황emp.jsp" class="category-link title">재고관리</a>
        </div>

        <div class="category-item">
            <a href="생산현황emp.jsp" class="category-link">공정관리</a>
        </div>

        <div class="category-item">
            <a href="불량률파악보고서emp.jsp" class="category-link">불량률파악보고서</a>
        </div>

        <div class="category-item">
            <a href="마이페이지emp.jsp">
                <img class="mypage-icon" src="${pageContext.request.contextPath}/image/mypage.png">
            </a>
        </div>

    </div>
    
    <!-- 사이드바 -->
    <div class="sidebar">
        <ul id="sidebar-content">
            <li><a href="재고현황emp.jsp" class="category-link">재고현황</a></li>
            <ul>
                <li><a href="재고현황(원자재)emp.jsp" class="category-link">원자재</a></li>
                <li><a href="재고현황(부자재)emp.jsp" class="category-link title">부자재</a></li>
            </ul>
        </ul>
    </div>

    <!-- 내용페이지  -->
    <div class="content">
        <div class="rightnow">
            <h1>재고 현황</h1>
        </div>

        <div class="mtab" style="text-align: center; display: none;">
            <input type="text" id="item-code" placeholder="품목코드">
            <input type="text" id="item-name" placeholder="품목명">
            <input type="text" id="item-image" placeholder="이미지코드">
            <input type="number" id="item-stock" placeholder="재고수량">
            <input type="number" id="item-available" placeholder="가용수량">
            <button id="add-item">등록</button>
        </div>

        <table class="table">
            <thead>
                <tr>
                    <th class="mth">품목코드</th>
                    <th class="mth">품목명</th>
                    <th class="mth">이미지</th>
                    <th class="mth">재고수량</th>
                    <th class="mth">가용수량</th>
                    <th class="mth">재고위치</th>
                </tr>
            </thead>
            <tbody id="product-table-body">
                <!-- JavaScript로 데이터가 추가될 부분 -->
            </tbody>
        </table>

        <div class="pagination">
            <!-- 페이지 버튼이 여기에 추가될 것입니다 -->
        </div>
    </div>

    <script src="${pageContext.request.contextPath}/JS/재고현황(부자재)emp.js"></script>
</body>

</html>
