<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Mandoo</title>
<link rel="stylesheet"
   href="resources/CSS/style.css">
<link rel="stylesheet"
   href="resources/CSS/BOM.css">

<style>
#bomForm {
   position : relative;
    left: 200px;
}

/* 모달 배경 스타일 */
.modal {
   display: none;
   position: fixed;
   z-index: 1000;
   left: 0;
   top: 0;
   width: 100%;
   height: 100%;
   overflow: auto;
   background-color: rgba(0, 0, 0, 0.4);
}

/* 모달 콘텐츠 스타일 */
.modal-content {
   background-color: #fefefe;
   margin: 15% auto;
   padding: 20px;
   border: 1px solid #888;
   width: 80%;
   max-width: 500px;
   border-radius: 8px;
   box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
}

/* 모달 닫기 버튼 스타일 */
.close {
   color: #aaa;
   float: right;
   font-size: 28px;
   font-weight: bold;
   margin-right: -15px;
   margin-top: -15px;
}

.close:hover, .close:focus {
   color: black;
   text-decoration: none;
   cursor: pointer;
}

/* 모달 폼 입력 스타일 */
#bomForm input[type="text"], #bomForm input[type="number"], #bomForm select
   {
   width: 100%;
   padding: 8px;
   margin: 10px 0;
   border: 1px solid #ccc;
   border-radius: 4px;
   box-sizing: border-box;
}

/* 모달 저장 버튼 스타일 */
#saveButton {
   width: 100%;
   background-color: #e6e6e6;
   padding: 10px 20px;
   border: none;
   border-radius: 4px;
   cursor: pointer;
}

#saveButton:hover {
   background-color: #0085FF;
   color: white;
}
</style>
</head>

<body>

   <!-- 메인 -->
   <jsp:include page="/WEB-INF/views/header.jsp" />
   <!-- 사이드바 -->
   <jsp:include page="/WEB-INF/views/sidebar_기준관리.jsp" />
   <!-- 내용페이지 -->
   <div class="content">
      <h1>BOM 레시피 관리</h1>

      <!-- 제품 레시피 선택 -->
      <div class="srPlus">
         <form method="get" action="bom"> 
            <select id="recipeSelect" name="bom_Id" onchange="this.form.submit()">
            	<option value="A00001" <c:if test="${param.bom_Id == 'A00001'}">selected</c:if>>A0001</option>
            	<option value="A00002" <c:if test="${param.bom_Id == 'A00002'}">selected</c:if>>A0002</option>
			</select>
            
<%--                <c:forEach var="bomSelect" items="${list}"> --%>
<%--                   <option value="${bomSelect.bom_Id}" --%>
<%--                      ${param.bom_Id == bomSelect.bom_Id || (empty param.bom_Id && bomSelect.bom_Id == 'A0001') ? 'selected' : ''}> --%>
<%--                       ${bomSelect.bom_Id} --%>
<!--                   </option> -->
<%--                </c:forEach> --%>

            
            <!-- BOM추가 버튼 -->
            <a href="/mandoo/BOMAdd">
            	<button type="button" class="mho plus" id="addNewBomBtn">
            	BOM 추가
           		</button>
            </a>
            
            <!-- 행 추가 버튼 -->
            <button type="button" class="mho plus" id="addRowBtn">
            행 추가
            </button>
            
         </form>
      </div>

      <!-- 선택한 BOM ID에 대한 상세 정보 표시 테이블 -->
      <form id="bomForm" action="BOM" method="post">
         <input type="hidden" name="action" id="actionType"> 
         <input type="hidden" name="bom_Id" id="bomId" value="${param.bom_Id}">
         
         <table id="table" class="sr_bom" border="solid black 1px;">
            <tr>
               <th class="srTh thwidth">품목코드</th>
               <th class="srTh">품목명</th>
               <th class="srTh thwidth">수량</th>
               <th class="srTh thwidth">단위</th>
               <th class="srTh thwidth">수정</th>
               <th class="srTh thwidth">삭제</th>
            </tr>
            <c:forEach var="bom" items="${list}">
               <tr>
                  <td>${bom.item_Code}</td>
                  <td>${bom.item_Name}</td>
                  <td>${bom.bom_Count}</td>
                  <td>${bom.bom_Unit}</td>
                  <td>
                     <button type="button" class="editBtn" data-bomid="${bom.bom_Id}" 
                        data-itemcode="${bom.item_Code}" data-itemname="${bom.item_Name}"
                        data-bomcount="${bom.bom_Count}" data-bomunit="${bom.bom_Unit}">수정
                     </button>
                  </td>
                  <td>
                     <button class="editBtn" type="submit" name="action" value="delete">삭제</button>
                  </td>
               </tr>
            </c:forEach>
         </table>
      </form>

   </div>

   <script src="resources/JS/BOM.js"></script>
</body>
</html>
