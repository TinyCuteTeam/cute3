<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Mandoo</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/CSS/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/CSS/board-style.css">
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<style>
#content2 {
	margin-top: 20px;
	width: 1100px;
	height: 800px;
	text-align: center;
}

.main-container {
	width: 100%;
	height: 90%;
	/* 자동으로 높이 조정 */
	display: flex;
	justify-content: center;
	/* 중앙 정렬 */
	margin-top: 20px;
}

.chart-grid {
	display: grid;
	grid-template-columns: repeat(3, 1fr);
	grid-template-rows: repeat(2, auto);
	gap: 30px;
	padding: 10px;
	/* 패딩 추가 */
	width: 80%;
	/* 너비를 100%로 설정 */
	height: auto;
	/* 자동으로 높이 조정 */
}

.chart-item {
	text-align: center;
	background-color: #f9f9f9;
	padding: 20px;
	/* 패딩 조정 */
	border-radius: 8px;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
	height: 280px;
	/* 원하는 높이 설정 */
}

/* 차트 내부 텍스트 스타일 */
.chart-text {
	position: absolute;
	margin-left: 120px;
	margin-top: -100px;
	transform: translate(-50%, -50%);
	font-size: 30px;
	/* 텍스트 크기 조정 */
	font-weight: bold;
	color: #333;
}
</style>

<script>
        document.addEventListener("DOMContentLoaded", function () {
            const monthYear = document.getElementById("month-year");
            const daysContainer = document.getElementById("days");
            const prevButton = document.getElementById("prev");
            const nextButton = document.getElementById("next");

            let currentDate = new Date();

            function renderCalendar() {
                const year = currentDate.getFullYear();
                const month = currentDate.getMonth();

                // 현재 날짜 표시
                monthYear.textContent = currentDate.toLocaleString('default', { month: 'long', year: 'numeric' });

                // 날짜 초기화
                daysContainer.innerHTML = '';

                // 해당 월의 첫 번째 날
                const firstDay = new Date(year, month, 1);
                const lastDay = new Date(year, month + 1, 0);
                const totalDays = lastDay.getDate();

                // 첫 주의 빈 칸 추가
                for (let i = 0; i < firstDay.getDay(); i++) {
                    const emptyDiv = document.createElement("div");
                    daysContainer.appendChild(emptyDiv);
                }

                // 날짜 추가
                for (let day = 1; day <= totalDays; day++) {
                    const dayDiv = document.createElement("div");
                    dayDiv.textContent = day;

                    if (day === new Date().getDate() && month === new Date().getMonth() && year === new Date().getFullYear()) {
                        dayDiv.classList.add("today");
                    }

                    daysContainer.appendChild(dayDiv);
                }
            }

            prevButton.addEventListener("click", function () {
                currentDate.setMonth(currentDate.getMonth() - 1);
                renderCalendar();
            });

            nextButton.addEventListener("click", function () {
                currentDate.setMonth(currentDate.getMonth() + 1);
                renderCalendar();
            });

            renderCalendar();


        });

        window.onload = function () {
            loadEventsFromStorage(); // 세션 스토리지에서 일정 불러오기
            displayTodayEvents(); // 오늘의 일정 표시
        }
    </script>

