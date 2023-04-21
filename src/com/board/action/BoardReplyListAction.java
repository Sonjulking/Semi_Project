package com.board.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.model.BoardDAO;
import com.project.controller.Action;
import com.project.controller.ActionForward;

public class BoardReplyListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

		int reply_no = Integer.parseInt(request.getParameter("no").trim());
		String board_type = request.getParameter("type");
		String nickname = request.getParameter("nickname");
		BoardDAO dao = BoardDAO.getInstance();
		
		String str = dao.getReplyList(reply_no, board_type);
		
		PrintWriter out = response.getWriter();
		
		out.println("<data>");
		out.println("<nickname>" + nickname + "</nickname>");
		out.println("<reply_list>" + str + "</reply_list>");
		out.println("</data>");
		return null;
	}

}
