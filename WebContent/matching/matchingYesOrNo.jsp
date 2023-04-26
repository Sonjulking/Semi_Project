<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매칭하시겠습니까?</title>

<link href="https://unpkg.com/nes.css@latest/css/nes.min.css" rel="stylesheet" />

<style type="text/css">

@font-face {
	font-family: "pixel"; /* 사용하고 싶은 font-family명을 지정 */
	src: url("./css/font/neodgm.woff") format("opentype"); /* 폰트파일 불러오기 */
}

body {
	margin: 0;
	padding: 0;
	background-color: white;
	font-family: "pixel", sans-serif;
}

form {
	position:absolute;
	top:30px;
	left:50%;
	transform: translate(-50%);
	width: 400px;
	height: 608px;
	padding: 20px;
	background-color: white;
	border: 1px solid #ccc;
	border-radius: 5px;
	font-family: "pixel", sans-serif;
}

#Yesbutton {
	margin-right: 50px;
	margin-left: 67px;
}
#cancel-btn1 {
	margin-left: 60px;
}

#cancel-btn2 {
	visibility: hidden;
}

#img {
	margin-left: 42px;
	width: 280px;
}


</style>
 </head>
<body onload="autoClick()">
	
	<form method="post" name="f" id="YesOrNO" class="nes-container is-rounded">

		<c:set var="mdto" value="${Match }" />
		<input type="hidden" name="id" value="${mdto.getMatching_user_id() }">
		<input type="hidden" name="matched" value="${mdto.getMatched() }">
		<input type="hidden" name="gamename" value="${mdto.getGame_name() }">
		<input type="hidden" name="tier" value="${mdto.getTier() }">
		
		<br>
		<br>
		<br>
		
		<img id="img"  src="${pageContext.request.contextPath}/img/assets/ramDDA.png">
		
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		
		<div>
	
		<input type="submit" id="Yesbutton" value="수락"
		class="nes-btn is-success"
			formaction="<%=request.getContextPath()%>/matchingAccept.do">

		<input type="submit" id="cancel-btn1" value="취소"
		  class="nes-btn is-error"
		  onclick="alert('매칭이 취소되었습니다.')"
			formaction="<%=request.getContextPath()%>/matchingdelete_ok.do">
			
		<input type="submit" id="cancel-btn2" value="취소"
		  class="nes-btn is-error"
		  onclick="alert('시간이 지나서 매칭이 취소되었습니다.')"
			formaction="<%=request.getContextPath()%>/matchingdelete_ok.do">
			
		</div>
	</form>
	
	<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
	

	<script type="text/javascript">
	
	function autoClick() {
		setTimeout(function() {
			document.getElementById("cancel-btn2").click();
		}, 20000); // 20초 후에 자동 클릭
	}
	
	
	</script>
	
</body>
</html>
