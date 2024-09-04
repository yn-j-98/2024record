package controller.member;

import controller.common.Action;
import controller.common.ActionForward;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class LogoutAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		request.getSession().removeAttribute("loginInfo");
		
		request.setAttribute("msg", "로그아웃 성공!");
		request.setAttribute("path", "main.do");
		
		ActionForward forward=new ActionForward();
		forward.setRedirect(false);
		forward.setPath("info.jsp");
		return forward;
	}

}
