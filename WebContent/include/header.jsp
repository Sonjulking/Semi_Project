<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.1.js"></script>
<!-- fontawesome cdn -->
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
<link href="https://unpkg.com/nes.css@latest/css/nes.min.css"
	rel="stylesheet" />

<link rel="stylesheet" href="css/main.css" />
<link rel="stylesheet" href="css/nav.css " />
<title>Insert title here</title>
</head>
<body>
	<header>
		<div class="main_header_wrap">
			<span
				id="main_logo_text"><a id="logo_link" href="main.jsp">겜만추</a><i
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
			<li><img id="jinx" class="kawaii" src="./img/assets/jinx.png" /><a
				href="<%=request.getContextPath()%>/board_list.do?type=free"
				class="nes-text is-primary"> FreeBoard</a></li>
			<li><img id="teemo" class="kawaii" src="./img/assets/teemo.png" /><a
				href="<%=request.getContextPath()%>/board_list.do?type=legend"
				class="nes-text is-success">Legend</a></li>
			<li><img id="lux" class="kawaii" src="./img/assets/lux.png" /><a
				href="<%=request.getContextPath()%>/board_list.do?type=notice"
				class="nes-text is-warning">Notice</a></li>
			<li><img id="bie" class="kawaii" src="./img/assets/bie.png" /><a
				href="<%=request.getContextPath()%>/board_list.do?type=etc"
				class="nes-text is-error">ETC</a></li>
		</ul>
	</nav>



</body>
</html>
