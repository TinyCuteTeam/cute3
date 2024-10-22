<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="kor">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mandoo</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/실적마감.css">
    <style>
        .content-display {
            display: flex;
            justify-content: space-between;
        }

        .table-container {
            width: 45%;
        }

        .chart-container {
            width: 50%;
        }

        .production-table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
            font-size: 18px;
            text-align: left;
        }

        .production-table th, .production-table td {
            padding: 12px 15px;
            border: 1px solid #ddd;
        }

        .production-table thead tr {
            background-color: #007bff;
            color: #ffffff;
            text-align: left;
            font-weight: bold;
        }

        .production-table tbody tr:nth-of-type(even) {
            background-color: #f3f3f3;
        }

        .chart-container {
            width: 45%;
            height: 500px;
            position: relative;
        }

        #line-chart {
            width: 100% !important;
            height: 100% !important;
        }
    </style>
</head>
<body>
    <jsp:include page="/WEB-INF/views/header.jsp" />
    <jsp:include page="/WEB-INF/views/sidebar_실적및출하.jsp" />
    <div class="content">
        <h1 id="head_title">월별 생산량</h1>
        <div class="content-display">
            <div class="table-container">
                <table class="production-table">
                    <thead>
                        <tr>
                            <th>월</th>
                            <th>생산량</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="order" items="${monthlyProductionData}">
                            <tr>
                                <td>${order.orderMonth}</td>
                                <td>${order.productionQty}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="chart-container">
                <canvas id="line-chart"></canvas>
            </div>
        </div>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/4.4.0/chart.umd.min.js"></script>
    <script>
        const canvas = document.getElementById('line-chart');
        const ctx = canvas.getContext('2d');
        const labels = [];
        const data = [];

        <c:forEach var="order" items="${monthlyProductionData}">
            labels.push('${order.orderMonth}');
            data.push(${order.productionQty});
        </c:forEach>;

        const chartData = {
            labels: labels,
            datasets: [{
                label: '월별 생산량',
                data: data,
                borderColor: '#007bff',
                borderWidth: 2,
                fill: false,
                tension: 0.1
            }]
        };

        const myChart = new Chart(ctx, {
            type: 'line',
            data: chartData,
            options: {
                responsive: true,
                maintainAspectRatio: false,
                scales: {
                    y: { beginAtZero: true },
                    x: { type: 'category' }
                }
            }
        });
    </script>
</body>
</html>
