<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>회원정보 확인</title>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- fontawesome cdn -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/join.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/findpw.css" />

<link href="https://unpkg.com/nes.css@latest/css/nes.min.css"
	rel="stylesheet" />

<style>
</style>
</head>

<body>
	<form method="post"
		action="<%=request.getContextPath()%>/member_findPwdOk.do">


		<div class="container1">
			<span class="title">겜만추<img id="pixeldva"
				src="${pageContext.request.contextPath}/img/assets/pixeldva.png">
			</span> <br> <br> <span class="text1">겜만추에서 수 많은 사람들과
				플레이하고,</span> <span class="text1">레전드 순간을 함께하세요!</span>
		</div>

		<div
			class="pw-con nes-container with-title is-rounded is-dark join-con2">
			<p class="title join-text">비밀번호 찾기</p>

			<label for="username">아이디</label><br> <input type="text" id="username"
				name="id" placeholder="아이디 입력하세요."> <br><label for="email_find">이메일</label><br>
			<input id="email_find" name="email_find" placeholder="이메일을 입력하세요.">

			
			
			<button class="login find-btn" type="submit">비밀번호 찾기</button>

			<h6 class="lostpwd">
				<a href="/Semi_Project/member/idFind.jsp">아이디를 잊으셨나요?</a>
			</h6>

			<a href="/Semi_Project/member/join.jsp"><button class="signup"
					type="button">회원가입</button></a>


		</div>


	</form>

</body>
</html>