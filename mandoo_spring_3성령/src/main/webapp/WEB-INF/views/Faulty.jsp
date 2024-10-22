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
	<jsp:include page="/WEB-INF/views/sidebar_품질관리.jsp" />

	<div class="defect-content">
		<div class="defect-table-container">
			<h2 class="defect">월별 불량률</h2>
			<table id="defectReportTable" class="defect-table">
				<thead>
					<tr>
						<th>월</th>
						<th>불량률</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="faulty" items="${list}">
						<tr>
							<td>${faulty.month}</td>
							<td>${faulty.defect_rate}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div id="chart-container">
			<canvas id="line-chart"></canvas>
		</div>
	</div>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/4.4.0/chart.umd.min.js"></script>
	<script>
		const canvas = document.getElementById('line-chart');
        const ctx = canvas.getContext('2d');

        // 캔버스의 CSS 크기 설정
        canvas.style.width = '100%';
        canvas.style.height = '300px'; // 원하는 높이 설정

        // 캔버스의 실제 해상도 설정
        const resizeCanvas = () => {
            // CSS에서 설정된 크기를 가져온다
            const width = canvas.clientWidth;
            const height = canvas.clientHeight;

            // 실제 캔버스의 크기를 설정한다
            canvas.width = width * window.devicePixelRatio;
            canvas.height = height * window.devicePixelRatio;

            // 캔버스의 스타일 크기를 설정한다
            canvas.style.width = width + 'px';
            canvas.style.height = height + 'px';

            // 차트의 해상도를 유지하기 위해 컨텍스트의 스케일을 조정한다
            ctx.scale(window.devicePixelRatio, window.devicePixelRatio);
        };

        // 창 크기 변경 시 캔버스 크기 조정
        window.addEventListener('resize', resizeCanvas);

        // 초기 캔버스 크기 조정
        resizeCanvas();

        const labels = [];
        const data = [];

        <c:forEach var="faulty" items="${list}">
            labels.push('${faulty.month}');
            data.push(${faulty.defect_rate});
        </c:forEach>

        const chartData = {
            labels: labels,
            datasets: [{
                label: '월별 불량률',
                data: data,
                borderColor: 'rgba(255, 0, 0, 1)',
                borderWidth: 1,
                fill: false
            }]
        };

        const myChart = new Chart(ctx, {
            type: 'line',
            data: chartData,
            options: {
                responsive: true,
                maintainAspectRatio: false,
                scales: {
                    x: {
                        beginAtZero: true
                    },
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });
	</script>
</body>

</html>
