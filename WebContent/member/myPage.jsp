<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/myPage.css" />

</head>
<body>
    <jsp:include page="../include/header.jsp"></jsp:include>
	<div class="mypage" align="center">
		<c:set var="dto" value="${memCont}" />

		<%-- enctype : 파일을 업로드하기 위한 속성 --%>
		<hr width="40%" color="white">
		<h3>${dto.getMember_nickname() }님의MyPage</h3>
		<hr width="40%" color="white">

		<form method="post" action="<%=request.getContextPath()%>/myPageOk.do"
			enctype="multipart/form-data">

			<input type="hidden" name="id" value="${dto.getMember_id()}">
			<input type="hidden" name="db_pwd" value="${dto.getMember_pwd() }">
			<input type="hidden" name="profile_old"
				value="${dto.getMember_profile()}">
			
			<div class="nes-table-responsive">	
			<table border="1" class="nes-table is-bordered is-dark">
				<tr>
					<th>프로필 사진</th>
					<td><img width="60" height="60"
						src="<%=request.getContextPath()%>/img/join/${dto.getMember_profile()}">
						<input type="file" name="profile_new" value="프로필 이미지 수정">
					</td>
				</tr>
				<tr>
					<th>아이디</th>
					<td>${dto.getMember_id()}</td>
				</tr>
				<tr>
					<th>닉네임</th>
					<td><input type="text" name="name" id="name"  class="nes-input"
						value="${dto.getMember_nickname() }"></td>
				</tr>

				<tr>
					<th>E-Mail</th>
					<td>${dto.getMember_email()}</td>
				</tr>

				<tr>
					<th>포인트</th>
					<td>${dto.getPoint()}</td>
				</tr>
				<tr>
					<th>비밀번호 변경</th>
					<td><input type="password" class="nes-input" name="modify_pwd1" value="${dto.getMember_pwd() }"></td>
				</tr>
				<tr>
					<th>비밀번호 확인</th>
					<td><input type="password" class="nes-input" name="modify_pwd2" value="${dto.getMember_pwd() }"></td>
				</tr>
				<tr>
					<th>현재 비밀번호</th>
					<td><input type="password" class="nes-input" name="curr_pwd"></td>
				</tr>
				<tr>

					<td colspan="4" class="checkgame">&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<label class="game-title">선호 게임</label>
					
					<br>
					
					<label for="lol" class="game1">&nbsp;
					<input type="checkbox" name="lol" value="lol">&nbsp;LOL</label> 
					
					<br> 
					
					<label class="game2" for="battle_ground">&nbsp;
					<input type="checkbox" name="battle_ground" value="battle_ground">&nbsp;Battleground</label>
					
					<br> 
					<label for="overwatch" class="game3">&nbsp;
					<input type="checkbox" name="overwatch" value="overwatch2">&nbsp;OverWatch2</label>
					</td>
				</tr>
				
				<tr>
					<td colspan="4" align="center">
					<input type="submit" class="modify nes-btn is-success" value="정보 수정">&nbsp;&nbsp; 
					<input type="reset" class="rewrite nes-btn is-primary" value="다시작성">&nbsp;&nbsp; 
					<input type="button" class="delete nes-btn is-error" value="탈퇴" 
						onclick="if(confirm('정말로 탈퇴할거죠...?? 정말인거죠?')){location.href='memberDelete.do?loginId=${dto.getMember_id() }&index=${dto.getMember_index() }'}else{return;}"></td>
				</tr>


			</table>
			</div>
		</form>
	</div>
	<jsp:include page="../include/footer.jsp"></jsp:include>

</body>
</html>
