<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매칭 대기중...</title>

<script src="https://code.jquery.com/jquery-3.6.3.js"></script>

<link href="https://unpkg.com/nes.css@latest/css/nes.min.css"
	rel="stylesheet" />


<style type="text/css">
@charset "UTF-8";

@font-face {
	font-family: "pixel"; /* 사용하고 싶은 font-family명을 지정 */
	src: url("./css/font/neodgm.woff") format("opentype"); /* 폰트파일 불러오기 */
}

#cancel-btn2 {
	visibility: hidden;
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
	font-family: "pixel", sans-serif;
}

#img {
	margin-left: 110px;
	width: 150px;
	animation: rotation 3s linear infinite;
}
@keyframes rotation {
    100% {
        transform: rotate(360deg);
    }
}
#cancel-btn1 {
	margin-left: 133px;
}
h2 {
	margin-left: 100px;
	font-family: "pixel", sans-serif;
}
</style>

</head>

<body onload="autoClick()">

		<form method="post" name="f" id="check" class="nes-container is-rounded">
			<c:set var="dto" value="${Cont }" />
			<input type="hidden" name="id" value="${dto.getMember_id() }">


			<%-- 새로운 세션 만들어야함 --%>
			<c:set var="mdto" value="${Match }" />
			<input type="hidden" name="gamename" value="${mdto.getGame_name() }">
			<input type="hidden" name="tier" value="${mdto.getTier() }">
			<input type="hidden" name="matched" value="${mdto.getMatched() }">
			
				<br>
				<br>
				<br>
			
				<img id="img" src="${pageContext.request.contextPath}/img/assets/timo_R.jpg"> 
				<br>
				<br>
				<br>
				<br>
				<br>
					<h2>로딩중입니다....</h2>
				<br>
				<br>
				<br>
				<br>
				<br>
					
				<input type="submit"
					id="cancel-btn1" value="매칭취소" class="nes-btn is-error"
					onclick="alert('매칭이 취소되었습니다.')"
					formaction="<%=request.getContextPath()%>/matchingdelete_ok.do">
					
				<input type="submit" id="cancel-btn2" value="매칭취소"
					onclick="alert('조건에 맞는 유저가 없어서 매칭이 취소되었습니다.')"
					formaction="<%=request.getContextPath()%>/matchingdelete_ok.do">
			
		</form>


	<script type="text/javascript">
		// 로딩 화면 보이기
		function showLoading() {
			var loadingWrapper = document.querySelector('.loading-wrapper');
			loadingWrapper.style.display = 'flex';
		}

		// 로딩 화면 숨기기
		function hideLoading() {
			var loadingWrapper = document.querySelector('.loading-wrapper');
			loadingWrapper.style.display = 'none';
		}

		// 취소 버튼 클릭 시 이벤트 핸들러
		function onCancel() {
			// 취소 버튼 클릭 시 수행할 작업을 여기에 추가합니다.
			hideLoading(); // 예시로, 로딩 화면을 숨기는 함수를 호출합니다.
		}

		// 취소 버튼에 이벤트 핸들러 추가
		var cancelBtn = document.querySelector('#cancel-btn1');
		cancelBtn.addEventListener('click', onCancel);

		// 자동 취소 버튼에 이벤트 핸들러 추가
		var cancelBtn = document.querySelector('#cancel-btn2');
		cancelBtn.addEventListener('click', onCancel);

		// 5초마다 매칭 조건 검색하여 매칭 돌리기
		let playmatching = setInterval(function() {

			$.ajax({
				type : "post",
				url : "./matching/matchingCheck.jsp",
				data : $('#check').serialize(),
				datatype : "jsp",
				success : function(data) {
					if (data == 1) { // 나중에 alert는 삭제해도 될듯하다. 유저가 많으면 검색을 더 많이해야하니 매칭 주기를 1.5초 정도로 줄이는게 좋아보임
						alert("매칭잡힘!" + data);
						location.href = "./matching/matchingYesOrNo.jsp";
					} else {
						alert("매칭안잡힘!" + data);
					}
				},

				error : function(data) {
					console.log("데이터 오류");
				}
			});

		}, 15000);

		// 여기에 매칭 안잡힐시 매칭취소버튼 자동클릭 넣으면 될듯?
		// 30초 후에 () 함수를 호출하여 setInterval() 함수를 종료시킴.
		setTimeout(function() {

			clearInterval(playmatching);
		}, 35000);

		function autoClick() {
			setTimeout(function() {
				document.getElementById("cancel-btn2").click();
			}, 40000); // 40초 후에 자동 클릭
		}
	</script>

</body>
</html>