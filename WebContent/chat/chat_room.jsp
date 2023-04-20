<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="loginCheck" value="0" />
<c:if test="${!empty sessionScope.LoginCheck}">
  <c:set var="loginCheck" value="${sessionScope.LoginCheck}" />
</c:if>

<c:set var="dto" value="${Cont }"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>익명 채팅</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(document).ready(function(){
        // 채팅 내용을 가져와서 화면에 출력하는 함수
        function getChatLog() {
            $.ajax({
               // url: "getChat.jsp", // 채팅 내용을 가져올 jsp 페이지
                success: function(data) {
                    $("#chatLog").html(data); // 가져온 채팅 내용을 출력
                }
            });
        }
        // 일정 시간마다 채팅 내용을 가져와서 출력
        setInterval(getChatLog, 1000);
        // 메시지 전송 버튼 클릭 시
        $("#sendBtn").click(function(){
            var message = $("#messageInput").val(); // 입력된 메시지
            $.ajax({
                url: "send_message.do", // 메시지 전송 처리를 하는 jsp 페이지
                type: "post", // post 방식으로 전송
                data: { 
                	    message: message,
                	    nickname : "${dto.getMember_nickname()}"
                      }, // 입력된 메시지를 전송
                success: function(data) {
                    $("#messageInput").val(""); // 입력창 초기화
                }
            });
        });
    });
</script>
</head>
<body>
    <h1>익명 채팅</h1>
    <div id="chatLog"></div>
    <input type="text" id="messageInput">
    <button id="sendBtn">전송</button>
</body>
</html>