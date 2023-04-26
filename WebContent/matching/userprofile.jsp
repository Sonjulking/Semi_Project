<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:set var="odto" value="${Op}" />
<title>${odto.getMatching_user_id()}님의프로필</title>

<link href="https://unpkg.com/nes.css@latest/css/nes.min.css" rel="stylesheet" />

<style type="text/css">

@font-face {
	font-family: "pixel"; /* 사용하고 싶은 font-family명을 지정 */
	src: url("./css/font/neodgm.woff") format("opentype"); /* 폰트파일 불러오기 */
}

#container {
	position:absolute;
	top:30px;
	left:50%;
	transform: translate(-50%);
	width: 400px;
	height: 608px;
	padding: 20px;
	border-radius: 5px;
	font-family: "pixel", sans-serif;	
}

.profilename {
	font-size: 32px;
	font-family: "pixel", sans-serif;
}

.profilelist {
	font-size: 20px;
	font-family: "pixel", sans-serif;
}

.wrapper {
	font-size: 20px;
	font-family: "pixel", sans-serif;
	margin: auto;
}

.chat {
	display: block;
	margin: auto;
}

.img {
	width: 200px;
}

#cancel-btn2 {
	visibility: hidden;
}

</style>

</head>
<body onload="autoClick()">

	<form method="post" id="container" class="nes-container is-rounded">
	
	<c:set var="mydto" value="${My}" />
		<input type="hidden" name="id" value="${mydto.getMatching_user_id() }">
		
	<div align="center" class="profilename">
		<span>${odto.getMatching_user_id()}님의 프로필</span>
	</div>
	
	<br>
		
	<div align="center" class="profile">
		<c:if test="${odto.getGame_name() eq '배틀그라운드' }">
			<img
				class="img"
				src="${pageContext.request.contextPath}/img/assets/BG.jpg">
			
		</c:if>

		<c:if test="${odto.getGame_name() eq '리그오브레전드' }">
			<img
				class="img"
				src="${pageContext.request.contextPath}/img/assets/LOL.png">
			
		</c:if>

		<c:if test="${odto.getGame_name() eq '오버워치' }">
			<img
				class="img"
				src="${pageContext.request.contextPath}/img/assets/OW.jpg">
		</c:if>
	</div>
		
		<br>
		<br>
		<br>
		<br>
		<br>
		
		<div class="profilelist">
		  <ul class="nes-list is-disc">
		    <li>닉네임 : ${odto.getMatching_user_nikname()}</li>
		    <li>디스코드 아이디 : ${odto.getDiscord_nikname()}</li>
		    <li>카카오톡 아이디 : ${odto.getKakao_id()}</li>
		  </ul>
		  
		  <br>
		  <br>
		</div>
		
	<input type="submit" id="cancel-btn2" value="취소"
		  class="nes-btn is-error"
		  onclick=""
			formaction="<%=request.getContextPath()%>/finaldelete_ok.do">
	
	</form>
	
	<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
	<script type="text/javascript">
	
	/* $(document).ready(function() {
		$('#cancel-btn2').trigger('click');
	}); */
	
	function autoClick() {
		setTimeout(function() {
			document.getElementById("cancel-btn2").click();
		}, 10000); // 40초 후에 자동 클릭
	}
	
	</script>

</body>
</html>