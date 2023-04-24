package com.board.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.board.model.BoardDAO;
import com.project.controller.Action;
import com.project.controller.ActionForward;

public class BoardReplyListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

		int board_no = Integer.parseInt(request.getParameter("no").trim());
		String board_type = request.getParameter("type").trim();
		String nickname = request.getParameter("nickname").trim();
		
		int page = 1;
		
		int pageSize = 5;
		
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page").trim());
		}
		
		BoardDAO dao = BoardDAO.getInstance();
		
		String str = dao.getReplyList(board_no, board_type, page, pageSize);
		int[] result = dao.getReplyTotalPage(board_no, board_type, pageSize);
		int totalCount = result[0];
		int totalPage = result[1];
		
		
		
		PrintWriter out = response.getWriter();
		
		out.println("<data>");
		out.println("<nickname>" + nickname + "</nickname>");
		out.println("<reply_list>" + str + "</reply_list>");
		out.println("<total_count>" + totalCount + "</total_count>");
		out.println("<total_page>" + totalPage + "</total_page>");
		out.println("<page>" + page + "</page>");
		out.println("</data>");
		return null;
	}

}
