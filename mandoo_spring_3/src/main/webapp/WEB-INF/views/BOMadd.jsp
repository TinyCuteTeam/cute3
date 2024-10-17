<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="kor">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Mandoo</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/CSS/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/CSS/BOM관리_제품추가.css">
</head>

<body>

	<!-- 메인 -->
	<jsp:include page="/WEB-INF/views/header.jsp" />
	<!-- 사이드바 -->
	<jsp:include page="/WEB-INF/views/sidebar_기준관리.jsp" />
	<!-- 내용페이지  -->
	<div class="content">

		<h1>BOM 레시피 추가</h1>

		<!-- 뒤로가기 버튼 -->
		<div class="srPlus">
			<button class="plus">
				<a href="/mandoo/BOM?bomId=A00001">뒤로가기</a>
			</button>
		</div>

		<!-- BOM 정보 입력 -->
		<form action="/mandoo/BOMAdd" method="post">
			<input type="hidden" name="bomId" value="${nextBomId}">
			<table class="infoTable" border="solid black 1px;">
				<tr>
					<th class="srTh">품목명</th>
					<th class="srTh">수량</th>
					<th class="srTh">단위</th>
				</tr>
				<tr>
					<td><select name="itemCode">
							<c:forEach var="item" items="${itemList}">
								<option value="${item.itemCode}">${item.itemName}</option>
							</c:forEach>
					</select></td>
					<td><input type="number" name="bomCount" required></td>
					<td><input type="text" name="bomUnit" required></td>
				</tr>
			</table>

			<!-- 행 추가 버튼 -->
			<div>
				<button type="button" id="addRowBtn" class="plus">품목추가</button>
				<!-- 저장 버튼 -->
				<button type="submit" class="plus">BOM 저장</button>
			</div>
		</form>
	</div>

	<script>
        document.addEventListener("DOMContentLoaded", function() {
            const addRowBtn = document.getElementById('addRowBtn');
            const table = document.querySelector('.infoTable');

            addRowBtn.addEventListener('click', function() {
                const newRow = document.createElement('tr');
                
                newRow.innerHTML = `
                    <td>
                        <select name="itemCode">
                            <c:forEach var="item" items="${itemList}">
                                <option value="${item.itemCode}">${item.itemName}</option>
                            </c:forEach>
                        </select>
                    </td>
                    <td><input type="number" name="bomCount" required></td>
                    <td><input type="text" name="bomUnit" required></td>
                `;
                
                table.appendChild(newRow);
            });
        });
    </script>

</body>

</html>
