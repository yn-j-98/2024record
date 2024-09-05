package controller.page;

import controller.common.Action;
import controller.common.ActionForward;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.dao.MemberDAO;
import model.dto.MemberDTO;

public class MypagePageAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		MemberDAO memberDAO=new MemberDAO();
		MemberDTO memberDTO=new MemberDTO();
		memberDTO.setCondition("CHECKMID");
		memberDTO.setMid((String)request.getSession().getAttribute("loginInfo"));
		memberDTO = memberDAO.selectOne(memberDTO);
		request.setAttribute("data", memberDTO);
		
		ActionForward forward = new ActionForward();
		forward.setPath("mypage.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
