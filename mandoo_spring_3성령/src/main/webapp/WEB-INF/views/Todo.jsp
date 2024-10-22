<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="kor">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Mandoo</title>
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/CSS/style.css">
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/CSS/Todo.css">

</head>

<body>
   <!-- 메인 -->
   <jsp:include page="/WEB-INF/views/header.jsp" />
   <!-- 사이드바 -->
   <jsp:include page="/WEB-INF/views/sidebar_마이페이지.jsp" />
   <!-- 내용페이지  -->
   <div class="content">
      <h1>캘린더 일정 관리</h1>
      <div class="todo-select">
         <select id="yearSelect"></select> <select id="monthSelect"></select>
         <button id="generateCalendarButton">캘린더 생성</button>
      </div>
      <div class="scroll">
         <div id="calendar"></div>
      </div>

      <!-- 일정 목록 및 추가 모달 -->
      <div id="modal" class="modal">
         <div class="modal-content">
            <div>
               <button id="backButton" style="display: none;">
                  <img src="${pageContext.request.contextPath}/resources/image/back.png">
               </button>
               <span class="close" onclick="closeModal()"><img
                  src="${pageContext.request.contextPath}/resources/image/close.png"></span>
            </div>
            <h2 id="modalTitle">TodoList</h2>
            <div id="modalDate"></div>

            <!-- 스크롤 가능한 영역 -->
            <div id="eventListContainer">
               <div id="eventList"></div>
               <!-- 일정 목록 표시 -->
            </div>

            <div id="addEventContainer" style="display: none;">
               <form id="addEventForm" action="/mandoo/todo" method="post">
                  <input type="hidden" id="hiddenDate" name="date" /> <input
                     type="text" id="eventTitle" name="title" placeholder="일정제목"
                     required />
                  <textarea id="eventInput" name="contents" placeholder="내용"
                     required></textarea>
                  <button type="submit" id="submitEventButton">추가</button>
               </form>
            </div>

            <button id="addEventButton" onclick="showAddEventContainer()">
               <img src="${pageContext.request.contextPath}/resources/image/write.png"
                  class="write1"> <img
                  src="${pageContext.request.contextPath}/resources/image/write2.png"
                  style="display: none;" class="write2">
            </button>

            <div id="eventDetail" style="display: none;">
               <!-- 상세 정보 표시 영역 -->
               <div id="detailsTitle" class="edit-event"></div>
               <button id="editEventButton" class="edit-event"
                  onclick="editEvent()">
                  <img src="${pageContext.request.contextPath}/resources/image/edit.png"
                     class="edit1"> <img
                     src="${pageContext.request.contextPath}/resources/image/edit2.png"
                     style="display: none;" class="edit2">
               </button>
               <!-- 수정 버튼 -->
               <div id="detailsText" class="details-text"></div>
               <!-- 상세 내용 표시 -->
            </div>
         </div>
      </div>
   </div>
   <script src="${pageContext.request.contextPath}/resources/JS/Todo.js"></script>
</body>

</html>
