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

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/board.css" />
</head>
<body>

	<%@ include file="../include/header.jsp"%>

	<div align="center">
		<br>
		<h1>
			<img id="bgcat"
				src="${pageContext.request.contextPath}/img/assets/bgcat.gif">&nbsp;Notice
			Board
		</h1>

		<br>
		<div>
			<table class="board-main" cellspacing="0" width="1200px">


				<thead>
					<tr>
						<td colspan="7" align="right">전체 게시물 수 : ${totalRecord } 개</td>
					</tr>
					<tr>
						<th>No.</th>
						<th>머릿말</th>
						<th>제목</th>
						<th>글쓴이</th>
						<th>조회수</th>
						<th>추천수</th>
						<th>작성일자</th>
					</tr>
				</thead>
				<c:set var="list" value="${List }" />
				<c:if test="${!empty list }">
					<c:forEach items="${list }" var="dto">
						<c:if test="${dto.getBoard_type().equals('notice') }">

							<tr>
								<td>${dto.getBoard_index() }</td>
								<td> <c:if test="${dto.getBoard_heading() == '공지' }">공지</c:if> </td>
								<td class="board-title"><a
									href="<%=request.getContextPath()%>/board_content.do?no=${dto.getBoard_index() }&page=${page }&type=${dto.getBoard_type()}">${dto.getBoard_title() }</a>
								</td>
								<td>${dto.getBoard_writer_nickname() }</td>
								<td>${dto.getBoard_hit() }</td>
								<td>${dto.getBoard_thumbs() }</td>
								<td>${dto.getBoard_date().substring(0, 10) }</td>
							</tr>
						</c:if>
					</c:forEach>
				</c:if>
				<c:if test="${empty list }">
					<tr>
						<td colspan="6" align="center">
							<h3>검색된 결과가 없습니다...</h3>
						</td>
					<tr>
				</c:if>
			</table>
		</div>

		<br> <br>



		<form method="post"
			action="<%=request.getContextPath()%>/board_search.do?type=legend">
			<input type="hidden" name="page" value="${page }">
			<div style="display: inline-block;"
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
			<div style="display: inline-block; background-color: #212529;"
				class="nes-field is-inline">
				<input style="width: 300px;" type="text" name="keyword"
					id="dark_field" class="nes-input is-dark">
			</div>
			&nbsp;&nbsp;<input style="margin-bottom: 10px;" type="submit"
				class="nes-btn is-success" value="검색">
		</form>
		<br>	
		
		<br>
		<br>
		
		<%-- 페이징 처리 영역 --%>
		<nav>
			<ul class="pagination">
				<c:if test="${page != 1 }">
					<li class="page-item"><a class="page-link"
						href="${check }page=1&type=notice"><<</a></li>
				<li><a class="page-link"
					href="${check }page=${page -1}&type=notice"><</a></li>
				</c:if>

				<c:forEach begin="${startBlock }" end="${endBlock }" var="i">
					<c:if test="${i == page }">
						<li class="page-item active" aria-current="page"><a
							class="page-link pbt" href="${check }page=${i }&type=notice">${i }</a></li>
					</c:if>

					<c:if test="${i != page }">
						<li class="page-item nump"><a class="page-link"
							href="${check }page=${i }&type=notice">${i }</a></li>
					</c:if>
				</c:forEach>

				<c:if test="${page != allPage }">
					<li class="page-item pbt"><a class="page-link"
						href="${check }page=${page + 1 }&type=notice">></a></li>

				<li class="page-item pbt"><a class="page-link"
					href="${check }page=${allPage }&type=notice">>></a></li>
				</c:if>
			</ul>
		</nav>
	</div>
	<%@ include file="../include/footer.jsp"%>

</body>
</html>