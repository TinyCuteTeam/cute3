<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="kor">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Mandoo</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/CSS/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/CSS/Work.css">
<style>
/* 모달 배경 */
.popup {
	display: none; /* 기본적으로 숨김 */
	position: fixed;
	z-index: 1;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgb(0, 0, 0);
	background-color: rgba(0, 0, 0, 0.4); /* 배경을 반투명하게 */
	padding-top: 60px;
}

/* 모달 콘텐츠 */
.popup-content {
	background-color: #fefefe;
	margin: 5% auto;
	padding: 20px;
	border: 1px solid #888;
	width: 80%;
	height: 750px;
	max-width: 500px;
	box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.3); /* 그림자 효과 */
	border-radius: 10px; /* 모서리 둥글게 */
}

/* 입력 필드 스타일 */
#popup input[type="text"], #popup input[type="date"], #popup textarea,
	#popup input[type="number"], #popup select {
	width: 100%;
	padding: 10px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

/* 저장 버튼 스타일 */
#popup button {
	width: 100%;
	background-color: #0085FF;
	color: white;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

#popup button:hover {
	background-color: #0085FF;
}

/* 모달 닫기 버튼 */
.close-popup {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close-popup:hover, .close-popup:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}
</style>

</style>

</head>

<body>
	<jsp:include page="/WEB-INF/views/header.jsp" />
	<!-- 사이드바 -->
	<jsp:include page="/WEB-INF/views/sidebar_생산계획.jsp" />

	<div class="content">

		<div class="search-container">
			<input type="text" id="search-input" placeholder="검색어를 입력하세요...">
			<button id="search-button">검색</button>
			<button id="reset-button">취소</button>
		</div>
		<div class="wrap">
			<div class="action-buttons">
				<button id="add-button">등록</button>
<!-- 				<button id="delete-button">삭제</button> -->
			</div>
		</div>

		<div class="main">
			<div class="flex mfont srTh">
				<div>
					<strong>작업지시NO.</strong>
				</div>
				<div>
					<strong>작성일자</strong>
				</div>
				<div>
					<strong>납기일자</strong>
				</div>
				<div>
					<strong>품목명</strong>
				</div>
				<div>
					<strong>품목코드</strong>
				</div>
				<div>
					<strong>수량</strong>
				</div>
				<div>
					<strong>작성자</strong>
				</div>
				<div>
					<strong>진행상태</strong>
				</div>
			</div>

			<div class="m_llist">
				<c:forEach var="work" items="${list}">
					<div class="flex round page-item">
						<div>${work.work_id}</div>
						<div><fmt:formatDate value="${work.work_write}" pattern="yyyy-MM-dd" /></div>
						<div><fmt:formatDate value="${work.work_endate}" pattern="yyyy-MM-dd" /></div>
						<div>${work.work_name}</div>
						<div class="over" title="${work.item_code}">${work.item_code}</div>
						<div>${work.production_qty}</div>
						<div>${work.user_id}</div>
