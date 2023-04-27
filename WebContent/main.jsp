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
	
	<c:set var="freeHit" value="${free1Hit }" />
	<c:set var="freeHitComment" value="${free1HitComment }" />
	
	<%@ include file="include/header.jsp"%>

	<div class="main_wrap">
		<!-- <img class="ruru" src="img/rurupixel.png" alt="" title="귀여운 루루">
      <img class="nar" src="img/nar.png" alt="" title="포악한 나르"> <img
         class="timo" src="img/timo.png" alt="" title="혐모"> <img
         class="youme" src="img/youme.png" alt="" title="버스충 유미"> -->




		<div class="pop_post_wrap main_box1 nes-container is-rounded is-dark with-title is-centered">
			<p class="box_text title">실시간 인기글</p>
			<img id="bmo" src="./img/assets/bmo.png"> 
			<c:forEach begin="1" end="5" var="i">
				<a href="<%=request.getContextPath() %>/main.jsp" class="board_a">
  					<div class="item nes-container is-rounded is-dark">
						<div class="ranking">${i }</div>
						<img src="img/assets/noImage.gif" class="sumimg noimg" />
						<div class="title_con">
							<div class="item-title">야스오 강의</div>
							<div class="date_writer_con">
								<div class="date">2023-09-16</div>
								<div class="writer">실버 판테온</div>
							</div>
						</div>
						<div class="comment">[65]</div>
					</div>
				</a>
			</c:forEach>
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
					 src="img/assets/start.png" alt="">
				</a>
			</c:if>

			<c:if test="${loginCheck > 0 }">
				<br>
				<br>
				<a type="button" id="match-btn2" class="matching-btn btn-a"> <img
					 src="img/assets/start.png" alt="">
				</a>
			</c:if>
			<br> <br> <br>  <img class="joy"
				id="crossbtn" src="img/assets/joy3.png" alt="" title="">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<img class="joy" id="joybuttons" src="img/assets/joybuttons2.png"
				alt="" title="">
		</div>
	</div>

	<!-- 매칭 창 팝업 js -->
	<script type="text/javascript" src="matching/pop.js"></script>
	<script type="text/javascript" src="matching/pop2.js"></script>
	<script type="text/javascript">
     	// Set the refresh interval to 10 seconds
     	myform();
     	
		var refreshInterval = setInterval(function() {
			myform();
		}, 10000);
     	
     	function myform() {
     		$.ajax({
     			contentType : "application/x-www-form-urlencoded;charset=UTF-8",
    			type : "post",
   				url : "hot_hit1.do",
   				datatype : "xml",
   				success : function(data) {
   					let i = 0;
   					if($(data).find("board").text() == '') {
   						
   					} else {
   						$(data).find("board").each(function() {
   							if($(this).find("nickname").text()==""){
   								
   							}else{
   								$('.writer').eq(i).html($(this).find("nickname").text());
   		   						$('.comment').eq(i).html("["+$(this).find("comment").text()+"]");
   		   						$('.item-title').eq(i).html($(this).find("title").text());
   		   						$(".board_a").eq(i).attr('href', "<%=request.getContextPath()%>/board_content.do?page=1&no="+$(this).find("index").text()+"&type="+$(this).find("type").text());
   		   						if($(this).find("update").text() == "null") {
   		   							$('.date').eq(i).html($(this).find("date").text().substring(0, 10));
   		   							if($(this).find("uploadfile").text() == 'null') {
    		   						   $('.sumimg').eq(i).attr('src',"<%=request.getContextPath()%>/img/assets/noImage.gif");
    		   						}else{
    		   							$('.sumimg').eq(i).attr('src',"<%=request.getContextPath()%>/img"+$(this).find("uploadfile").text());
    		   						}
   		   						} else {
   		   							$('.date').eq(i).html($(this).find("update").text().substring(0, 10));
   		   							if($(this).find("uploadfile").text() == 'null') {
    		   						   $('.sumimg').eq(i).attr('src',"<%=request.getContextPath()%>/img/assets/noImage.gif");
    		   						}else{
    		   							$('.sumimg').eq(i).attr('src',"<%=request.getContextPath()%>/img"+$(this).find("uploadfile").text());
    		   						}
   		   						}
   							}
	   						i++;
	   					});
   					}
   				},
   				error : function() {
   					alert('시스템오류');
   				}
   			});
     	}
   </script>
	<%@ include file="include/footer.jsp"%>
</body>
</html>
