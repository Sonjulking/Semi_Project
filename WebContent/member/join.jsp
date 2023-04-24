<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>회원가입</title>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- fontawesome cdn -->
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/join.css" />

<link href="https://unpkg.com/nes.css@latest/css/nes.min.css"
	rel="stylesheet" />

</head>
<body>


	<div class="container1">
		<span class="title">겜만추<img id="pixeldva"
				src="${pageContext.request.contextPath}/img/assets/pixeldva.png">  </span> <br>
		<br> <span class="text1">겜만추에서 수 많은 사람들과 플레이하고,</span> <span
			class="text1">레전드 순간을 함께하세요!</span>
	</div>

	<div
		class="join-con nes-container with-title is-rounded is-dark join-con2">
		<p class="title join-text">회원가입</p>
		<form method="post" enctype="multipart/form-data"
			action="<%=request.getContextPath()%>/email_member.do"
			class="joinForm">
			<span>프로필 사진 : </span> <input type="file" name="profile_img"
				value="프로필 사진"><br> <br> <label class="userId "
				for="Id">ID</label><br> <input type="text" id="username" class ="input-wd"
				name="id" size="20" placeholder="아이디 / 영문 + 숫자">
			<p id="id_check"></p>
			<br> <label class="name " for="name">NickName</label><br> <input
				type="text" id="name" class="input-wd" name="name" placeholder="닉네임 입력"> <span
				id="name_check"></span> <br> <br> <label class="password"
				for="password1">PWD</label><br> <input type="password"
				id="password1" class="inputpwd input-wd" name="pwd"
				placeholder="비밀번호 / 6~12자">
			<p id="pwd_check"></p>
			<label class="password" for="password2">PWD2</label><br> <input
				type="password" class="inputpwd input-wd" id="password2" class="inputpwd"
				name="pwd_recheck" placeholder="비밀번호 / 6~12자"><br>
			<p id="pwd_recheck"></p>




			<br> <label class="email" for="email">Email</label><br> <input
				type="text" id="email" class ="input-wd" name="email" placeholder="Email"><span
				id="email_check"></span> <br> <label class="phone" for="phone">Phone</label><br>
			<input type="text" id="phone" class = "input-wd" name="phone" placeholder="전화번호">
			<br> <br> 
			
			<div style="text-align: center;">
			
			<label class="game-title">선호 게임</label> <br>
			<label for="lol" class="game1"><input type="checkbox"
				name="lol" value="lol">&nbsp;LOL</label> &nbsp; <label class="game2"
				for="battle_ground"><input type="checkbox"
				name="battle_ground" value="battle_ground">&nbsp;Battleground</label> <label
				for="overwatch" class="game3"> &nbsp;&nbsp;<input
				type="checkbox" name="overwatch" value="overwatch">&nbsp;OverWatch2
			</label>
			</div> <br> 
			
			<div style="text-align: center;">
				<label class="check_join"><input type="checkbox"
					name="check_info" value="check_info" required="required">약관
					동의</label> <br>
				<button id="signup-btn" class="signup submit-btn nes-btn is-success" type="submit"
					name="join" onclick="">회원가입</button>
			</div>
		</form>
	</div>
	<%-- <script type="text/javascript">
	let link ="<%=request.getContextPath()%>
		";
	</script> --%>
	<script type="text/javascript"
		src="https://code.jquery.com/jquery-3.6.1.js"></script>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.5/jquery.validate.js"></script>

	<script type="text/javascript" src="../js/joinValidation.js"></script>
	<script type="text/javascript" src="../js/join.js"></script>
	<script type="text/javascript" src="../js/nickname.js"></script>
	<script type="text/javascript" src="../js/emailCheck.js"></script>

</body>
</html>