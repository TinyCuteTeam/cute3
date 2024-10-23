﻿<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mandoo</title>
    <link rel="stylesheet" href="resources/CSS/style.css">
    <link rel="stylesheet" href="resources/CSS/BOM.css">
</head>
<body>

<jsp:include page="/WEB-INF/views/header.jsp" />
<jsp:include page="/WEB-INF/views/sidebar_기준관리.jsp" />

<div class="content">
    <h1>BOM 레시피 관리</h1>

    <!-- 제품 레시피 선택 bom id 완제품 코드 보여주는 곳 -->
    <div class="srPlus">
        <form method="get" action="bom" class="selectForm">
          <select id="recipeSelect" name="bom_Id" onchange="this.form.submit()">
    		<option value="" <c:if test="${empty param.bom_Id}">selected</c:if>>전체 조회</option>
    		
    		<c:forEach var="bomId" items="${bomIds}">
       		 <option value="${bomId}" <c:if test="${param.bom_Id == bomId}">selected</c:if>>${bomId}</option>
    		</c:forEach>
    		
		</select>
		</form>
        <button type="button" class="mho plus" id="addNewBomBtn" >BOM 추가</button>
    </div>

    <!-- 선택한 BOM ID에 대한 상세 정보 표시 테이블 -->
    <form id="bomForm" action="BOM" method="post">
<!--         <input type="hidden" name="action" id="actionType">  -->
<%--         <input type="hidden" name="bom_Id" id="bomId" value="${param.bom_Id}"> --%>
        <table id="table" class="sr_bom" border="solid black 1px;">
            <tr>
                <th class="srTh thwidth">제품코드</th>
                <th class="srTh thwidth">제품명</th>
                <th class="srTh thwidth">품목코드</th>
                <th class="srTh">품목명</th>
                <th class="srTh thwidth">수량</th>
                <th class="srTh thwidth">단위</th>
                <th class="srTh thwidth">수정</th>
<!--                 <th class="srTh thwidth">삭제</th> -->
            </tr>
            <c:forEach var="bom" items="${list}">
                <tr>
                    <td>${bom.bom_Id}</td>
                    <td>${bom.bom_Name}</td>
                    <td>${bom.item_Code}</td>
                    <td>${bom.item_Name}</td>
                    <td>${bom.bom_Count}</td>
                    <td>${bom.bom_Unit}</td>
                    <td>
                    	 <form method="post" action="bomUpdate" class="updateForm">
                    	 	<input type="hidden" name="bom_Id" value="${bom.bom_Id}">
                    	 	<input type="hidden" name="bom_Id" value="${bom.bom_Name}">
                    	 	<input type="hidden" name="item_Code" value="${bom.item_Code}">
                       	 	<input type="hidden" name="item_Name" value="${bom.item_Name}">
                        	<input type="hidden" name="bom_Count" value="${bom.bom_Count}">
                        	<input type="hidden" name="bom_Unit" value="${bom.bom_Unit}">
                       		<button type="button" class="editBtn bomEditBtn" 
                       			data-bom-id="${bom.bom_Id}" 
                                data-item-code="${bom.item_Code}" data-item-name="${bom.item_Name}"
                                data-bom-count="${bom.bom_Count}" data-bom-unit="${bom.bom_Unit}">수정</button>
                          </form>
                    </td>
                    
<!--                     <td> -->
<!--                     	<form method="post" action="bomDelete"> -->
<%--                     	<input type="hidden" name="bom_Id" value="${bom.bom_Id}"> --%>
<!--                         <button class="editBtn deleteBtn" type="submit" name="action" value="delete">삭제</button> -->
<!--                         </form> -->
<!--                     </td> -->
                </tr>
            </c:forEach>
        </table>
    </form>
    
    	<!-- 모달 창 -->
	<div id="popup" class="popup modalStyle">
		<div class="popup-content">
			<span class="close-popup" id="close-popup">&times;</span> 
			<h2>BOM 레시피 등록</h2>
			<form id="bomInsertForm" method="post" action="bomInsert">
			
				<input type="hidden" name="action" id="action" value="add">
				
				* 제품 코드:<br> 
				<input type="text" name="bom_Id" id="bom_Id"  placeholder="제품 코드" required><br> 
		
				* 품목 코드:<br> 
				<input type="text" name="item_Code" id="item_Code" placeholder="품목 코드" required><br>
				
				* 품목명:<br> 
				<input type="text" name="item_Name" id="item_Name" placeholder="품목명" required><br>
				
				* 수량:<br> 
				<input type="text" name="bom_Count" id="bom_Count" placeholder="수량" required><br>
				
				* 단위:<br> 
				<input type="text" name="bom_Unit" id="bom_Unit" placeholder="단위" required><br>
				
				<div class=required> * 표시는 필수 항목입니다. </div>
				<button type="submit">저장</button>
				
			</form>
		</div>
	</div>
    
    <!-- 수정용 모달창 -->
	<div id="popup_update" class="popup modalStyle">
		<div class="popup-content">
			<span class="close-popup" id="updateClose">&times;</span> 
			<h2>BOM 상세 수정</h2>
			<form id="bom_editForm" method="post" action="bomUpdate">
			
				<input type="hidden" name="action" id="actionEdit" value="add">
				
				<input type="hidden" name="bom_Id" id="edit_bom_Id"  placeholder="제품명" required><br> 
				<input type="hidden" name="item_Code" id="edit_item_Code"  placeholder="품목 코드" required><br> 
				<input type="hidden" name="item_Name" id="edit_item_Name"  placeholder="품목명" required><br> 
		
				<label for="bom_Count">수량:</label><br> 
				<div class=required> ※ 수량은 숫자만 입력가능 합니다 </div> 
				<input type="text" name="bom_Count" id="edit_bom_Count" placeholder="수량" required><br>
				
				<br>
				<label for="bom_Unit">단위:</label><br>
				<input type="text" name="bom_Unit" id="edit_bom_Unit" placeholder="단위" required><br>
			
				<br> <br>
				
				<button type="button" id="bomSubmit">저장</button>
			</form>
		</div>
	</div>

    <!-- 페이지 번호 표시 -->
    <div class="pagination">
        <c:forEach begin="1" end="${totalPages}" var="pageNum">
<a href="bom?page=${pageNum}&bom_Id=${bom_Id}" 
   class="${currentPage == pageNum ? 'active' : ''}">
    ${pageNum}
</a>

        </c:forEach>
    </div>
    

</div>

<script src="resources/JS/BOM.js"></script>
</body>
</html>