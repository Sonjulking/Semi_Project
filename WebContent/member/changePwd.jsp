<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
<link href="https://unpkg.com/nes.css@latest/css/nes.min.css"
	rel="stylesheet" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/join1.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/changepw1.css" />

</head>
<body>

	<div
		class="pw-con nes-container with-title is-rounded is-dark join-con2">
		<p class="title join-text">임시키 입력</p>

		<div style="text-align: center;">

			<p>받은메일함이나 스팸메일함으로 받은</p> 
			<p>임시 비밀번호를 입력해 주세요</p>

			<form method="post"
				action="<%=request.getContextPath()%>/find_pwd_ok.do">
				<input type="hidden" name="tempPwd" value="${TempPwd }"> <input
					type="hidden" name="userId"
					value="<%=session.getAttribute("UserId")%>">



				<p>임시 비밀번호 입력</p>
				<input type="password" name="modify_pwd1"> <br>
				<br> <input
					type="reset" value="다시작성"  class ="nes-btn is-error btnbtn">&nbsp;&nbsp;  <input type="submit" value="제출" class ="nes-btn is-success btnbtn">

			</form>
		</div>
	</div>
	<script type="text/javascript" src="../js/join.js"></script>

</body>

</html>