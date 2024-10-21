<%@ page contentType="text/html; charset=UTF-8" language="java"%>
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

    <!-- 제품 레시피 선택 -->
<!--     bom id 완제품 코드 보여주는 곳 -->
    <div class="srPlus">
        <form method="get" action="bom">
          <select id="recipeSelect" name="bom_Id" onchange="this.form.submit()">
    		<option value="A00001" <c:if test="${param.bom_Id == 'A00001' || empty param.bom_Id}">selected</c:if>>A00001 고기만두</option>
    		<option value="A00002" <c:if test="${param.bom_Id == 'A00002'}">selected</c:if>>A00002 김치만두</option>
		</select>
            
<!--                 <button type="button" class="mho plus" id="addNewBomBtn" >BOM 추가</button> -->
            
<!--             <button type="button" class="mho plus" id="addRowBtn">행 추가</button> -->
            </form>
    </div>
            

    <!-- 선택한 BOM ID에 대한 상세 정보 표시 테이블 -->
    <form id="bomForm" action="BOM" method="post">
<!--         <input type="hidden" name="action" id="actionType">  -->
<%--         <input type="hidden" name="bom_Id" id="bomId" value="${param.bom_Id}"> --%>
        <table id="table" class="sr_bom" border="solid black 1px;">
            <tr>
                <th class="srTh thwidth">품목코드</th>
                <th class="srTh">품목명</th>
                <th class="srTh thwidth">수량</th>
                <th class="srTh thwidth">단위</th>
<!--                 <th class="srTh thwidth">수정</th> -->
<!--                 <th class="srTh thwidth">삭제</th> -->
            </tr>
            <c:forEach var="bom" items="${list}">
                <tr>
                    <td>${bom.item_Code}</td>
                    <td>${bom.item_Name}</td>
                    <td>${bom.bom_Count}</td>
                    <td>${bom.bom_Unit}</td>
<!--                     <td> -->
<!--                     	 <form method="post" action="bomUpdate" class="updateForm"> -->
<%--                     	 	<input type="hidden" name="item_Code" value="${bom.item_Code}"> --%>
<%--                        	 	<input type="hidden" name="item_Name" value="${bom.item_Name}"> --%>
<%--                         	<input type="hidden" name="bom_Count" value="${bom.bom_Count}"> --%>
<%--                         	<input type="hidden" name="bom_Unit" value="${bom.bom_Unit}"> --%>
<%--                         <button type="button" class="editBtn bomEditBtn" data-bom-id="${bom.bom_Id}"  --%>
<%--                                 data-item-code="${bom.item_Code}" data-item-name="${bom.item_Name}" --%>
<%--                                 data-bom-count="${bom.bom_Count}" data-bom-unit="${bom.bom_Unit}">수정</button> --%>
                                
<!--                           </form> -->
<!--                     </td> -->
                    
<!--                     <td> -->
<!--                         <button class="editBtn" type="submit" name="action" value="delete">삭제</button> -->
<!--                     </td> -->
                </tr>
            </c:forEach>
        </table>
    </form>
    
    <!-- 수정용 모달창 -->
	<div id="popup_update" class="popup modalStyle">
		<div class="popup-content">
			<span class="close-popup" id="updateClose">&times;</span> 
			<h2>BOM 상세 수정</h2>
			<form id="bom_editForm" method="post" action="bomUpdate">
			
				<input type="hidden" name="action" id="actionEdit" value="add">
				
<!-- 				품목코드 -->
				<input type="hidden" name="item_Code" id="item_Code"  placeholder="품목 코드" required><br> 
				<input type="hidden" name="item_Name" id="item_Name"  placeholder="품목명" required><br> 
		
				<label for="bom_Count">수량:</label><br> 
				<div class=required> ※ 수량은 숫자만 입력가능 합니다 </div> 
				<input type="text" name="bom_Count" id="bom_Count" placeholder="수량" required><br>
				
				<br>
				<label for="bom_Unit">단위:</label><br>
				<input type="text" name="bom_Unit" id="bom_Unit" placeholder="단위" required><br>
			
				<br> <br>
				
				<button type="button" id="bomSubmit">저장</button>
				
			</form>
		</div>
		
	</div>

    <!-- 페이지 번호 표시 -->
    <div class="pagination">
        <c:forEach begin="1" end="${totalPages}" var="pageNum">
            <a href="bom?page=${pageNum}&bom_Id=${bom_Id}" 
               style="${currentPage == pageNum ? 'font-weight:bold' : ''}">
                ${pageNum}
            </a>
        </c:forEach>
    </div>
    

    

</div>

<script src="resources/JS/BOM.js"></script>
</body>
</html>
