<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="loginCheck" value="0"/>
<c:if test="${!empty sessionScope.LoginCheck}">
    <c:set var="loginCheck" value="${sessionScope.LoginCheck}"/>
</c:if>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
</head>
<body>
		
	<header>
		<div class="main_header_wrap">
			<span id="main_logo_text"><a id="logo_link" href="main.jsp">겜만추</a><i class="snes-jp-logo"></i></span>
		
			<!-- <img id="logo" src="../WebContent/img/thumbup.png" alt=""> -->
			<div class="login_wrap">

				<c:if test="${loginCheck == 0 }">
					<span class="Login"><a href="member/login.jsp" class="nes-text is-primary">Login</a></span>
					<span class="Join"> / <a href="member/join.jsp" class="nes-text is-success">Join</a></span>
 					<i class="fa fa-envelope" aria-hidden="true"></i>
				</c:if>
 
				<c:if test="${loginCheck > 0 }">
					<span class="Login"><a href="member/logout.jsp" class="nes-text is-warning">Logout</a></span>
					<span class="Join"> / <a
						href="<%=request.getContextPath()%>/myPage.do?loginId=${member_id}" class="nes-text is-error">MyPage</a></span>
				    <a href="<%=request.getContextPath()%>/chat.do"><i class="fa fa-envelope" aria-hidden="true"></i></a>
				</c:if>
				
			</div>
		</div>
	</header>

	<nav>
		<ul class="navcolor nes-container">
			<li><a href="<%=request.getContextPath()%>/board_list.do?type=free"
				class="nes-text is-primary">FreeBoard</a></li>
			<li><a href="<%=request.getContextPath()%>/board_list.do?type=legend" class="nes-text is-success">Legend</a></li>
			<li><a href="<%=request.getContextPath()%>/board_list.do?type=notice" class="nes-text is-warning">Notice </a></li>
			<li><a href="<%=request.getContextPath()%>/board_list.do?type=etc" class="nes-text is-error">ETC </a></li>
		</ul>
	</nav>
	
	<div align="center">
		<c:set var="dto" value="${content }"/>
		
		<hr width="50%" color="gray">
			<h3>${dto.getBoard_title() }</h3>
		<hr width="50%" color="gray">
		<br>
		
		<c:if test="${!empty dto }">
			<div>
				<table border="1" cellspacing="0" width="450">
					<tr>
						<th>게사판</th>
						<td>
							<c:if test="${dto.getBoard_type() == 'free' }">자유게시판</c:if>
							<c:if test="${dto.getBoard_type() == 'legend' }">레전드게시판</c:if>
							<c:if test="${dto.getBoard_type() == 'etc' }">ETC</c:if>
						</td>
					</tr>
					<tr>
						<th>머리말</th>
						<td>
							<c:if test="${dto.getBoard_type() == 'free' }">
								<c:if test="${dto.getBoard_heading() == 'humor' }">유머</c:if>
								<c:if test="${dto.getBoard_heading() == 'life' }">일상</c:if>
								<c:if test="${dto.getBoard_heading() == 'info' }">정보</c:if>
								<c:if test="${dto.getBoard_heading() == 'etc1' }">기타</c:if>
							</c:if>
							
							<c:if test="${dto.getBoard_type() == 'legend' }">
								<c:if test="${dto.getBoard_heading() == 'league' }">리그오브레전드</c:if>
								<c:if test="${dto.getBoard_heading() == 'battle' }">배틀그라운드</c:if>
								<c:if test="${dto.getBoard_heading() == 'over' }">오버워치</c:if>
							</c:if>
							
							<c:if test="${dto.getBoard_type() == 'etc' }">
								<c:if test="${dto.getBoard_heading() == 'police' }">신고</c:if>
								<c:if test="${dto.getBoard_heading() == 'etc2' }">기타</c:if>
							</c:if>
						</td>
					</tr>
					<tr>
						<c:if test="${empty dto.getBoard_update() }">
							<th>등록일자</th>
							<td>${dto.getBoard_date() } </td>
						</c:if>

						<c:if test="${!empty dto.getBoard_update() }">
							<th>수정일자</th>
							<td>${dto.getBoard_update() } </td>
						</c:if>
					</tr>
					
					<tr>
						<th>조회수</th>
						<td>${dto.getBoard_hit() }</td>
					</tr>	

					<tr>
						<th>추천수</th>

						<td> <img src="img/thumbup.png" width="30" height="30" id="thumbs" onclick="thumbsClick()"> <span class="thumbs"></span> </td>

					</tr>
					
					<tr>
						<th>글내용</th>
						<td>${dto.getBoard_cont() }</td>
					</tr>
					
					<tr>
						<th>첨부파일</th>
						<c:if test="${!empty dto.getUpload_file() }">
							<td><a href="<%=request.getContextPath() %>/fileUpload/${dto.getUpload_file() }" target="_blank">${dto.getUpload_file() }</a></td>
						</c:if>
						
						<c:if test="${empty dto.getUpload_file() }">
							<td> </td>
						</c:if>
					</tr>
					
				</table>
			</div>
		</c:if>
		

		<%-- 데이터가 없는 경우 --%>
		<c:if test="${empty dto }">
			<span>삭제된 게시물입니다</span>
		</c:if>
		<br>
		
		<input type="button" value="글 수정" 
		onclick="if(${loginCheck } == 0){
						alert('로그인이 필요합니다');
						location.href='member/login.jsp'
					}else {
						location.href='board_modify.do?no=${dto.getBoard_index() }&page=${Page }&type=${dto.getBoard_type() }'
					}">
		<input type="button" value="글 삭제" 
		onclick="if(${loginCheck } == 0){
						alert('로그인이 필요합니다');
						location.href='member/login.jsp'
					}else {
						if(confirm('정말로 삭제하시겠습니까?')) {
							location.href='board_delete.do?no=${dto.getBoard_index() }&page=${Page }&type=${dto.getBoard_type() }'
							}else { retrun;}}">
		<input type="button" value="전체목록" onclick="location.href='board_list.do?type=${dto.getBoard_type() }'">
		<br>
		<br>
		
		<%-- 댓글 폼 --%>
		<div>
	    	<table cellspacing="0" width="400">
	    	   <tr>
	    	      <th>댓글내용</th>
	    	      <td> 
	    	      	<textarea rows="5" cols="40" name="re_content" id="re_content"> </textarea>
	    	      </td>
	    	   </tr>
	    	   
	    	   <tr>
	    	      <td colspan="2" align="right">
	    	         <input type="button" id="replyBtn" value="댓글작성">
	    	      </td>
	    	   </tr>
	    	</table>
	    	<br>
	   		
	   		<h3>댓글 목록</h3>
		    <div class="list"> </div>
		      
	</div>
	
	
	<input type="hidden" id='hidden_nickname' value="${nickname }" />

<script type="text/javascript">

	let member_id = "${member_id }";
	let writer_id = "${dto.getBoard_writer_id() }";
	let nickname = "${nickname }";
	let bno = "${dto.getBoard_index() }";
	let type = "${dto.getBoard_type()}";
	let page = "1";
	
</script>  

	<script type="text/javascript" src="<%=request.getContextPath() %>/js/boardContent.min.js"></script>
		
	<span class="page_link"></span>	
		
	 <jsp:include page="../include/footer.jsp"></jsp:include>

	

</body>
</html>