<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 - 로그인 필요</title>

<link href="https://unpkg.com/nes.css@latest/css/nes.min.css" rel="stylesheet" />

<style type="text/css">

@font-face {
	font-family: "pixel"; /* 사용하고 싶은 font-family명을 지정 */
	src: url("./css/font/neodgm.woff") format("opentype"); /* 폰트파일 불러오기 */
}

.login {
	position:absolute;
	top:30px;
	left:50%;
	transform: translate(-50%);
	width: 400px;
	height: 608px;
	padding: 20px;
}

.Manaager {
	font-family: "pixel", sans-serif;
}

.My {
	font-family: "pixel", sans-serif;
}

</style>
</head>
<body>
      
	      
		<section class="login nes-container is-rounded">
			<div align="center">
				<h1>Sorry,,,</h1>			
			</div>
		  <section class="message-list">
		    <section class="message -left">
				<!-- Balloon -->
				<div class="nes-balloon from-left">
					<h3 class="mario">매칭하기 서비스가 안되요!</h3>
				</div>
				
				<div>
					<i class="nes-mario"></i>
				</div>		      
		    </section>
			
			<br>
			<br>
			
		    <section class="message -right">
				<!-- Balloon -->
				<div class="nes-balloon from-right">
					<h3 class="squirtle">매칭 서비스를 이용하려면 로그인이 필요합니다(꼬북). 로그인 후 이용해 주세요(꼬북).
					</h3>
				</div>
				
				<div align="right">
					<i class="nes-squirtle"></i>
				</div>
		      	
		    </section>
		  </section>
		</section>
		      

</body>
</html>