package com.chat.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.chat.model.ChatDAO;
import com.project.controller.Action;
import com.project.controller.ActionForward;

public class SendMessageAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, MessagingException, Exception {
	    String user_message = request.getParameter("user_message");
	    String user_nickname = request.getParameter("nickname");
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	    String message_time = sdf.format(new java.util.Date());
	    
	    ChatDAO dao = ChatDAO.getInstance();
	    int check = dao.insertMessage(user_message, user_nickname, message_time);
	    
	    PrintWriter out = response.getWriter();
	    if(check > 0) {
	    	out.println("<script>");
	    	out.println("<location.href='chat/chat_room.jsp?room_id="+check+"'>");
	    	out.println("</script>");
	    } else {
	    	out.println("<script>");
	    	out.println("<location.href='history.back()'>");
	    	out.println("alert('메세지 전송 실패')");
	    	out.println("</script>");
	    }
     
	    return null;
	}

}
