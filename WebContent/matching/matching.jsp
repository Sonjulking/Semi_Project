<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매칭 데이터 입력</title>

<script src="https://code.jquery.com/jquery-3.6.3.js"></script>

<!-- <link rel="stylesheet" href="matching.css" /> -->
<!-- 동적으로 CSS 적용하는 방법  -->

<link href="https://unpkg.com/nes.css@latest/css/nes.min.css" rel="stylesheet" />

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/matching.css" />
<style type="text/css">

</style>

</head>
<body>

	<form method="post" name="f" class="nes-container is-rounded"
	action="<%=request.getContextPath() %>/matching_ok.do">
	
	
      <h2 align="center">매칭 데이터 입력</h2>
      <div class="container">
      <c:set var = "dto" value = "${Cont }"/>
      <input type = "hidden" name="id" value = "${dto.getMember_id() }">
      <input type = "hidden" name="nickname" value = "${dto.getMember_nickname() }">
	
        <label for="gamename"><b>게임명</b></label>
        <div class="nes-select">
			  <select required id="default_select" name = "gamename">
			    <option value="" >게임명을 선택하세요.</option>
			    <option value="리그오브레전드">리그오브레전드</option>
			    <option value="배틀그라운드">배틀그라운드</option>
			    <option value="오버워치">오버워치</option>
			  </select>
		</div>
		
		<br>
        
        <label for="tier"><b>티어</b></label>
        <div class="nes-select">
			  <select required id="default_select" name = "tier">
			    <option value="" >티어를 선택하세요</option>
			    <option value="챌린저">챌린저</option>
			    <option value="그랜드마스터">그랜드마스터</option>
			    <option value="마스터">마스터</option>
			    <option value="다이아몬드">다이아몬드</option>
			    <option value="플래티넘">플래티넘</option>
			    <option value="골드">골드</option>
			    <option value="실버">실버</option>
			    <option value="브론즈">브론즈</option>
			    <option value="아이언">아이언</option>
			  </select>
		</div>
        
        <br>
        
        <div class="nes-field">
		  <label for="name_field"><b>디스코드 아이디</b> </label>
		  <input type="text" id="name_field" class="nes-input" name="DiscordID" placeholder="디스코드 아이디를 입력하세요">
		</div>
		
		<br>
       	
        <div class="nes-field">
		  <label for="name_field"><b>카카오톡 아이디</b></label>
		  <input type="text" id="name_field" class="nes-input" name="KakaoID" placeholder="카카오 아이디를 입력하세요">
		</div>
        
	    <br>
        
        <div align="center">
        	<button type="submit"  class="Matching nes-btn is-success">매칭하기!</button>
        </div>
        
      </div>
      
    </form>
     

</body>
</html>