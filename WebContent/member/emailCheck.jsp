<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/emailchk.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/main.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/nav.css" />
<link href="https://unpkg.com/nes.css@latest/css/nes.min.css"
	rel="stylesheet" />

<body>
	<div align="center">
		<form method="post" enctype="multipart/form-data"
			action="<%=request.getContextPath()%>/insert_member.do"
			class="joinForm">
			<input type="hidden" name="profile_img" value="${Member_Profile}">
			<input type="hidden" id="username" name="id" value="${ID}"> <input
				type="hidden" id="password1" name="pwd" value="${Member_Pwd}">
			<input type="hidden" id="name" name="name" value="${Member_Nickname}">
			<input type="hidden" id="email" name="email" value="${Member_Email}">
			<input type="hidden" id="phone" name="phone" value="${Member_Phone}">
			<input type="hidden" name="lol" value="${Prefer_lol}"> <input
				type="hidden" name="battle_ground" value="${Prefer_battle_ground}">
			<input type="hidden" name="overwatch" value="${ Prefer_overwatch}">
			<input type="hidden" name="email_key" value="${AuthenticationKey }">


			<div
				class="temp-con nes-container with-title is-rounded is-dark join-con2">
				<p class="title temp-text">임시인증키 확인</p>
				<p>인증번호가 담긴 이메일을 전송했습니다.</p>
				<p>메일이 도착안했다면, 스팸메일 함이나</p>
				<p>메일주소를 다시한번 확인해주세요.</p>
				<input type="text" name="temp_key" class ="nes-input is-dark input-temp"> <br><br>



				<button id="signup-btn" class="signup submit-btn nes-btn is-success" type="submit"
					name="join">키번호 제출</button>


			</div>
		</form>
	</div>
	<script type="text/javascript"
		src="https://code.jquery.com/jquery-3.6.1.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/preventClick.js"></script>
</body>
</html>