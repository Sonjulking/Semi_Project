<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
<title>Insert title here</title>
</head>
<body>
	<header>
		<div class="main_header_wrap">
			<span id="main_logo_text"><a id="logo_link" href="main.jsp">겜만추</a><i
				class="snes-jp-logo"></i></span>

			<!-- <img id="logo" src="../WebContent/img/thumbup.png" alt=""> -->
			<div class="login_wrap">
				<c:if test="${loginCheck == 0 }">
					<span class="Login"><a href="member/login.jsp"
						class="nes-text is-primary">Login</a></span>
					<span class="Join"> / <a href="member/join.jsp"
						class="nes-text is-success">Join</a></span>
					<i class="fa fa-envelope" aria-hidden="true"></i>
				</c:if>

				<c:if test="${loginCheck > 0 }">
					<c:set var="m_dto" value="${Cont }" />
					<span class="Login"><a href="member/logout.jsp"
						class="nes-text is-warning">Logout</a></span>
					<span class="Join"> / <a
						href="<%=request.getContextPath()%>/myPage.do?loginId=${member_id}"
						class="nes-text is-error">MyPage</a></span>
				</c:if>
			</div>
		</div>
	</header>
	<!-- <img class="kawaii" src="./img/teemo_murshroom.png" /> -->
	<nav>

		<ul class="navcolor nes-container">
			<li><a
				href="<%=request.getContextPath()%>/board_list.do?type=free"
				class="nes-text is-primary"> FreeBoard </a></li>
			<li><img id="murshroom" class="kawaii"
				src="./img/teemo_murshroom.png" /><a
				href="<%=request.getContextPath()%>/board_list.do?type=legend"
				class="nes-text is-success">Legend</a></li>
			<li><i id="coin" class="nes-icon coin is-smallmedium kawaii"></i><a
				href="<%=request.getContextPath()%>/board_list.do?type=notice"
				class="nes-text is-warning">Notice </a></li>
			<li><a
				href="<%=request.getContextPath()%>/board_list.do?type=etc"
				class="nes-text is-error">ETC </a></li>
		</ul>
	</nav>


	<script>
		$(document).ready(function() {
			$('nav ul li:nth-child(3)').hover(function() {
				$('#coin').fadeIn();
			}, function() {
				$('#coin').fadeOut();
			});

			$('nav ul li:nth-child(2)').hover(function() {
				$('#murshroom').fadeIn();
			}, function() {
				$('#murshroom').fadeOut();
			});

		});
	</script>
</body>
</html>