<!-- 						<div> -->
<%-- 							<color class="green">${work.work_do}</color> --%>
<!-- 						</div> -->
						<div>
							<!-- 작업 대기 상태에서만 작업 시작 버튼을 표시 -->
							<c:if test="${work.work_do == '작업 대기'}">
								<button class="start-button" data-work-id="${work.work_id}">작업시작</button>
							</c:if>
						</div>
					</div>
				</c:forEach>
			</div>

			<!-- 라인 선택 모달 -->
			<div id="lineModal" class="popup">
			    <div class="popup-content">
			        <span id="close-line-popup" class="close-popup">&times;</span>
			        <h2>라인 번호 선택</h2>
			        <form id="line-form" method="post" action="/mandoo/Work">
			            <input type="hidden" name="action" value="start">
			            <input type="hidden" id="selectedwork_id" name="work_id">
			            
			            <label for="lineNo">라인 번호 선택:</label>
			            <select id="lineNo" name="lineNo" required>
			                <option value="1">1번 라인</option>
			                <option value="2">2번 라인</option>
			                <option value="3">3번 라인</option>
			                <option value="4">4번 라인</option>
			                <option value="5">5번 라인</option>
			                <option value="6">6번 라인</option>
			            </select>
			
			            <button type="submit">작업 시작</button>
			        </form>
			    </div>
			</div>

		<!-- 페이지 네비게이션 -->
		<div class="pagination">
			<c:if test="${currentPage > 1}">
				<a href="/mandoo/Work?page=${currentPage - 1}">이전</a>
			</c:if>

			<c:forEach var="i" begin="1" end="${totalPages}">
				<a href="/mandoo/Work?page=${i}"
					class="${i == currentPage ? 'active' : ''}">${i}</a>
			</c:forEach>

			<c:if test="${currentPage < totalPages}">
				<a href="/mandoo/Work?page=${currentPage + 1}">다음</a>
			</c:if>
		</div>

		<!-- 작업지시서 등록 모달 -->
		<div id="popup" class="popup">
		    <div class="popup-content">
		        <span id="close-popup" class="close-popup">&times;</span>
		        <h2>작업지시서 등록</h2>
		        <form id="registration-form" method="post" action="insertWork">
		            <input type="hidden" name="action" value="add">
		
		            <label for="work_id">작업지시 NO:</label><br>
		            <input type="text" id="work_id" name="work_id" placeholder="작업지시 NO" required><br>
		
		            <label for="work_write">작성일자:</label><br>
		            <input type="date" id="work_write" name="work_write" required><br>
		
		            <label for="work_endate">납기일자:</label><br>
		            <input type="date" id="work_endate" name="work_endate" required><br>
		
		            <label for="work_name">품목명:</label><br>
		            <input type="text" id="work_name" name="work_name" placeholder="품목명" required><br>
		            
		            <label for="itemCode">품목 코드:</label><br>
		            <input type="text" id="item_code" name="item_code" placeholder="품목 코드" required><br>
		            
		            <label for="production_qty">작업해야 할 수량:</label><br>
		            <input type="number" id="production_qty" name="production_qty" placeholder="작업 수량" required><br>
		            
		            <label for="user_id">작성자:</label><br>
		            <input type="text" id="user_id" name="user_id" placeholder="작성자" required><br>
		
		
		            <label for="work_do">진행상태:</label><br>
		            <select id="work_do" name="work_do" required>
		                <option value="작업 대기">작업 대기</option>
		                <option value="작업 중">작업 중</option>
		            </select><br>
		
		            <button type="submit" class="madd">등록</button>
		        </form>
		    </div>
		</div>

		<script>
         document.getElementById('add-button').addEventListener('click', function() {
            document.getElementById('popup').style.display = 'block';
         });

         document.getElementById('close-popup').addEventListener('click', function() {
            document.getElementById('popup').style.display = 'none';
         });
         
         document.querySelectorAll('.start-button').forEach(button => {
            button.addEventListener('click', function () {
               const workId = this.getAttribute('data-work-id');
               document.getElementById('selectedWorkId').value = workId;
               document.getElementById('lineModal').style.display = 'block';
            });
         });

         document.getElementById('close-line-popup').addEventListener('click', function () {
            document.getElementById('lineModal').style.display = 'none';
         });
         
         document.getElementById('search-button').addEventListener('click', function() {
        	    const searchQuery = document.getElementById('search-input').value.toLowerCase();
        	    const planItems = document.querySelectorAll('.m_llist .flex.round');

        	    planItems.forEach(function(row) {
        	        const text = row.textContent.toLowerCase();
        	        if (text.includes(searchQuery)) {
        	            row.style.display = 'flex';
        	        } else {
        	            row.style.display = 'none';
        	        }
        	    });
        	});

        	document.getElementById('reset-button').addEventListener('click', function() {
        	    document.getElementById('search-input').value = '';
        	    const planItems = document.querySelectorAll('.m_llist .flex.round');
        	    planItems.forEach(function(row) {
        	        row.style.display = 'flex';
        	    });
        	});
      </script>
	</div>
</body>

</html>
