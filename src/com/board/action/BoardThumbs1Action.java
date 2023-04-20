package com.board.action;

import java.io.IOException;
import java.util.StringTokenizer;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.board.model.BoardDAO;
import com.board.model.BoardDTO;
import com.project.controller.Action;
import com.project.controller.ActionForward;

public class BoardThumbs1Action implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, MessagingException, Exception {
		
		String board_free = "free";
		String board_legend = "legend"; 
		String board_etc = "etc"; 


		StringTokenizer st = new StringTokenizer(board_free, "'");
		StringTokenizer st1 = new StringTokenizer(board_legend, "'");
		StringTokenizer st2 = new StringTokenizer(board_etc, "'");

	    System.out.println(board_free+"자유인기");
	    System.out.println(board_legend+"레전드인기");
		
		BoardDAO dao = BoardDAO.getInstance();
		
		BoardDTO free = dao.boardHit1Content(board_free);
		BoardDTO legend = dao.boardHit1Content(board_legend);
		
		int free_comment = dao.commentCountThumbs(board_free);
		int legend_comment = dao.commentCountThumbs(board_legend);
		HttpSession session = request.getSession();
		session.setAttribute("free1Thumbs", free);
		session.setAttribute("free1ThumbsComment", free_comment);
		
		session.setAttribute("legend1Thumbs", legend);
		session.setAttribute("legend1ThumbsComment", legend_comment);
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		
		forward.setPath("main.jsp");
		
		return forward;
	}

}
