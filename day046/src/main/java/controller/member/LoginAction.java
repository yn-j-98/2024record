package controller.member;

import controller.common.Action;
import controller.common.ActionForward;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.dao.MemberDAO;
import model.dto.MemberDTO;

public class LoginAction implements Action {

	// Action 인터페이스에 의한 강제 오버라이딩
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		// M으로 보낼 객체 생성
		MemberDAO memberDAO=new MemberDAO();
		MemberDTO memberDTO=new MemberDTO();
		// V에서 가져온 아이디와 비밀번호 값 가져오기
		memberDTO.setMid(request.getParameter("mid"));
		memberDTO.setPassword(request.getParameter("password"));
		// M에서 임의로 만든 아이디 중복검사를 위한 컨디션 값, CHECKMID
		memberDTO.setCondition("CHECKMID");
		memberDTO = memberDAO.selectOne(memberDTO);
		
		ActionForward forward=new ActionForward();
		if(memberDTO != null) { // 로그인에 성공했다면
			HttpSession session=request.getSession();
			session.setAttribute("loginInfo", memberDTO.getMid());
			
			// 메인 페이지로 이동
			forward.setPath("main.do");
			forward.setRedirect(true);
		}
		else { // 로그인에 실패했다면,
			// 로그인 실패 알랏창 띄우기
			request.setAttribute("msg", "로그인 실패...");
			// 다시 로그인 페이지로 이동
			request.setAttribute("path", "loginPage.do");
			// info.jsp ->> 안내메시지(실패, 성공, 등등..)
			forward.setPath("info.jsp");
			forward.setRedirect(false);
		}		
		return forward;
	}

}
