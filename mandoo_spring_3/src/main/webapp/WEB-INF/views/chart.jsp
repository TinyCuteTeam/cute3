<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mandoo</title>
    <link rel="stylesheet"
        href="${pageContext.request.contextPath}/resources/CSS/style.css">
    <link rel="stylesheet"
        href="${pageContext.request.contextPath}/resources/CSS/chartError.css">
</head>

<body>
    <jsp:include page="/WEB-INF/views/header.jsp" />
    <jsp:include page="/WEB-INF/views/sidebar_품질관리.jsp" />

    <div class="defect-content">
        <div class="defect-table-container">
            <h2 class="defect">에러별 불량률</h2>
            <table id="defectReportTable" class="defect-table">
                <thead>
                    <tr>
                        <th>에러 코드</th>
                        <th>불량 수량</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="faulty" items="${list}">
                        <tr>
                            <td>${faulty.error_id}</td>
                            <td>${faulty.faulty_count}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <!-- 페이징을 위한 페이지 네비게이션 -->
        <div class="pagination">
            <c:if test="${currentPage > 1}">
                <a href="/mandoo/error/chart?page=${currentPage - 1}">&laquo; 이전</a>
            </c:if>

            <c:forEach var="i" begin="1" end="${totalPages}">
                <a href="/mandoo/error/chart?page=${i}"
                   class="${i == currentPage ? 'active' : ''}">${i}</a>
            </c:forEach>

            <c:if test="${currentPage < totalPages}">
                <a href="/mandoo/error/chart?page=${currentPage + 1}">다음 &raquo;</a>
            </c:if>
        </div>

        <div id="chart-container">
            <canvas id="bar-chart"></canvas>
        </div>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/4.4.0/chart.umd.min.js"></script>
    <script>
        const ctx = document.getElementById('bar-chart').getContext('2d');

        const labels = [];
        const data = [];

        // JSP에서 데이터 가져오기
        <c:forEach var="faulty" items="${list}">
            labels.push('${faulty.error_id}');
            data.push(${faulty.faulty_count});
        </c:forEach>

        // 막대 그래프 생성
        const chartData = {
            labels: labels, // 에러 코드
            datasets: [{
                label: '불량 수량',
                data: data, // 불량 수량
                backgroundColor: 'rgba(75, 192, 192, 0.6)',
                borderColor: 'rgba(75, 192, 192, 1)',
                borderWidth: 1
            }]
        };

        const options = {
            scales: {
                x: {
                    beginAtZero: true
                },
                y: {
                    beginAtZero: true,
                    ticks: {
                        callback: function(value) {
                            return value + '개'; // Y축에 '개' 단위 붙이기
                        }
                    }
                }
            }
        };

        const myBarChart = new Chart(ctx, {
            type: 'bar',
            data: chartData,
            options: options
        });
    </script>
</body>

</html>
