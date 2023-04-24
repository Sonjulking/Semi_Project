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
		
		int page = 0;
		
		int pageSize = 5;
		
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page").trim());
		}else {
			// 처음으로 "전체 게시물 목록" a 태그를 클릭한 경우
			page = 1;
		}
		
		
		BoardDAO dao = BoardDAO.getInstance();
		
		String str = dao.getReplyList(board_no, board_type, page, pageSize);
		int totalPage = dao.getReplyTotalPage(board_no, board_type, pageSize);
		
		
		
		PrintWriter out = response.getWriter();
		
		out.println("<data>");
		out.println("<nickname>" + nickname + "</nickname>");
		out.println("<reply_list>" + str + "</reply_list>");
		out.println("<total_page>" + totalPage + "</total_page>");
		out.println("<page>" + page + "</page>");
		out.println("</data>");
		return null;
	}

}
