package controller.crew.join;

import controller.common.Action;
import controller.common.ActionForward;
import controller.function.LoginCheck;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.member.MemberDAO;
import model.member.MemberDTO;

public class CrewJoinAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		String path = "info.jsp"; // 크루가입 안내 페이지 이동
		boolean flagRedirect = false; // 포워드 방식 사용 여부 설정 (false = forward 방식)

		//메세지와 경로를 준다
		//크루 번호를 받아와서
		//해당 크루에 업데이트를 시키고
		//크루 정보를 세션에 넣어준다

		String login[] = LoginCheck.Success(request, response);
		//사용자 아이디
		if (login == null) {
			// 로그인 페이지로 전달
			path = "LOGINPAGEACTION.do";

		} else {
			String member_id = login[0];
			//선택한 크루 정보

			int crew_num = Integer.parseInt(login[1]);//유효성 검사 이미 크루에 가입되어있다면
			
			if(crew_num > 0) {
				request.setAttribute("msg", "이미 소속된 크루가 있습니다.");
				request.setAttribute("path", "CREWLISTPAGE.do");//CrewListPage
			}


			int view_crew_num = Integer.parseInt(request.getParameter("view_crew_num"));//크루pk
			MemberDTO memberDTO = new MemberDTO();
			MemberDAO memberDAO = new MemberDAO();
			
			memberDTO.setModel_member_id(member_id);
			memberDTO.setModel_member_crew_num(view_crew_num);

			memberDTO.setModel_member_condition("MEMBER_UPDATE_CREW");
			boolean flag = memberDAO.update(memberDTO);
			if(flag) {//업데이트에 성공한다면
				HttpSession session=request.getSession();

				session.setAttribute("CREWCHECK",view_crew_num);//세션에 크루정보 넣어주기

				request.setAttribute("msg", "해당 크루에 가입을 완료했습니다.");
				request.setAttribute("path", "CREWPAGE.do");//CrewPage


			}
			else {//업데이트에 실패한다면

				request.setAttribute("msg", "해당 크루에 가입을 실패했습니다.");
				request.setAttribute("path", "CREWLISTPAGE.do");//CrewListPage


			}



		}

		forward.setPath(path);
		forward.setRedirect(flagRedirect);
		return forward;
	}

}
