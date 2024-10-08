<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="kr.co.mandoo.dto.UserDTO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<style>
body {
   margin: 0;
   padding: 0;
   overflow: hidden;
}  

span {
   font-size: 15px;
}
</style>

<body>
   <div class="category">
      <div class="menu-icon">
         <img class="menu-icon"
            src="resources/image/menu.png">
      </div>

      <div class="category-item logo-item">
         <a href="/mandoo/index" class="category-link"> <img
            class="logo-icon"
            src="resources/image/logo.png">
         </a>
      </div>

      <c:choose>
         <c:when test="${sessionScope.user_access == 1}">
            <div class="category-item">
               <a href="/mandoo/Item" class="category-link">기준관리</a>
               <div class="_category">
                  <a href="/mandoo/Item" class="category-link">품목 코드 조회</a><br>
                  <a href="/mandoo/BOM?bomId=A00001" class="category-link">BOM(레시피관리)</a><br>
                  <a href="/mandoo/client" class="category-link">거래처 관리</a><br>
                  <a href="/mandoo/Error" class="category-link">에러코드</a><br>
               </div>
            </div>

            <div class="category-item">
               <a href="/mandoo/OrderInfo" class="category-link">생산계획</a>
               <div class="_category">
                  <a href="/mandoo/OrderInfo" class="category-link">발주확인</a><br>
                  <a href="/mandoo/ProductPlan" class="category-link">생산계획</a><br>
                  <a href="/mandoo/Work" class="category-link">작업지시서 확인</a><br>
               </div>
            </div>

            <div class="category-item">
               <a href="/mandoo/StockInventory" class="category-link">재고관리</a>
               <div class="_category">
                  <a href="/mandoo/StockInventory" class="category-link">재고현황</a>
               </div>
            </div>

            <div class="category-item">
               <a href="/mandoo/ProductionStatusRead" class="category-link">공정관리</a>
               <div class="_category">
                  <a href="/mandoo/ProductionStatusRead" class="category-link">생산현황</a>
               </div>
            </div>

            <div class="category-item">
               <a href="/mandoo/FaultyRead" class="category-link">품질관리</a>
               <div class="_category">
                  <a href="/mandoo/FaultyRead" class="category-link">불량률파악보고서</a><br>
               </div>
            </div>

            <div class="category-item">
               <a href="/mandoo/productionOrder/monthly" class="category-link">실적
                  및 출하</a>
               <div class="_category">
                  <a href="/mandoo/productionOrder/monthly" class="category-link">실적마감</a><br>
                  <a href="/mandoo/shipment" class="category-link">출하확인</a><br>
               </div>
            </div>

            <div class="category-item">
               <a href="/mandoo/mypage"> <img class="mypage-icon"
                  src="resources/image/mypage.png">
               </a>
               <div class="_category">
                  <a href="/mandoo/mypage" class="category-link">마이페이지</a><br>
                  <a href="/mandoo/account" class="category-link">계정관리</a><br>
                  <a href="/mandoo/boardList" class="category-link">사내게시판</a><br>
                  <a href="/mandoo/todo" class="category-link">일정관리</a><br>
               </div>
            </div>

         </c:when>

         <c:otherwise>
            <div class="category-item">
               <a href="/mandoo/Work" class="category-link">작업지시서 확인</a>
            </div>

            <div class="category-item">
               <a href="/mandoo/StockInventory" class="category-link">재고관리</a>
            </div>

            <div class="category-item">
               <a href="/mandoo/ProductionStatusRead" class="category-link">생산현황</a>
            </div>

            <div class="category-item">
               <a href="/mandoo/FaultyRead" class="category-link">불량률파악보고서</a>
            </div>

            <div class="category-item">
               <a href="/mandoo/boardList" class="category-link">사내게시판</a>
            </div>

            <div class="category-item">
               <a href="/mandoo/mypage" class="category-link">마이페이지</a>
            </div>
            <div class="category-item">
               <a href="/mandoo/todo" class="category-link">일정관리</a>
            </div>
         </c:otherwise>
      </c:choose>

      <div class="category-item user-info">
         <c:choose>
            <c:when test="${sessionScope.user_access == 1}">
               <span class="user-role">관리자</span>
            </c:when>
            <c:when test="${sessionScope.user_access == 2}">
               <span class="user-role">작업자</span>
            </c:when>
            <c:otherwise>
               <span class="user-role">손님</span>
            </c:otherwise>
         </c:choose>
<%--          <span>|</span> <span class="user-name"><%=((UserDTO) session.getAttribute("user")).getUserName()%>님</span> --%>
      </div>

   </div>
</body>