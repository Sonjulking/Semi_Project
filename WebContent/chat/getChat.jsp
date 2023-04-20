<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chat Room</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
    setInterval(function(){
        var room_id = $("#room_id").val();
        $.ajax({
            //url: "get_chat_data.do",
            method: "post",
            data: { room_id : room_id },
            success: function(response) {
                $("#chatLog").html(response);
            }
        });
    }, 1000);
});
</script>
</head>
<body>
    <input type="hidden" id="room_id" value="${param.room_id}" />
    <div id="chatLog">
    </div>
</body>
</html>