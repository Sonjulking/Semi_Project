<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="loginCheck" value="0" />
<c:if test="${!empty sessionScope.LoginCheck}">
	<c:set var="loginCheck" value="${sessionScope.LoginCheck}" />
</c:if>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>겜만추</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script src="https://code.jquery.com/jquery-3.6.3.js"
	integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM="
	crossorigin="anonymous"></script>

<!-- fontawesome cdn -->
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
<link href="https://unpkg.com/nes.css@latest/css/nes.min.css"
	rel="stylesheet" />

<link rel="stylesheet" href="css/main.css" />
<link rel="stylesheet" href="css/nav.css " />
</head>


<body>

	<%@ include file="include/header.jsp"%>

	<div class="main_wrap">
		<!-- <img class="ruru" src="img/rurupixel.png" alt="" title="귀여운 루루">
      <img class="nar" src="img/nar.png" alt="" title="포악한 나르"> <img
         class="timo" src="img/timo.png" alt="" title="혐모"> <img
         class="youme" src="img/youme.png" alt="" title="버스충 유미"> -->




		<div
			class="pop_post_wrap main_box1 nes-container is-rounded is-dark with-title is-centered">

			<form id="myForm" method="post"
				action="<%=request.getContextPath()%>/hot_hit1.do">
				<input type="hidden" name="hot_hit1" value="hot_hit1">
			</form>
			
			<c:set var="freeHit" value="${free1Hit }" />
			<c:set var="freeHitComment" value="${free1HitComment }" />

			<p class="box_text title">실시간 인기글</p>

				<c:if test="${!empty freeHit }">

			<img id="bmo" src="./img/assets/bmo.png"> <a
				href="<%=request.getContextPath() %>/board_content_main.do?type=${freeHit.getBoard_type()}&no=${freeHit.getBoard_index() }">

					<div class="item nes-container is-rounded is-dark">
						<div class="ranking">1</div>
						<img src="${freeHit.getUpload_file() }" class="sumimg" />
						<div class="title_con">
							<div class="item-title">${freeHit.getBoard_title() }</div>
							<div class="date_writer_con">
								<div class="date">
									<c:if test="${empty freeHit.getBoard_update() }">
                  ${freeHit.getBoard_date() } 
               </c:if>

									<c:if test="${!empty freeHit.getBoard_update() }">
                  ${freeHit.getBoard_update() }
               </c:if>
								</div>
								<div class="writer">${freeHit.getBoard_writer_nickname() }</div>
							</div>
						</div>
						<div class="comment">[${freeHitComment }]</div>
					</div>
			</a>
			</c:if>
			
			<c:if test="${empty freeHit }">
				<div class="item nes-container is-rounded is-dark">
					<div class="ranking">1</div>
					<img src="" class="sumimg" />
					<div class="title_con">
						<div class="item-title">야스오 강의</div>
						<div class="date_writer_con">
							<div class="date">2023-09-16</div>
							<div class="writer">실버 판테온</div>
						</div>
					</div>
					<div class="comment">[65]</div>
				</div>
			</c:if>
			

			<c:set var="freeThumbs" value="${free1Thumbs }" />
			<c:set var="freeThumbsComment" value="${free1ThumbsComment }" />
			<c:if test="${!empty freeThumbs }">
				<a
					href="<%=request.getContextPath() %>/board_content_main.do?type=${freeThumbs.getBoard_type()}&no=${freeThumbs.getBoard_index() }">

					<div class="item nes-container is-rounded is-dark">
						<div class="ranking">2</div>
						<img src="${freeThumbs.getUpload_file() }" class="sumimg" />
						<div class="title_con">
							<div class="item-title">${freeThumbs.getBoard_title() }</div>
							<div class="date_writer_con">
								<div class="date">
									<c:if test="${empty freeThumbs.getBoard_update() }">
                  ${freeThumbs.getBoard_date() } 
               </c:if>

									<c:if test="${!empty freeThumbs.getBoard_update() }">
                  ${freeThumbs.getBoard_update() }
               </c:if>
								</div>
								<div class="writer">${freeThumbs.getBoard_writer_nickname() }</div>
							</div>
						</div>
						<div class="comment">[${freeThumbsComment }]</div>
					</div>
				</a>
			</c:if>



			<c:if test="${empty freeThumbs }">
				<div class="item nes-container is-rounded is-dark">
					<div class="ranking">2</div>
					<img src="" class="sumimg" />
					<div class="title_con">
						<div class="item-title">야스오 강의</div>
						<div class="date_writer_con">
							<div class="date">2023-09-16</div>
							<div class="writer">실버 판테온</div>
						</div>
					</div>
					<div class="comment">[65]</div>
				</div>
			</c:if>


			<c:set var="legendHit" value="${legend1Hit }" />
			<c:set var="legendHitComment" value="${legend1HitComment }" />
			<c:if test="${!empty legendHit }">
				<a
					href="<%=request.getContextPath() %>/board_content_main.do?type=${legendHit.getBoard_type()}&no=${legendHit.getBoard_index() }">
					<div class="item nes-container is-rounded is-dark">
						<div class="ranking">3</div>
						<img src="${legendHit.getUpload_file() }" class="sumimg" />
						<div class="title_con">
							<div class="item-title">${legendHit.getBoard_title() }</div>
							<div class="date_writer_con">
								<div class="date">
									<c:if test="${empty legendHit.getBoard_update() }">
                  ${legendHit.getBoard_date() } 
               </c:if>

									<c:if test="${!empty legendHit.getBoard_update() }">
                  ${legendHit.getBoard_update() }
               </c:if>
								</div>
								<div class="writer">${legendHit.getBoard_writer_nickname() }</div>
							</div>
						</div>
						<div class="comment">[${legendHitComment }]</div>
					</div>
				</a>
			</c:if>

			<c:if test="${empty legendHit }">
				<div class="item nes-container is-rounded is-dark">
					<div class="ranking">3</div>
					<img src="" class="sumimg" />
					<div class="title_con">
						<div class="item-title">야스오 강의</div>
						<div class="date_writer_con">
							<div class="date">2023-09-16</div>
							<div class="writer">실버 판테온</div>
						</div>
					</div>
					<div class="comment">[65]</div>
				</div>
			</c:if>

			<c:set var="legendThumbs" value="${legend1Thumbs }" />
			<c:set var="legendThumbsComment" value="${legend1ThumbsComment }" />
			<c:if test="${!empty legendThumbs }">
				<a
					href="<%=request.getContextPath() %>/board_content_main.do?type=${legendThumbs.getBoard_type()}&no=${legendThumbs.getBoard_index() }">
					<div class="item nes-container is-rounded is-dark">
						<div class="ranking">4</div>
						<img src="${legendThumbs.getUpload_file() }" class="sumimg" />
						<div class="title_con">
							<div class="item-title">${legendThumbs.getBoard_title() }</div>
							<div class="date_writer_con">
								<div class="date">
									<c:if test="${empty legendThumbs.getBoard_update() }">
                  ${legendThumbs.getBoard_date() } 
               </c:if>

									<c:if test="${!empty legendThumbs.getBoard_update() }">
                  ${legendThumbs.getBoard_update() }
               </c:if>
								</div>
								<div class="writer">${legendThumbs.getBoard_writer_nickname() }</div>
							</div>
						</div>
						<div class="comment">[${legendThumbsComment }]</div>
					</div>
				</a>
			</c:if>

			<c:if test="${empty legendThumbs }">
				<div class="item nes-container is-rounded is-dark">
					<div class="ranking">4</div>
					<img src="" class="sumimg" />
					<div class="title_con">
						<div class="item-title">야스오 강의</div>
						<div class="date_writer_con">
							<div class="date">2023-09-16</div>
							<div class="writer">실버 판테온</div>
						</div>
					</div>
					<div class="comment">[65]</div>
				</div>
			</c:if>

			<c:set var="etcHit" value="${etc1Hit }" />
			<c:set var="etcHitComment" value="${etc1HitComment }" />
			<c:if test="${!empty etcHit }">
				<a
					href="<%=request.getContextPath() %>/board_content_main.do?type=${etcHit.getBoard_type()}&no=${etcHit.getBoard_index() }">
					<div class="item nes-container is-rounded is-dark">
						<div class="ranking">5</div>
						<img src="" class="sumimg" />
						<div class="title_con">
							<div class="item-title">${etcHit.getBoard_title() }</div>
							<div class="date_writer_con">
								<div class="date">
									<c:if test="${empty etcHit.getBoard_update() }">
                  ${etcHit.getBoard_date() } 
               </c:if>

									<c:if test="${!empty etcHit.getBoard_update() }">
                  ${etcHit.getBoard_update() }
               </c:if>
								</div>
								<div class="writer">${etcHit.getBoard_writer_nickname() }</div>
							</div>
						</div>
						<div class="comment">[${etcHitComment }]</div>
					</div>
				</a>
			</c:if>

			<c:if test="${empty etcHit }">

				<div class="item nes-container is-rounded is-dark">
					<div class="ranking">5</div>
					<img src="" class="sumimg" />
					<div class="title_con">
						<div class="item-title">야스오 강의</div>
						<div class="date_writer_con">
							<div class="date">2023-09-16</div>
							<div class="writer">실버 판테온</div>
						</div>
					</div>
					<div class="comment">[65]</div>
				</div>
			</c:if>
		</div>

		<div
			class="pop_post_wrap main_box1 nes-container is-rounded is-dark with-title is-centered">
			<p class="box_text title">실시간 매칭</p>
			<img id="dva" src="./img/assets/dva.png">
			<div>
				<!-- <img class="matching-img" src="../WebContent/img/1.png" /> -->
				<img class="overdot" src="img/assets/overdot2.gif" alt="" title="">
			</div>
			<c:if test="${loginCheck == 0 }">
				<br>
				<br>
				<a type="button" id="match-btn1" class="PleaseLogin btn-a"> <img
					id="start-btn1" src="img/assets/start.png" alt="">
				</a>
			</c:if>

			<c:if test="${loginCheck > 0 }">
				<br>
				<br>
				<button type="button" id="match-btn2" class="matching-btn">
					<img id="start-btn2" src="img/assets/start.png" alt="">
				</button>
			</c:if>
			<br>
			<br>
			<br>
			<br> <img class="joy" id="crossbtn" src="img/assets/joy3.png"
				alt="" title="">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<img class="joy" id="joybuttons" src="img/assets/joybuttons2.png"
				alt="" title="">
		</div>
	</div>

	<!-- 매칭 창 팝업 js -->
	<script type="text/javascript" src="matching/pop.js"></script>
	<script type="text/javascript" src="matching/pop2.js"></script>
	<!-- <script type="text/javascript">
     // set time limit in milliseconds
     var timeLimit = 1800000; // 30 minutes
      
     // submit the form after the specified time and then set a new timer
     setInterval(function() {
       document.getElementById("myForm").submit();
       setTimeout(function() {
         document.getElementById("myForm1").submit();
       }, 2000); // wait 2 seconds before submitting the second form
     }, timeLimit);
     
     // submit the form immediately when the page is loaded
     window.onload = function() {
       document.getElementById("myForm").submit();
       setTimeout(function() {
         document.getElementById("myForm1").submit();
       }, 2000); // wait 2 seconds before submitting the second form
     };
   </script> -->
	<script type="text/javascript">
     // set time limit in milliseconds
     if(${empty free1Hit}) {        
       $("#myForm").submit();
     }
   </script>
	<%@ include file="include/footer.jsp"%>
</body>
</html>