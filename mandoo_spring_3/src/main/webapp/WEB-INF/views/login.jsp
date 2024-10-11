<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<title>로그인</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f4f4f4;
	margin: 0;
	padding: 0;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
}

.loginmain {
	text-align: center;
	width: 350px;
	padding: 20px;
	background-color: #ffffff;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	border-radius: 8px;
}

h1, h2 {
	color: #333;
	margin-bottom: 20px;
}

.modal {
	display: none;
	position: fixed;
	z-index: 1;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgba(0, 0, 0, 0.4);
	padding-top: 60px;
}

.modal-content {
	background-color: #fff;
	margin: 5% auto;
	padding: 20px;
	border: 1px solid #888;
	width: 300px;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
	border-radius: 8px;
	animation-name: animatetop;
	animation-duration: 0.4s;
}

keyframes animatetop {from { top:-300px;
	opacity: 0;
}

to {
	top: 0;
	opacity: 1;
}

}
.close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
	margin-top: -10px;
}

.close:hover, .close:focus {
	color: #000;
	text-decoration: none;
	cursor: pointer;
}

button {
	background-color: #698fcc;
	color: white;
	padding: 10px 20px;
	margin: 10px 0;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	width: 100%;
	box-sizing: border-box;
	font-size: 16px;
}

button:hover {
	background-color: #577cbf;
}

input[type=text], input[type=password], input[type=email] {
	width: 100%;
	padding: 10px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

input[type=text]:focus, input[type=password]:focus, input[type=email]:focus
	{
	border-color: #698fcc;
	outline: none;
	box-shadow: 0 0 5px rgba(105, 143, 204, 0.5);
}

.logo-icon {
	width: 200px;
	margin-bottom: 20px;
}
</style>

</head>

<body>
	<div class="loginmain">
		<img class="logo-icon"
			src="${pageContext.request.contextPath}/resources/image/logo.png">

		<!-- required :  폼 데이터가 서버로 제출되기 전 반드시 채워져 있어야 하는 입력 필드 -->
		<form action="${pageContext.request.contextPath}/login" method="post">
			<label for="user_id">아이디</label> <input type="text" name="user_id"
				id="user_id" required><br> <label for="user_pw">비밀번호</label>
			<input type="password" name="user_pw" id="user_pw" required><br>

			<button type="submit">로그인</button>
		</form>
		<button onclick="openRegisterModal()">회원가입</button>
	</div>

	<div>
		<%
		String error = request.getParameter("error");
		if (error != null && "invalid".equals(error)) {
			out.println("<p style='color:red;'>아이디 또는 비밀번호가 잘못되었습니다.</p>");
		}
		%>
	</div>

	<!-- 회원가입 모달 -->
	<div id="registerModal" class="modal">
		<div class="modal-content">
			<span class="close" onclick="closeRegisterModal()">&times;</span>
			<h2>회원가입</h2>
			<form action="${pageContext.request.contextPath}/register"
				method="post" onsubmit="return validateForm();">
				<label for="register_user_id">아이디:</label> <input type="text"
					name="account_Id" id="register_user_id" required><br>
				<label for="register_user_pw">비밀번호:</label> <input type="password"
					name="account_Pw" id="register_user_pw" required><br>
				<label for="register_user_pw_check">비밀번호 확인:</label> <input
					type="password" name="user_pw_check" id="register_user_pw_check"
					required><br> <label for="register_user_name">이름:</label>
				<input type="text" name="account_Name" id="register_user_name"
					required><br> <label for="register_user_email">이메일:</label>
				<input type="email" name="account_Email" id="register_user_email"
					required><br>

				<button type="submit">가입 신청</button>
			</form>
		</div>
	</div>

	<!-- 로그인 성공 모달 -->
	<div id="successModal" class="modal">
		<div class="modal-content">
			<span class="close" onclick="closeSuccessModal()">&times;</span>
			<h2>로그인 성공</h2>
			<p>로그인에 성공했습니다. 메인 페이지로 이동합니다.</p>
			<button
				onclick="window.location.href='${pageContext.request.contextPath}/index.jsp';">확인</button>
		</div>
	</div>

	<script>
		function openRegisterModal() {
			document.getElementById("registerModal").style.display = "block";
		}

		function closeRegisterModal() {
			document.getElementById("registerModal").style.display = "none";
		}

		function openSuccessModal() {
			document.getElementById("successModal").style.display = "block";
		}

		function closeSuccessModal() {
			document.getElementById("successModal").style.display = "none";
		}

		window.onload = function() {
			// 로그인 성공 시 성공 모달 자동 표시
			if (new URLSearchParams(window.location.search).has('success')) {
				openSuccessModal();
			}
		}
	</script>
</body>

</html>