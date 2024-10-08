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
         <form method="get" action="${pageContext.request.contextPath}/BOM">
            <select id="recipeSelect" name="bomId" onchange="this.form.submit()">
               <c:forEach var="bomId" items="${bomIds}">
                  <option value="${bomId}"
                     ${param.bomId == bomId || (empty param.bomId && bomId == 'A0001') ? 'selected' : ''}>${bomId}</option>
               </c:forEach>
            </select>
            <!-- BOM추가 버튼 -->
            <a href="/mandoo/BOMAdd"><button type="button" class="mho plus"
                  id="addNewBomBtn">BOM 추가</button></a>
            <!-- 행 추가 버튼 -->
            <button type="button" class="mho plus" id="addRowBtn">행 추가</button>
         </form>
      </div>

      <!-- 선택한 BOM ID에 대한 상세 정보 표시 테이블 -->
      <form id="bomForm" action="${pageContext.request.contextPath}/BOM"
         method="post">
         <input type="hidden" name="action" id="actionType"> <input
            type="hidden" name="bomId" id="bomId" value="${param.bomId}">
         <table id="table" class="sr_bom" border="solid black 1px;">
            <tr>
               <th class="srTh thwidth">품목코드</th>
               <th class="srTh">품목명</th>
               <th class="srTh thwidth">수량</th>
               <th class="srTh thwidth">단위</th>
               <th class="srTh thwidth">수정</th>
               <th class="srTh thwidth">삭제</th>
            </tr>
            <c:forEach var="bom" items="${bomList}">
               <tr>
                  <td>${bom.item_Code}</td>
                  <td>${bom.item_Name}</td>
                  <td>${bom.bom_Count}</td>
                  <td>${bom.bom_Unit}</td>
                  <td>
                     <button type="button" class="editBtn" data-bomid="${bom.bom_Id}"
                        data-itemcode="${bom.itemCode}" data-itemname="${bom.item_Name}"
                        data-bomcount="${bom.bomCount}" data-bomunit="${bom.bom_Unit}">수정</button>
                  </td>
                  <td>
                     <button class="editBtn" type="submit" name="action"
                        value="delete">삭제</button>
                  </td>
               </tr>
            </c:forEach>
         </table>
      </form>

   </div>
   <!--content-->

   <script>
    document.addEventListener('DOMContentLoaded', function() {
        const bomForm = document.getElementById('bomForm');
        const bomIdField = document.getElementById('bomId');

 

        // 행 추가 버튼 클릭 시 빈 행 추가
        document.getElementById('addRowBtn').addEventListener('click', function() {
            const table = document.getElementById('table');
            const newRow = table.insertRow();

            //여기 한번 더 확인 질문 
            newRow.innerHTML = `
                <td>
                    <select name="itemCode">
                        <c:forEach var="item" items="${itemList}">
                            <option value="${item.itemCode}" data-itemname="${item.itemName}">${item.itemName}</option>
                        </c:forEach>
                    </select>
                </td>
                <td><input type="text" name="bomName"></td>
                <td><input type="number" name="bomCount"></td>
                <td><input type="text" name="bomUnit"></td>
                <td><button type="button" class="editBtn">수정</button></td>
                <td><button type="button" class="delBtn editBtn">삭제</button></td>
            `;

            // 새로 추가된 행에 이벤트 리스너 추가
            newRow.querySelector('.editBtn').addEventListener('click', function() {
                // 수정 버튼 클릭 시 로직 추가
            });

            newRow.querySelector('.delBtn').addEventListener('click', function() {
                newRow.remove();
            });
        });
    });
    </script>
</body>
</html>
