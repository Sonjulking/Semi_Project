<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<%-- 부트스트랩 --%>
<link href="https://unpkg.com/nes.css@latest/css/nes.min.css" rel="stylesheet" />

<%-- 드래크 팝업에 필요한 링크 --%>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">



<style type="text/css">

	#popWindow {
        position:absolute;
        display:none;
        left:10%;
        top:10%;
    }

    #draggable { 
    width:550px;
    height:750px;
    padding:0.5em;
    background-color: gray;
     }
     
     #closeBtn {
        position:absolute;
        width:15px;
        z-index:1;
        margin-left:-16px;
        margin-top:-8px;
    }
     
    .font {
    color: white;
    size: 20px;
    }
    
</style>

</head>
 
<body>
<div id="popWindow">

	<div id="draggable" class="ui-widget-content">
	    <div style="text-align:right;">
		<input type="button" onclick="popWindowClose();" class="nes-btn is-error" value="닫기">
	    </div>

	     <%@ include file="./matching.jsp"%>
	</div>
	
	
</div>

<%-- 드래크 팝업에 필요한 스크립트 --%>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script>
    
    function popWindowOpen() {
        jQuery("#popWindow").css("display", "block");
        jQuery("#popWindow").draggable();
        
    }

    function popWindowClose() {
        jQuery("#popWindow").css("display", "none");
    }
    
</script>

</body>

</html> 