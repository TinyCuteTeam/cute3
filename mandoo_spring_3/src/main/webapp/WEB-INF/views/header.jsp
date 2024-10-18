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

small {
	font-size: 15px;
	position: absolute;
	left: 90px;
	top: 35px;
	padding-bottom: 10px;
}

.user-info {
	margin-bottom: 100px;
}

</style>

<body>
	<div class="category">
		<div class="menu-icon">
			<img class="menu-icon" src="${pageContext.request.contextPath}/resources/image/menu.png">
		</div>

		<div class="category-item logo-item">
			<a href="/mandoo/index" class="category-link"> 
				<img class="logo-icon" src="${pageContext.request.contextPath}/resources/image/logo.png">
			</a>
		</div>

		<c:choose>
			<c:when test="${sessionScope.user_access == 1}">
    <div class="category-item">
        <a href="/mandoo/item" class="category-link ${fn:contains(pageContext.request.requestURI, '/item') || fn:contains(pageContext.request.requestURI, '/BOM') || fn:contains(pageContext.request.requestURI, '/client') || fn:contains(pageContext.request.requestURI, '/error') ? 'title' : ''}">기준관리</a>
        <div class="_category">
            <a href="/mandoo/item" class="category-link ${fn:contains(pageContext.request.requestURI, '/item') || fn:contains(pageContext.request.requestURI, '/bom') || fn:contains(pageContext.request.requestURI, '/client') ? 'title' : ''}">품목 코드 조회</a><br>
            <a href="/mandoo/bom?bom_Id=A00001" class="category-link ${fn:contains(pageContext.request.requestURI, '/BOM') ? 'title' : ''}">BOM(레시피관리)</a><br>
            <a href="/mandoo/client" class="category-link ${fn:contains(pageContext.request.requestURI, '/client') ? 'title' : ''}">거래처 관리</a><br>
            <a href="/mandoo/error" class="category-link ${fn:contains(pageContext.request.requestURI, '/error') ? 'title' : ''}">에러코드</a><br>
        </div>
    </div>

    <div class="category-item">
        <a href="/mandoo/OrderInfo" class="category-link ${fn:contains(pageContext.request.requestURI, '/orderInfo') || fn:contains(pageContext.request.requestURI, '/ProductionPlan') || fn:contains(pageContext.request.requestURI, '/Work') ? 'title' : ''}">생산계획</a>
        <div class="_category">
            <a href="/mandoo/OrderInfo" class="category-link ${fn:contains(pageContext.request.requestURI, '/orderInfo') ? 'title' : ''}">발주확인</a><br>
            <a href="/mandoo/ProductionPlan" class="category-link ${fn:contains(pageContext.request.requestURI, '/ProductionPlan') ? 'title' : ''}">생산계획</a><br>
            <a href="/mandoo/Work" class="category-link ${fn:contains(pageContext.request.requestURI, '/Work') ? 'title' : ''}">작업지시서 확인</a><br>
        </div>
    </div>

    <div class="category-item">
        <a href="/mandoo/Stock" class="category-link ${fn:contains(pageContext.request.requestURI, '/Stock') ? 'title' : ''}">재고관리</a>
        <div class="_category">
            <a href="/mandoo/Stock" class="category-link ${fn:contains(pageContext.request.requestURI, '/Stock') ? 'title' : ''}">재고현황</a>
        </div>
    </div>

    <div class="category-item">
        <a href="/mandoo/ProductionStatusRead" class="category-link ${fn:contains(pageContext.request.requestURI, '/ProductionStatusRead') ? 'title' : ''}">공정관리</a>
        <div class="_category">
            <a href="/mandoo/ProductionStatusRead" class="category-link ${fn:contains(pageContext.request.requestURI, '/ProductionStatusRead') ? 'title' : ''}">생산현황</a>
        </div>
    </div>

    <div class="category-item">
        <a href="/mandoo/FaultyRead" class="category-link ${fn:contains(pageContext.request.requestURI, '/Faulty') ? 'title' : ''}">품질관리</a>
        <div class="_category">
            <a href="/mandoo/FaultyRead" class="category-link ${fn:contains(pageContext.request.requestURI, '/Faulty') ? 'title' : ''}">불량률파악보고서</a><br>
        </div>
    </div>

    <div class="category-item">
        <a href="/mandoo/productionOrder/monthly" class="category-link ${fn:contains(pageContext.request.requestURI, 'monthlyProduction') || fn:contains(pageContext.request.requestURI, '/shipment') ? 'title' : ''}">실적 및 출하</a>
        <div class="_category">
            <a href="/mandoo/productionOrder/monthly" class="category-link ${fn:contains(pageContext.request.requestURI, 'monthlyProduction') ? 'title' : ''}">실적마감</a><br>
            <a href="/mandoo/shipment" class="category-link ${fn:contains(pageContext.request.requestURI, '/shipment') ? 'title' : ''}">출하확인</a><br>
        </div>
    </div>

    <div class="category-item">
        <a href="/mandoo/mypage"> 
            <img class="mypage-icon" src="resources/image/mypage.png">
        </a>
        <div class="_category">
            <a href="/mandoo/mypage" class="category-link ${fn:contains(pageContext.request.requestURI, '/mypage') ? 'title' : ''}">마이페이지</a><br>
            <a href="/mandoo/account" class="category-link ${fn:contains(pageContext.request.requestURI, '/account') ? 'title' : ''}">계정관리</a><br>
            <a href="/mandoo/boardList" class="category-link ${fn:contains(pageContext.request.requestURI, '/boardList') ? 'title' : ''}">사내게시판</a><br>
            <a href="/mandoo/todo" class="category-link ${fn:contains(pageContext.request.requestURI, '/todo') ? 'title' : ''}">일정관리</a><br>
        </div>
    </div>
</c:when>

			<c:otherwise>
				<div class="category-item">
					<a href="/mandoo/Work" class="category-link ${fn:contains(pageContext.request.requestURI, '/Work') ? 'title' : ''}">작업지시서 확인</a>
				</div>

				<div class="category-item">
					<a href="/mandoo/StockInventory" class="category-link ${fn:contains(pageContext.request.requestURI, '/StockInventory') ? 'title' : ''}">재고관리</a>
				</div>

				<div class="category-item">
					<a href="/mandoo/ProductionStatusRead" class="category-link ${fn:contains(pageContext.request.requestURI, '/ProductionStatusRead') ? 'title' : ''}">생산현황</a>
				</div>

				<div class="category-item">
					<a href="/mandoo/FaultyRead" class="category-link ${fn:contains(pageContext.request.requestURI, '/FaultyRead') ? 'title' : ''}">불량률파악보고서</a>
				</div>

				<div class="category-item">
					<a href="/mandoo/boardList" class="category-link ${fn:contains(pageContext.request.requestURI, '/boardList') ? 'title' : ''}">사내게시판</a>
				</div>

				<div class="category-item">
					<a href="/mandoo/mypage" class="category-link ${fn:contains(pageContext.request.requestURI, '/mypage') ? 'title' : ''}">마이페이지</a>
				</div>

				<div class="category-item">
					<a href="/mandoo/todo" class="category-link ${fn:contains(pageContext.request.requestURI, '/todo') ? 'title' : ''}">일정관리</a>
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
			
			<span>|</span> <span class="user-name"><%=((UserDTO) session.getAttribute("user")).getUser_Name()%>님</span>
			<a href="/mandoo/login"><small>로그아웃</small></a>
		</div>
	</div>
</body>
