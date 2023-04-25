<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>아이디 찾기</title>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- fontawesome cdn -->
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" href="../css/login.css" />

</head>
<body>
    <form method="post"
		action="<%=request.getContextPath()%>/find_id.do">

		<div class="container1">
			<span class="title">겜만추&nbsp;<i class="fa fa-thumbs-o-up"
				aria-hidden="true"></i></span> <br> <br> <span class="text1">겜만추에서
				수 많은 사람들과 플레이하고,</span> <span class="text1">레전드 순간을 함께하세요!</span>
		</div>

		<div class="container2">
			<h2>아이디 찾기</h2>


			<label for="id_find">아이디 찾기</label><input type="text" id="id_find" name="id_find" placeholder="이메일을 입력하세요">  <a href=""> <i
				id="site-face" class="fa fa-facebook-square" aria-hidden="true"></i>
			</a> <a href=""> <i id="site-goo" class="fa fa-google-plus-square"
				aria-hidden="true"></i>
			</a>


			<button class="login" type="submit" onsubmit="check()">이메일 받기</button>

			<h6 class="lostpwd">
				<a href="/Semi_Project/member/findPwd.jsp">비밀번호를 잊으셨나요?</a>
			</h6>

			<a href="/Semi_Project/member/join.jsp"><button class="signup" type="button">회원가입</button></a>


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