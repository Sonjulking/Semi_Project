<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>아이디 찾기</title>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://unpkg.com/nes.css@latest/css/nes.min.css"
	rel="stylesheet" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/join.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/findpw.css" />


</head>
<body>
	<form method="post" action="<%=request.getContextPath()%>/find_id.do">

		<div class="container1">
			<span class="title"><a href="../main.jsp">겜만추</a><img
				id="pixeldva"
				src="${pageContext.request.contextPath}/img/assets/pixeldva.png">
			</span> <br> <br> <span class="text1">겜만추에서 수 많은 사람들과
				플레이하고,</span> <span class="text1">레전드 순간을 함께하세요!</span>
		</div>

		<div
			class="pw-con nes-container with-title is-rounded is-dark join-con2">
			<p class="title join-text">아이디 찾기</p>

			<div style="text-align: center;">
				<label for="id_find">이메일 </label><br>
				<input type="text" id="id_find" name="id_find"
					placeholder="이메일을 입력하세요."><br>
				<br>


				<button style="width: 200px; height: 50px;"
					class="login nes-btn is-success" type="submit" onsubmit="check()">이메일
					전송</button>

				<p class="lostpwd">
					<a href="/Semi_Project/member/findPwd.jsp">비밀번호를 잊으셨나요?</a>
				</p>
			</div>
		</div>

	</form>

	<script type="text/javascript">
 
    function check() {
    	$.ajax({
			ContentType: "application/x-www-form-urlencoded; charset=UTF-8",
			type: "post",
			url: "/Semi_Project/find_id.do",
			data: { id: $("#id_find").val() }, /*키 : 밸류 */
			datatype: "text",
			success: function(data) {
				if (id == "") {
					// set the response data to an element in the DOM
					alert("이메일을 입력해 주세요");
					location.href='history.back()';
					
				} 
			},

			error : {
				alert("데이터 통신 오류입니다.");
				isChecked = false;

			}
		});
    }
 
 </script>

</body>

</html>