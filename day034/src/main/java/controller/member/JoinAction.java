package controller.member;

import controller.common.Action;
import controller.common.ActionForward;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.dao.MemberDAO;
import model.dto.MemberDTO;

public class JoinAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		String mid = request.getParameter("mid");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		
		MemberDAO memberDAO = new MemberDAO();
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setMid(mid);
		memberDTO.setPassword(password);
		memberDTO.setName(name);
		boolean flag = memberDAO.insert(memberDTO);
		
		ActionForward forward=new ActionForward();
		if(flag) {
			forward.setRedirect(true); // 리다이렉트 방식
			forward.setPath("main.do");			
		}
		else {
			forward.setRedirect(true);
			forward.setPath("joinPage.do");	
		}
		return forward;
	}

}
