package controller.member;

import controller.common.Action;
import controller.common.ActionForward;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.dao.MemberDAO;
import model.dto.MemberDTO;

public class LoginAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		MemberDAO memberDAO=new MemberDAO();
		MemberDTO memberDTO=new MemberDTO();
		memberDTO.setMid(request.getParameter("mid"));
		memberDTO.setPassword(request.getParameter("password"));
		memberDTO = memberDAO.selectOne(memberDTO);
		if(memberDTO != null) {
			HttpSession session=request.getSession();
			session.setAttribute("loginInfo", memberDTO.getMid());
		}
		
		ActionForward forward=new ActionForward();
		forward.setRedirect(false); // 리다이렉트 방식
		forward.setPath("main.do");
		return forward;
	}

}
