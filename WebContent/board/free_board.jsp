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
		<h1>Free Board</h1>

		<br>
		<table border="1" cellspacing="0" width="1000">

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
			<c:set var="list" value="${List }" />
			<c:if test="${!empty list }">
				<c:forEach items="${list }" var="dto">
					<c:if test="${dto.getBoard_type().equals('free') }">

						<tr>
							<td>${dto.getBoard_index() }</td>
							<td><c:if test="${dto.getBoard_heading() == 'humor' }">유머</c:if>
								<c:if test="${dto.getBoard_heading() == 'life' }">일상</c:if> <c:if
									test="${dto.getBoard_heading() == 'info' }">정보</c:if> <c:if
									test="${dto.getBoard_heading() == 'etc1' }">기타</c:if></td>
							<td><a
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

		<br>

		<form method="post"
			action="<%=request.getContextPath()%>/board_search.do?type=free">
			<input type="hidden" name="page" value="${page }"> <select
				name="field">
				<option value="board_title">제목</option>
				<option value="board_cont">내용</option>
				<option value="board_title_cont">제목+내용</option>
				<option value="board_writer_nickname">작성자</option>
			</select> <input type="text" name="keyword">&nbsp;&nbsp; <input
				type="submit" value="검색">
		</form>
		<br>
		<br> <input type="button" value="게시글 작성"
			onclick="location.href='board_write.do'"> <br> <br>

		<%-- 페이징 처리 영역 --%>
		<nav>
			<ul class="pagination">
				<li class="page-item"><a class="page-link"
					href="${check }page=1">First</a></li>
				<li><a class="page-link" href="${check }page=${page -1 }">Previous</a>
				</li>

				<c:forEach begin="${startBlock }" end="${endBlock }" var="i">
					<c:if test="${i == page }">
						<li class="page-item active" aria-current="page"><a
							class="page-link" href="${check }page=${i }">${i }</a></li>
					</c:if>

					<c:if test="${i != page }">
						<li class="page-item"><a class="page-link"
							href="${check }page=${i }">${i }</a></li>
					</c:if>
				</c:forEach>

				<c:if test="${endBlock < allPage }">
					<li class="page-item"><a class="page-link"
						href="${check }page=${page + 1 }">Next</a></li>

					<li class="page-item"><a class="page-link"
						href="${check }page=${allPage }">End</a></li>
				</c:if>
			</ul>
		</nav>
	</div>
	<%@ include file="../include/footer.jsp"%>

</body>
</html>