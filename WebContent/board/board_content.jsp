<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="loginCheck" value="0" />
<c:if test="${!empty sessionScope.LoginCheck}">
	<c:set var="loginCheck" value="${sessionScope.LoginCheck}" />
</c:if>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/board_content.css" />

</head>
<body>

	<%@ include file="../include/header.jsp"%>
	
	<div class="jungmax" align="center">
		<div class="content nes-container is-dark with-title">
			<c:set var="dto" value="${content }" />
			<c:set var="mdto" value="${Cont }"/>


			<c:if test="${!empty dto }">
				<div align="center">

					<header>
						<%-- 게시판 종류 --%>
						<h3>
							<c:if test="${dto.getBoard_type() == 'free' }">자유게시판</c:if>
							<c:if test="${dto.getBoard_type() == 'legend' }">레전드게시판</c:if>
							<c:if test="${dto.getBoard_type() == 'etc' }">ETC</c:if>
						</h3>

						<hr width="40%" color="white">

						<%-- 글제목 --%>
						<h1>${dto.getBoard_title() }</h1>

                        <h6>${dto.getBoard_writer_nickname() }</h6>

						<%-- 머리말 --%>
						<div class="info">
							<span> <c:if test="${dto.getBoard_type() == 'free' }">
									<c:if test="${dto.getBoard_heading() == 'humor' }">유머</c:if>
									<c:if test="${dto.getBoard_heading() == 'life' }">일상</c:if>
									<c:if test="${dto.getBoard_heading() == 'info' }">정보</c:if>
									<c:if test="${dto.getBoard_heading() == 'etc1' }">기타</c:if>
								</c:if> <c:if test="${dto.getBoard_type() == 'legend' }">
									<c:if test="${dto.getBoard_heading() == 'league' }">리그오브레전드</c:if>
									<c:if test="${dto.getBoard_heading() == 'battle' }">배틀그라운드</c:if>
									<c:if test="${dto.getBoard_heading() == 'over' }">오버워치</c:if>
								</c:if> <c:if test="${dto.getBoard_type() == 'etc' }">
									<c:if test="${dto.getBoard_heading() == 'police' }">신고</c:if>
									<c:if test="${dto.getBoard_heading() == 'etc2' }">기타</c:if>
								</c:if>
							</span>

							<%-- 작성일자 --%>
							<span> <c:if test="${empty dto.getBoard_update() }">
							${dto.getBoard_date().substring(0, 10) }
						</c:if> <c:if test="${!empty dto.getBoard_update() }">
							${dto.getBoard_update().substring(0, 10) }
						</c:if>
							</span>

							<%-- 조회수 --%>
							<span>조회수: ${dto.getBoard_hit() }</span> 
							
							<%-- 추천수  티모따봉, 람머스 따봉 중에 고르셈--%>
							<span>추천수: 
								<img src="./img/assets/timoDDa.jpeg" width="30" height="30" id="thumbs"
								onclick="thumbsClick()"> <span class="thumbs"></span>
							</span>

						</div>
					</header>


					<div class="text nes-container with-title is-centered">
							<%-- 글내용 --%>
							${dto.getBoard_cont() }
 					</div>

					<br>
					
					<div>
							<%-- 첨부파일 --%>
						<span>첨부 파일 : 
						<c:if test="${!empty dto.getUpload_file() }">
							<span>
							<a href="<%=request.getContextPath() %>/fileUpload/${dto.getUpload_file() }"
									target="_blank">${dto.getUpload_file() }</a> </span>
							</c:if> 
							<c:if test="${empty dto.getUpload_file() }">
								<span> </span>
							</c:if>

						</span>

					</div>
					
					
				</div>

			</c:if>
			
			<%-- 데이터가 없는 경우 --%>
			<c:if test="${empty dto }">
				<span>삭제된 게시물입니다</span>
			</c:if>
			
			
			
	<br>
	<br>

	<div align="center">
		<input type="button" class="modify nes-btn is-success" value="글 수정"
			onclick="location.href='board_modify.do?no=${dto.getBoard_index() }&page=${Page }&type=${dto.getBoard_type() }'">&nbsp;&nbsp;
		<input type="button" class="delete nes-btn is-error" value="글 삭제"
			onclick="if(confirm('정말로 삭제하시겠습니까?')) {
															location.href='board_delete.do?no=${dto.getBoard_index() }&page=${Page }&type=${dto.getBoard_type() }'
														}else { retrun; }">&nbsp;&nbsp;
		<input type="button" class="list nes-btn is-primary" value="전체목록"
			onclick="location.href='board_list.do?type=${dto.getBoard_type() }'">
	</div>

	<br>
	<br>

	<%-- 댓글 폼 --%>
	<div align="center">
		<table cellspacing="0" width="400">
			<tr>
				<th class="txt1">댓글내용</th>
				<td><textarea rows="5" cols="40" name="re_content"
						id="re_content"> </textarea></td>
			</tr>

			<tr>
				<td colspan="2">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<span>댓글수 : <span class="commentCount"></span> </span>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;
				<input type="button" class="write nes-btn is-success" id="replyBtn" value="댓글작성">
				</td>
			</tr>
		</table>
		<br>

		<div class="list"></div>

	</div>


	<input type="hidden" id='hidden_nickname' value="${nickname }" />

	<script type="text/javascript">
		let member_id = "${member_id }";
		let writer_id = "${dto.getBoard_writer_id() }";
		let nickname = "${nickname }";
		let bno = "${dto.getBoard_index() }";
		let type = "${dto.getBoard_type()}";
	</script>

	<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/boardContent.min.js"></script>

	<span class="page_link"></span>

	<jsp:include page="../include/footer.jsp"></jsp:include>



</body>
</html>