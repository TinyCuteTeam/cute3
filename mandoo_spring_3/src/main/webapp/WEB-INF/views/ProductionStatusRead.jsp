<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mandoo</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/ProductionStatus.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        /* 메인 컨테이너 - 차트와 작업지시서 영역을 나누기 위한 컨테이너 */
        .main-container {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }

        /* 차트 영역을 3x2 그리드로 구성 */
        .chart-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr); /* 3열 그리드 */
            grid-template-rows: repeat(2, auto); /* 2행 */
            gap: 20px; /* 차트 간의 간격 */
            flex: 1; /* 차트 영역 비율 */
        }

        /* 개별 차트 아이템 스타일 */
        .chart-item {
            text-align: center;
            background-color: #f9f9f9;
            padding: 10px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            position: relative;
        }

        /* 차트 내부 텍스트 스타일 */
        .chart-text {
            position: absolute;
            top: 44%; /* 중앙보다 조금 위로 조정 */
            left: 50%;
            transform: translate(-50%, -50%);
            font-size: 20px; /* 텍스트 크기 조정 */
            font-weight: bold;
            color: #333;
        }

        /* 작업 지시서 목록을 위한 섹션 */
        .work-section {
            flex: 1; /* 작업지시서 영역 비율 */
            margin-left: 20px;
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        /* 차트 섹션의 라벨 스타일 */
        .progress-label {
            font-weight: bold;
            font-size: 18px;
            margin-bottom: 10px;
        }
    </style>
</head>

<body>
    <jsp:include page="/WEB-INF/views/header.jsp" />
    <!-- 사이드바 -->
    <div class="sidebar">
        <ul id="sidebar-content">
            <li><a href="ProductionStatusRead" class="category-link">생산현황</a></li>
        </ul>
    </div>

    <!-- 내용페이지  -->
    <div class="content">
        <div class="main-container">
            <!-- 왼쪽 차트 영역 -->
            <div class="chart-grid">
                <!-- 6개의 라인 차트 출력 -->
                <c:forEach var="status" items="${list}">
                    <c:if test="${status != null && !empty status.work_do}">
                        <div class="chart-item">
                            <div class="progress-label">${status.line_no}번라인</div>
                            <canvas id="chart-line-${status.line_no}" width="150" height="150"></canvas>
                            <div class="chart-text" id="percentage-text-${status.line_no}">%</div>
                        </div>
                    </c:if>
                </c:forEach>
            </div>

            <!-- 오른쪽 작업 지시서 목록 -->
            <div class="work-section">
                <c:forEach var="status" items="${list}">
                    <div class="work-item flex round">
                        <div>${status.line_no}번라인작업</div> <!-- 라인 번호 -->
                        <div>
                            <a target="_blank" class="mho"
                               href="${pageContext.request.contextPath}/HTML/작업지시서.jsp?workId=${status.work_id}">
                                ${status.work_id} <!-- 작업 ID -->
                            </a>
                        </div>
                        <div>${status.work_write}</div> <!-- 작성일자 -->
                        <div>${status.work_endate}</div> <!-- 납기일자 -->
                        <div class="over" title="${status.item_code}">${status.item_code}</div> <!-- 품목 코드 -->
                        <div>${status.work_name}</div> <!-- 작업 명 -->
                        <div>${status.user_id}</div> <!-- 작성자 ID -->
                        <div>
                            <color class="green">${status.work_do}</color> <!-- 진행 상태 -->
                        </div>
                    </div>
                </c:forEach>
            </div>

            <script>
                // 도넛 차트를 생성하는 함수
                function createDoughnutChart(canvasId, completedQty, totalQty, line_no) {
                    let ctx = document.getElementById(canvasId).getContext('2d');
                    let percentage = (completedQty / totalQty) * 100;

                    if (totalQty === 0) {
                        completedQty = 0;
                        totalQty = 1;
                        percentage = 0;
                    }

                    new Chart(ctx, {
                        type: 'doughnut',
                        data: {
                            labels: ['생산 완료', '남은 작업'],
                            datasets: [{
                                data: [completedQty, totalQty - completedQty],
                                backgroundColor: ['#007bff', '#e0e0e0'],
                                borderColor: ['#007bff', '#e0e0e0'],
                                borderWidth: 1
                            }]
                        },
                        options: {
                            responsive: true,
                            plugins: {
                                tooltip: {
                                    callbacks: {
                                        label: function (tooltipItem) {
                                            return tooltipItem.label + ': ' + tooltipItem.raw + '개 (' + Math.round(percentage) + '%)';
                                        }
                                    }
                                }
                            },
                            cutout: '70%',
                            rotation: -90,
                        }
                    });

                    document.getElementById('percentage-text-' + line_no).innerText = Math.round(percentage) + '%';
                }

                // 6개의 차트 생성
                <c:forEach var="status" items="${list}">
                    <c:if test="${status != null && !empty status.work_do}">
                        createDoughnutChart('chart-line-${status.line_no}', ${status.production_Completed_Qty}, ${status.production_qty}, ${status.line_no});
                    </c:if>
                </c:forEach>
            </script>
        </div>
    </div>
</body>

</html>
