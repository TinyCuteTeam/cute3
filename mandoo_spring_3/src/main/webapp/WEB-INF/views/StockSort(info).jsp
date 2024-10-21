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
        href="${pageContext.request.contextPath}/resources/CSS/불량률파악보고서.css">
</head>

<body>
    <jsp:include page="/WEB-INF/views/header.jsp" />
    <jsp:include page="/WEB-INF/views/sidebar_stockmanage.jsp" />

    <div class="defect-content">
        <div class="defect-table-container">
            <h2 class="defect">세부 재고현황</h2>
            <table id="defectReportTable" class="defect-table">
                <thead>
                    <tr>
                        <th>품목 번호</th>
                        <th>거래처</th>
                        <th>거래 날짜</th>
                        <th>발주 수량</th>
                        <th>품목 이름</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="orderinfo" items="${list}">
                        <tr>
                            <td>${orderinfo.order_num}</td>
                            <td>${orderinfo.order_supply}</td>
                            <td>${orderinfo.order_time}</td>
                            <td>${orderinfo.order_count}</td>
                            <td>${orderinfo.order_name}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <div id="chart-container">
            <canvas id="line-chart"></canvas>
        </div>
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/4.4.0/chart.umd.min.js"></script>
    <script>
        const canvas = document.getElementById('line-chart');
        const ctx = canvas.getContext('2d');

        // 캔버스의 CSS 크기 설정
        canvas.style.width = '100%';
        canvas.style.height = '300px'; // 원하는 높이 설정

        // 캔버스의 실제 해상도 설정
        const resizeCanvas = () => {
            const width = canvas.clientWidth;
            const height = canvas.clientHeight;

            canvas.width = width * window.devicePixelRatio;
            canvas.height = height * window.devicePixelRatio;

            canvas.style.width = width + 'px';
            canvas.style.height = height + 'px';

            ctx.scale(window.devicePixelRatio, window.devicePixelRatio);
        };

        window.addEventListener('resize', resizeCanvas);
        resizeCanvas();

        const labels = [];
        const data = [];

        <c:forEach var="orderinfo" items="${list}">
            labels.push('${orderinfo.order_time}');
            data.push(${orderinfo.order_count});
        </c:forEach>

        // 데이터의 최대값을 기준으로 Y축 최대값 설정
        const maxDataValue = Math.max(...data);
        const yMax = Math.ceil(maxDataValue * 1.5); // 50% 여유 추가

        const chartData = {
            labels: labels,
            datasets: [{
                label: '월별 재고 발주량',
                data: data,
                backgroundColor: 'rgba(255, 165, 0, 0.6)', // 연한 오렌지 색
                borderColor: 'rgba(255, 165, 0, 1)', // 오렌지 색
                borderWidth: 1,
                barThickness: 32, // 막대 그래프 두께를 두 배로 조정
                maxBarThickness: 40 // 최대 막대 두께 설정
            }]
        };

        const myChart = new Chart(ctx, {
            type: 'bar', // 막대 그래프 타입으로 설정
            data: chartData,
            options: {
                responsive: true,
                maintainAspectRatio: false,
                scales: {
                    x: {
                        beginAtZero: true,
                        grid: {
                            display: false // X축 그리드 라인 비활성화
                        }
                    },
                    y: {
                        beginAtZero: true,
                        max: yMax, // Y축 최대값 설정
                        ticks: {
                            stepSize: Math.ceil(yMax / 5) // Y축 눈금 간격 설정
                        }
                    }
                }
            }
        });
    </script>
</body>

</html>