<body>

	<%@ include file="header.jsp"%>

	<!-- 내용페이지  -->
	<div class="content board">
		<h1>
			<a href="/mandoo/boardList">사내게시판</a>
		</h1>
		<table id="posts-table">
			<thead>
				<tr>
					<td>번호</td>
					<td>제목</td>
					<td>날짜</td>
					<td>글쓴이</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="post" items="${posts}" begin="0" end="2">
					<tr>
						<td>${fn:substring(post.bord_Id, 1, fn:length(post.bord_Id))}</td>
						<td><a
							href="${pageContext.request.contextPath}/boardDetail?postId=${post.bord_Id}">${post.board_Title}</a></td>
						<td><fmt:formatDate value="${post.board_Date}"
								pattern="yyyy-MM-dd" /></td>
						<td>${post.user_Name}</td>
					</tr>
				</c:forEach>

			</tbody>
		</table>
	</div>


	<div id="content2">
		<h2>
			<a href="/mandoo/ProductionStatusRead">생산현황</a>
		</h2>
		<div class="main-container">
			<div class="chart-grid">
				<!-- 6개의 라인 차트 출력 -->
				<c:forEach begin="1" end="6" var="lineNo">
					<c:if
						test="${productionLines[lineNo-1] != null && !empty productionLines[lineNo-1].works}">
						<div class="chart-item">
							<div class="progress-label">${lineNo}번라인</div>
							<canvas id="chart-line-${lineNo}" width="150" height="150"></canvas>
							<div class="chart-text" id="percentage-text-${lineNo}">0%</div>
						</div>
					</c:if>
				</c:forEach>
			</div>
		</div>
	</div>


	<div id="content3">
		<div class="calendar-container">
			<div class="calendar-header">
				<button id="prev">◀</button>
				<h2 id="month-year"></h2>
				<button id="next">▶</button>
			</div>
			<div id="calendar">
				<div class="day-names">
					<div>일</div>
					<div>월</div>
					<div>화</div>
					<div>수</div>
					<div>목</div>
					<div>금</div>
					<div>토</div>
				</div>
				<div id="days" class="days"></div>
			</div>
		</div>
	</div>


	<div class="content4">
		<div class="todo-container">
			<h2>
				<a href="/mandoo/todo">TodoList</a>
			</h2>
			<div id="addEventContainer">
				<form id="addEventForm" action="/mandoo/todo" method="post">
					<input type="hidden" id="hiddenDate" name="date" /> <input
						type="text" id="eventTitle" name="title" placeholder="일정제목"
						required />
					<textarea id="eventInput" name="contents" placeholder="내용" required></textarea>
					<button type="submit" id="submitEventButton">추가</button>
				</form>
			</div>
		</div>

		<div class="todo-list">
			<h2>일정 목록</h2>
			<ul id="todo-output">
				<!-- 일정 목록이 여기에 표시됩니다. -->
			</ul>
		</div>
	</div>


	<script
		src="${pageContext.request.contextPath}/WEB-INF/resources//JS/실적마감.js"></script>
	<script
		src="${pageContext.request.contextPath}/WEB-INF/resources//JS/script.js"></script>
	<script
		src="${pageContext.request.contextPath}/WEB-INF/resources//JS/Todo.js"></script>
	<script>
                // 도넛 차트를 생성하는 함수
                function createDoughnutChart(canvasId, completedQty, totalQty, lineNo) {
                    let ctx = document.getElementById(canvasId).getContext('2d');
                    let percentage = (completedQty / totalQty) * 100;

                    // 만약 totalQty가 0이라면 비가동 상태로 처리
                    if (totalQty === 0) {
                        completedQty = 0;
                        totalQty = 1; // 차트를 그리기 위해 1로 설정 (실제로 비가동 상태를 나타냄)
                        percentage = 0;
                    }

                    // 차트 생성
                    new Chart(ctx, {
                        type: 'doughnut',
                        data: {
                            labels: ['생산 완료', '남은 작업'],
                            datasets: [{
                                data: [completedQty, totalQty - completedQty],
                                backgroundColor: ['#007bff', '#e0e0e0'], // 완료와 미완료 색상
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
                            cutout: '70%', // 도넛 차트 구멍 크기
                            rotation: -90, // 시작 각도
                        }
                    });

                    // 중앙에 퍼센트 표시
                    document.getElementById('percentage-text-' + lineNo).innerText = Math.round(percentage) + '%';
                }


                // 6개의 차트 생성
                <c:forEach begin="1" end="6" var="lineNo">
                    <c:if test="${productionLines[lineNo-1] != null && !empty productionLines[lineNo-1].works}">
                        createDoughnutChart('chart-line-${lineNo}', ${productionLines[lineNo - 1].productionCompletedQty}, ${productionLines[lineNo - 1].productionQty}, ${lineNo});
                    </c:if>
                </c:forEach>
            </script>
</body>

</html>