package com.matching.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.matching.model.MatchingDAO;
import com.member.model.MemberDTO;
import com.project.controller.Action;
import com.project.controller.ActionForward;

public class FinalDeleteOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, MessagingException, Exception {
		// 마지막 유저 프로필에서 matching DB만 삭제
		String member_id = request.getParameter("id").trim();

		MatchingDAO dao = MatchingDAO.getInstance();

		MemberDTO mdto = new MemberDTO();

		mdto.setMember_id(member_id);

		dao.deleteMatching(mdto);

		PrintWriter out = response.getWriter();

		out.println("<script>");
		out.println("history.back()");
		out.println("</script>");
		/*
		 * ActionForward forward = new ActionForward();
		 * 
		 * forward.setRedirect(false);
		 * 
		 * forward.setPath("matching/matching.jsp");
		 */
		return null;

	}

}
