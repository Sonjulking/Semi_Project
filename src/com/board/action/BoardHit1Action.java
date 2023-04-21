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

public class BoardHit1Action implements Action {

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
	    System.out.println(board_etc+"기타인기");
	    
		
		BoardDAO dao = BoardDAO.getInstance();
		
		BoardDTO free = dao.boardHit1Content(board_free);
		BoardDTO legend = dao.boardHit1Content(board_legend);
		BoardDTO etc = dao.boardHit1Content(board_etc);
		int free_comment = dao.commentCount(board_free);
		int legend_comment = dao.commentCount(board_legend);
		int etc_comment = dao.commentCount(board_etc);
		
		HttpSession session = request.getSession();
		session.setAttribute("free1Hit", free);
		session.setAttribute("free1HitComment", free_comment);
		
		session.setAttribute("legend1Hit", legend);
		session.setAttribute("legend1HitComment", legend_comment);
		session.setAttribute("etc1Hit", etc);
		session.setAttribute("etc1HitComment", etc_comment);
		System.out.println(free+"자유내용");
		System.out.println(legend+"레전드내용");
		System.out.println(etc+"기타내용");

		BoardDTO freeT = dao.boardThumbs1Content(board_free);
		BoardDTO legendT = dao.boardThumbs1Content(board_legend);
	
		int free_commentT = dao.commentCountThumbs(board_free);
		int legend_commentT = dao.commentCountThumbs(board_legend);
		HttpSession sessionT = request.getSession();
		sessionT.setAttribute("free1Thumbs", freeT);
		sessionT.setAttribute("free1ThumbsComment", free_commentT);
		
		session.setAttribute("legend1Thumbs", legendT);
		session.setAttribute("legend1ThumbsComment", legend_commentT);
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		
		forward.setPath("main.jsp");
		
		return forward;
	}

}
