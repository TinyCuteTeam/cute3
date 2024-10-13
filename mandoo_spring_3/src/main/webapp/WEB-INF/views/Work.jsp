<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="kor">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mandoo</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/Work.css">
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
            background-color: #0077e6;
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
</head>

<body>
    <jsp:include page="/WEB-INF/views/header.jsp" />
    <jsp:include page="/WEB-INF/views/sidebar_생산계획.jsp" />

    <div class="content">

        <div class="search-container">
            <form action="/mandoo/Work" method="get">
                <input type="text" id="search-input" name="search" placeholder="검색어를 입력하세요...">
                <button type="submit" id="search-button">검색</button>
                <button id="reset-button" onclick="window.location.href='/mandoo/Work'">취소</button>
            </form>
        </div>

        <div class="wrap">
            <div class="action-buttons">
                <button id="add-button">등록</button>
            </div>
        </div>

        <div class="main">
            <div class="flex mfont srTh">
                <div><strong>작업지시NO.</strong></div>
                <div><strong>작성일자</strong></div>
                <div><strong>납기일자</strong></div>
                <div><strong>품목명</strong></div>
                <div><strong>품목코드</strong></div>
                <div><strong>수량</strong></div>
                <div><strong>작성자</strong></div>
                <div><strong>진행상태</strong></div>
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
                        <div>
                            <c:if test="${work.work_do == '작업 대기'}">
                                <button class="start-button" data-work-id="${work.work_id}">작업시작</button>
                            </c:if>
                        </div>
                    </div>
                </c:forEach>
            </div>

            <!-- 페이지 네비게이션 -->
            <div class="pagination">
                <c:if test="${currentPage > 1}">
                    <a href="/mandoo/Work?page=${currentPage - 1}">이전</a>
                </c:if>

                <c:forEach var="i" begin="1" end="${totalPages}">
                    <a href="/mandoo/Work?page=${i}" class="${i == currentPage ? 'active' : ''}">${i}</a>
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
                        
                        <label for="item_code">품목코드:</label><br>
                        <input type="text" id="item_code" name="item_code" placeholder="품목코드" required><br>

                        <label for="production_qty">수량:</label><br>
                        <input type="number" id="production_qty" name="production_qty" placeholder="수량" required><br>

                        <input type="submit" value="저장">
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script>
        // 모달 열기
        document.getElementById("add-button").onclick = function() {
            document.getElementById("popup").style.display = "block";
        }

        // 모달 닫기
        document.getElementById("close-popup").onclick = function() {
            document.getElementById("popup").style.display = "none";
        }

        // 모달 외부 클릭 시 닫기
        window.onclick = function(event) {
            const modal = document.getElementById("popup");
            if (event.target === modal) {
                modal.style.display = "none";
            }
        }
    </script>
</body>
</html>
