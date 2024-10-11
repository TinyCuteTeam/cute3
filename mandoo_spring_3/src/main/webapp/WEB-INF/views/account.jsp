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
   href="${pageContext.request.contextPath}/CSS/계정관리.css">
</head>
<body>
   <jsp:include page="/WEB-INF/views/header.jsp" />
   <!-- 사이드바 -->
   <jsp:include page="/WEB-INF/views/sidebar_마이페이지.jsp" />
   <!-- 내용페이지 -->
   <div class="content">
      <div id="content-display">
         <form method="post"
            action="${pageContext.request.contextPath}/account">
            <div class="main">
               <div class="flex header srTh">
                  <div></div>
                  <div>아이디</div>
                  <div>이름</div>
                  <div>이메일</div>
               </div>

               <c:forEach var="account" items="${accounts}">
                  <div class="flex round">
                     <div>
                        <input type="checkbox" name="selectedAccounts"
                           value="${account.accountId}" class="chk">
                     </div>
                     <div>${account.account_Id}</div>
                     <div>${account.account_Name}</div>
                     <div>${account.account_Email}</div>
                  </div>
               </c:forEach>
            </div>
			<div class="btn">
				<button type="submit" name="action" value="approve" class="btn1">승인</button>
				<button type="submit" name="action" value="reject" class="btn2">거절</button>
			</div>

         </form>

		<!-- 페이징 -->
		<div class="pagination">
			<c:if test="${currentPage > 1}">
				<a href="/mandoo/account?page=${currentPage - 1}">이전</a>
			</c:if>

			<c:forEach var="i" begin="1" end="${totalPages}">
				<a href="/mandoo/account?page=${i}" class="${i == currentPage ? 'active' : ''}">${i}</a>
			</c:forEach>

			<c:if test="${currentPage < totalPages}">
				<a href="/mandoo/account?page=${currentPage + 1}">다음</a>
			</c:if>
		</div>
      </div>

      <script src="${pageContext.request.contextPath}/JS/계정관리.js"></script>
</body>
</html>
