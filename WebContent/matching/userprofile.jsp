<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:set var="odto" value="${Op}" />
<title>${odto.getMatching_user_id()}님의프로필</title>
</head>
<body>
	<div align="center">
		<hr width="50%" color="marmoon">
		<h3>${odto.getMatching_user_id()}님의프로필</h3>
		<hr width="50%" color="marmoon">

		<table border="1">

				<c:if test="${odto.getGame_name() eq '배틀그라운드' }">
					<img
						src="${pageContext.request.contextPath}/img/assets/BG.jpg">
					
				</c:if>

				<c:if test="${odto.getGame_name() eq '리그오브레전드' }">
					<img
						src="${pageContext.request.contextPath}/img/assets/LOL.png">
					
				</c:if>

				<c:if test="${odto.getGame_name() eq '오버워치' }">
					<img
						src="${pageContext.request.contextPath}/img/assets/OW.jpg">
				</c:if>
			

			<tr>
				<th>닉네임</th>
				<td>${odto.getMatching_user_nikname()}</td>
			</tr>

			<tr>
				<th>디스코드 아이디</th>
				<td>${odto.getDiscord_nikname()}</td>
			</tr>

			<tr>
				<th>카카오톡 아이디</th>
				<td>${odto.getKakao_id()}</td>
			</tr>
			
			<tr>
				<th>채팅방 입장하기</th>
				<td><a href="./chat/chat_room.jsp">채팅방</a></td>
			</tr>

		</table>

	</div>

</body>
</html>