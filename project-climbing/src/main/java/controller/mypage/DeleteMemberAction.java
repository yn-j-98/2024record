package controller.mypage;

import controller.common.Action;
import controller.common.ActionForward;
import controller.function.LoginCheck;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.member.MemberDAO;
import model.member.MemberDTO;

public class DeleteMemberAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		//기본으로 넘어가야하는 페이지 와 redirect 여부를 설정
		ActionForward forward = new ActionForward();
		
		String path = "info.jsp";
		boolean flagRedirect = false;
//		String path = "MYPAGEPAGEACTION.do";
//		boolean flagRedirect = true;

	      //로그인 정보가 있는지 확인해주고
	      String login[] = LoginCheck.Success(request, response);
	      //사용자 아이디
	      String member_id = login[0];
		
		//만약 로그인 정보가 없다면
		if(member_id == null) {
			//main 페이지로 전달해줍니다.
			path = "LOGINPAGEACTION.do";
		}
		else {
			MemberDTO data = new MemberDTO();
			MemberDAO memberDAO = new MemberDAO();
			//사용자 아이디를 DTO에 등록
			data.setModel_member_id(member_id);
			System.out.println("DeletememberAction.java 로그 : "+member_id);
			//delete 를 성공하지 못했다면 Mypage로 보냅니다.
			boolean flag = memberDAO.delete(data);
			if(flag) {//멤버 삭제에 성공했다면 logout 페이지로 넘어갑니다.
				data.setModel_member_profile(request.getServletContext().getContextPath()+ "/profile_img/" + member_id);
				System.err.println("회원탈퇴 성공 로그");
				request.setAttribute("msg", "회원 탈퇴 성공!");
				request.setAttribute("path", "MAINPAGEACTION.do");
				//path = "LOGOUTPAGEACTION.do";
			}
			else {
				System.err.println("회원탈퇴 실패 로그");
				request.setAttribute("msg", "회원 탈퇴 실패...");
				request.setAttribute("path", "LOGOUTPAGEACTION.do");
			}
		}
		forward.setPath(path);
		forward.setRedirect(flagRedirect);
		return forward;
	}

}
