<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mandoo</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/불량률파악보고서.css">
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
            <a href="재고현황emp.jsp" class="category-link">재고관리</a>
        </div>

        <div class="category-item">
            <a href="생산현황emp.jsp" class="category-link">공정관리</a>
        </div>

        <div class="category-item">
            <a href="불량률파악보고서emp.jsp" class="category-link title">불량률파악보고서</a>
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
            <li><a href="불량률파악보고서emp.jsp" class="category-link title">불량률파악보고서</a></li>
        </ul>
    </div>

    <!-- 내용페이지 -->
    <div class="content">
        <div class="defect-home">
            <div class="defect-table-container">
                <h2 class="defect">불량률 파악 보고서</h2>
                <table id="defectReportTable" class="defect-table">
                    <thead>
                        <tr>
                            <th>날짜</th>
                            <th>에러코드</th>
                            <th>작업지시번호</th>
                            <th>생산수량</th>
                            <th>불량수량</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- JavaScript를 사용하여 데이터 추가 -->
                    </tbody>
                </table>
            </div>
        </div>
        <script src="${pageContext.request.contextPath}/JS/불량률파악보고서.js"></script>
    </div>

</body>

</html>
