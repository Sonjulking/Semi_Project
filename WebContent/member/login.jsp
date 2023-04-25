<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>로그인</title>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- fontawesome cdn -->
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" href="../css/login.css" />

<%--  --%>
<link href="https://unpkg.com/nes.css@latest/css/nes.min.css" rel="stylesheet" />

<style>
</style>
</head>

<body>
	<form method="post"
		action="<%=request.getContextPath()%>/member_login.do">
		
		<!-- 글자 컨테이너  -->
		<div class="container1">
			<span class="title"><a href="../main.jsp">겜만추</a></span><i class="nes-kirby"></i> 
			<br> <br> 
			<span class="text1">겜만추에서
			수 많은 사람들과 플레이하고,</span> <span class="text1">레전드 순간을 함께하세요!</span>
		</div>

		<!-- 로그인 폼 컨테이너  -->
		<div class="container2 nes-container is-rounded is-dark">
			<div align="center">
				<i class="snes-jp-logo"></i>
			</div>
			
			<br>
			
				<label class="userID">아이디</label> 
			<div class="nes-field is-inline">
				<input type="text" id="username dark_field" class="nes-input is-dark"
					name="id" placeholder="아이디를 입력하세요."> 
			</div>
			
			<br>
			
				<label class="userPWD">비밀번호</label>
			<div class="nes-field is-inline">
				<input type="password" id="password dark_field" class="nes-input is-dark"
					name="pwd" placeholder="비밀번호를 입력하세요."> 
			</div>
			
			<br>

			<div align="center">
				<button class="login nes-btn is-primary" type="submit">로그인</button>
			</div>
			
			
			<h6 class="lostpwd">
				<a href="/Semi_Project/member/findPwd.jsp">비밀번호를 잊으셨나요?</a>
			</h6>
			
			
			<div align="center">
				<a href="/Semi_Project/member/join.jsp">
				<button class="signup nes-btn is-success" type="button">회원가입</button>
				</a>
			</div>


		</div>

	</form>

</body>
</html>