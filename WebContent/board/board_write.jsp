<%@page import="org.apache.tomcat.util.net.AprEndpoint.Sendfile"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="loginCheck" value="0" />
<c:if test="${!empty sessionScope.LoginCheck }">
	<c:set var="loginCheck" value="${sessionScope.LoginCheck }" />
</c:if>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성 페이지</title>
<!-- <!-- JQuery 라이브러리 CDN -->
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@3.4.1/dist/css/bootstrap.min.css"
	integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu"
	crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@3.4.1/dist/css/bootstrap-theme.min.css"
	integrity="sha384-6pzBo3FDv/PJ8r2KRkGHifhEocL+1X2rVCTTkUfGk7/0pbek5mMa1upzvWbrUbOZ"
	crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@3.4.1/dist/js/bootstrap.min.js"
	integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd"
	crossorigin="anonymous"></script>


<style>
.wrtie-con {
	width: 1300px;
}

.write-center {
	display: flex;
	justify-content: center;
}

textarea {
	color: #212529;
	border: 2px solid aliceblue;
	border-radius: 5px;
	background: #ccc;
	border: 2px solid aliceblue;
}

#press-start {
	justify-content: center; width : 525px;
	height: 104px;
	width: 272px;
}
</style>

</head>
<body>

	<%@ include file="../include/header.jsp"%>

	<div style="text-align: center;">
		<img id="press-start"
			src="${pageContext.request.contextPath}/img/assets/press2.gif">
	</div>
	<div class="write-center">

		<div align="center" class="wrtie-con nes-container is-dark with-title">


			<%-- enctype : 파일을 업로드하기 위한 속성, 값: --%>
			<form method="post" enctype="multipart/form-data" name="f"
				action="<%=request.getContextPath()%>/board_write_ok.do"
				onsubmit="return check()">
				<input type="hidden" name="board_writer_id" value="${member_id }">
				<input type="hidden" name="board_writer_nickname"
					value="${nickname }">



				<!-- 		<div style="display: inline-block;"
				style="background-color: #212529;  width: calc(5% + 8px)">
				<div class="nes-select is-dark">
					<select name="field" id="dark_select">
						<option value="board_title">제목</option>
						<option value="board_cont">내용</option>
						<option value="board_title_cont">제목+내용</option>
						<option value="board_writer_nickname">작성자</option>
					</select>
				</div>
			</div>
 -->

				<div style="display: inline-block;"
					style="background-color: #212529;  width: calc(5% + 8px);">
					<div class="nes-select is-dark">
						<select name="board_type" id="board_type">
							<option value="" hidden>게시판선택</option>
							<option value="free">자유</option>
							<option value="legend">레전드</option>
							<option value="etc">ETC</option>
						</select>
					</div>
				</div>
				&nbsp;
				<div style="display: inline-block;"
					style="background-color: #212529;  width: calc(5% + 8px)">
					<div class="nes-select is-dark">
						<select name="board_heading" id="board_heading">
							<option value="" hidden>말머리선택</option>

							<option class="board_heading1" value="humor">유머</option>
							<option class="board_heading1" value="life">일상</option>
							<option class="board_heading1" value="info">정보</option>
							<option class="board_heading1" value="etc1">기타</option>

							<option class="board_heading2" value="league">LOL</option>
							<option class="board_heading2" value="battle">배틀그라운드</option>
							<option class="board_heading2" value="over">오버워치2</option>

							<option class="board_heading3" value="police">신고</option>
							<option class="board_heading3" value="etc2">기타</option>
						</select>
					</div>
				</div>
				<!-- 			<div style="display: inline-block; background-color: #212529;"
				class="nes-field is-inline">
				<input style="width: 300px;" type="text" name="keyword"
					id="dark_field" class="nes-input is-dark">
			</div> -->
				&nbsp;
				<div
					style="display: inline-block; background-color: #212529; width: 700px;"
					class="nes-field is-inline">
					<input type="text" name="board_title" placeholder="제목을 입력해주세요"
						id="dark_field" class="nes-input is-dark">
				</div>
				<br> <br>

				<textarea rows="20" cols="130" name="board_cont"></textarea>
				<br><br>
		
				<input type="file" name="upload_file"> <br> <input class="nes-btn is-warning" type="button"
					value="취소"
					onclick="if(confirm('정말로 취소하시겠습니까?'))
					                                   {location.href='board_write.do'
														}else {return; }">
				<input type="submit" class="nes-btn is-primary" value="글쓰기">&nbsp;



			</form>
			<br>
		</div>
	</div>
	
	<%@ include file="../include/footer.jsp"%>
	
	<script type="text/javascript" src="<%=request.getContextPath() %>/js/board_write.js"> </script>
	
</body>
</html>