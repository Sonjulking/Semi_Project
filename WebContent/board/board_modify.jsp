<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="loginCheck" value="0"/>
<c:if test="${!empty sessionScope.LoginCheck }">
    <c:set var="loginCheck" value="${sessionScope.LoginCheck }"/>
</c:if>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정 페이지</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/board_modify.css" />

<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/board_modify.js"></script>
</head>
<body>

		<%@ include file="../include/header.jsp"%>
		
	<div class="total" align="center">
		<c:set var="dto" value="${Modify }"/>
		
		<br>
			<h2>게시글 수정 페이지</h2>
		<br>
		
		<form method="post" enctype="multipart/form-data" name="f" action="<%=request.getContextPath() %>/board_modify_ok.do?no=${dto.getBoard_index() }&old_type=${old_type }" onsubmit="return check()">
		<input type="hidden" name="num" value="${dto.getBoard_index() }">
		<input type="hidden" name="page" value="${Page }">
		
			<table class="nes-table is-bordered is-dark my-table" border="1" cellspacing="0">
				<tr>
					<th class ="my-th-1">게시판종류</th>
					
					<td>
						<select name="type" id="board_type">
						  	<c:if test="${dto.getBoard_type() == 'free'}">
						   	 	<option value="free" selected>자유게시판</option>
						    	<option value="legend">레전드게시판</option>
						    	<option value="etc">ETC</option>
						  	</c:if>
						 	<c:if test="${dto.getBoard_type() == 'legend'}">
						 		<option value="legend" selected>레전드게시판</option>
						    	<option value="free">자유게시판</option>
						    	<option value="etc">ETC</option>
						  </c:if>
						  	<c:if test="${dto.getBoard_type() == 'etc'}">
						  		<option value="etc" selected>ETC</option>
						    	<option value="free">자유게시판</option>
						    	<option value="legend">레전드게시판</option>
						  	</c:if>
						  	
						</select>
					</td>
				</tr>
				
				<tr>
					<th>머릿말</th>
					<td>
						<select name="heading" id="heading">
							<option class="board_heading" value="" hidden>말머리를 선택하세요</option>
								
							<option class="board_heading1" value="humor" ${dto.getBoard_heading() == 'humor' ? 'selected' : ''}>유머</option>
							<option class="board_heading1" value="life" ${dto.getBoard_heading() == 'life' ? 'selected' : ''}>일상</option>
							<option class="board_heading1" value="info" ${dto.getBoard_heading() == 'info' ? 'selected' : ''}>정보</option>
							<option class="board_heading1" value="etc1" ${dto.getBoard_heading() == 'etc1' ? 'selected' : ''}>기타</option>
							
							<option class="board_heading2" value="league" ${dto.getBoard_heading() == 'league' ? 'selected' : ''}>리그오브레전드</option>
							<option class="board_heading2" value="battle" ${dto.getBoard_heading() == 'battle' ? 'selected' : ''}>배틀그라운드</option>
							<option class="board_heading2" value="over" ${dto.getBoard_heading() == 'over' ? 'selected' : ''}>오버워치2</option>
							
							<option class="board_heading3" value="police" ${dto.getBoard_heading() == 'police' ? 'selected' : ''}>신고</option>
							<option class="board_heading3" value="etc2" ${dto.getBoard_heading() == 'etc2' ? 'selected' : ''}>기타</option>
						</select>
					</td>
				</tr>
				
				<tr>
					<th>글 작성자</th>
					<td><input type="text" name="writer_nickname" value="${dto.getBoard_writer_nickname() }" readonly></td>
				</tr>
				<tr>
					<th>글 제목</th>
					<td><input type="text" name="title" value="${dto.getBoard_title() }"></td>
				</tr>
				<tr>
					<th>글 내용</th>
					<td><textarea class="textcontent" rows="7" cols="25" name="cont">${dto.getBoard_cont() }</textarea>
				</tr>

				<tr>
					<th>첨부파일</th>
					<td> 
						<img src="<%=request.getContextPath() %>/img${dto.getUpload_file() }" alt="등록된 파일이 없습니다." width="120" height="120" border="0"> 
						<input type="file" name="new_file">
	            	
					</td>
				</tr>
				
				<tr>
					<td colspan="2" align="center">
						<input type="submit" class="modify nes-btn is-success" value="수정완료">&nbsp;
						<input type="reset" class="delete nes-btn is-error" value="초기화">
					</td>
				</tr>
				
			</table>
			<br>
		</form>
	</div>
</body>
</html>