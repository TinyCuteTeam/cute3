<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="kor">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Mandoo</title>
<link rel="stylesheet"
   href="resources/CSS/style.css">
<link rel="stylesheet"
   href="resources/CSS/client.css">
<style>
/* 모달 스타일 */
.modal {
   display: none;
   position: fixed;
   z-index: 1;
   left: 0;
   top: 0;
   width: 100%;
   height: 100%;
   overflow: auto;
   background-color: rgb(0, 0, 0);
   background-color: rgba(0, 0, 0, 0.4);
   padding-top: 60px;
}

.modal-content {
   background-color: #fefefe;
   margin: 5% auto;
   padding: 20px;
   border: 1px solid #888;
   width: 80%;
   max-width: 500px;
   box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.3); /* 그림자 효과 */
   border-radius: 10px; /* 모서리 둥글게 */
}

#addClientModal input[type="text"] {
   width: 100%;
   padding: 10px;
   margin: 8px 0;
   display: inline-block;
   border: 1px solid #ccc;
   border-radius: 4px;
   box-sizing: border-box;
}

#addClientModal button {
   width: 100%;
   background-color: #e6e6e6;
   padding: 14px 20px;
   margin: 8px 0;
   border: none;
   border-radius: 4px;
   cursor: pointer;
}

#addClientModal button:hover {
   background-color: #0085FF;
   color: white;
}

/* 모달창 닫기 */
.close {
   color: #aaa;
   float: right;
   font-size: 28px;
   font-weight: bold;
}

.close:hover, .close:focus {
   color: black;
   text-decoration: none;
   cursor: pointer;
}

</style>
</head>

<body>

   <jsp:include page="/WEB-INF/views/header.jsp" />
   <!-- 사이드바 -->
   <jsp:include page="/WEB-INF/views/sidebar_기준관리.jsp" />
   <!-- 내용페이지 -->
   <div class="content">
      <div>
         <h1>거래처 관리</h1>

         <div class="srPlus">
            <button type="button" id="openModalBtn" class="plus btnStyle">거래처
               추가</button>
         </div>

         <!-- 거래처정보 카테고리 -->
         <div>
            <div class="flex srTh">
               <div>거래처 코드</div>
               <div>거래처</div>
               <div>대표명</div>
               <div>연락처</div>
               <div>주소</div>
               <div>이메일</div>
               <div>담당자</div>
               <div>사업자등록증</div>
            </div>

            <!-- 거래처 정보 출력 -->
<!--             <form method="post" action="/mandoo/client"> -->
               <c:forEach var="client" items="${list}">
                  <div class="flex round">
                     <div class="srEl">${client.client_Id}</div>
                     <div class="srEl">
                        <blue>${client.client_Name}</blue>
                     </div>
                     <div class="srEl">${client.client_Boss}</div>
                     <div class="srEl">${client.client_Tel}</div>
                     <div class="srEl">${client.client_Address}</div>
                     <div class="srEl">${client.client_Email}</div>
                     <div class="srEl">${client.client_Boss}</div>
                     <div class="srEl">${client.client_Number}</div>
                  </div>
               </c:forEach>


<!--             </form> -->

            <!-- 페이지 네비게이션 -->
<!--             <div class="pagination"> -->
<%--                <c:if test="${currentPage > 1}"> --%>
<%--                   <a href="/mandoo/client?page=${currentPage - 1}">이전</a> --%>
<%--                </c:if> --%>

<%--                <c:forEach var="i" begin="1" end="${totalPages}"> --%>
<%--                   <a href="/mandoo/client?page=${i}" --%>
<%--                      class="${i == currentPage ? 'active' : ''}">${i}</a> --%>
<%--                </c:forEach> --%>

<%--                <c:if test="${currentPage < totalPages}"> --%>
<%--                   <a href="/mandoo/client?page=${currentPage + 1}">다음</a> --%>
<%--                </c:if> --%>
<!--             </div> -->


            <!-- 모달 -->
            <div id="addClientModal" class="modal">
               <div class="modal-content">
                  <span class="close">&times;</span>
                  <h2>거래처 추가</h2>
                  <form method="post" action="insertClient">
                     <input type="hidden" name="action" value="add">
                     <div>
                        거래처 코드: <br>
                        <input type="text" name="client_Id">
                     </div>
                     <div>
                        거래처: <br>
                        <input type="text" name="client_Name">
                     </div>
                     <div>
                        대표명: <br>
                        <input type="text" name="client_Boss">
                     </div>
                     <div>
                        연락처: <br>
                        <input type="text" name="client_Tel">
                     </div>
                     <div>
                        주소: <br>
                        <input type="text" name="client_Address">
                     </div>
                     <div>
                        이메일: <br>
                        <input type="text" name="client_Email">
                     </div>
                     <div>
                        담당자: <br>
                        <input type="text" name="client_Boss">
                     </div>
                     <div>
                        사업자등록증: <br> <input type="text" name="client_Number">
                     </div>
                     <div>
                        <button type="submit">등록</button>
                     </div>
                  </form>
               </div>
            </div>

         </div>
      </div>

      <script>
         // 모달 관련 스크립트
         var modal = document.getElementById("addClientModal");
         var btn = document.getElementById("openModalBtn");
         var span = document.getElementsByClassName("close")[0];

         btn.onclick = function() {
            modal.style.display = "block";
         }

         span.onclick = function() {
            modal.style.display = "none";
         }

         window.onclick = function(event) {
            if (event.target == modal) {
               modal.style.display = "none";
            }
         }
      </script>
</body>

</html>
