package controller.crew.community;

import java.util.ArrayList;

import controller.common.Action;
import controller.common.ActionForward;
import controller.function.LoginCheck;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.crew_board.Crew_boardDAO;
import model.crew_board.Crew_boardDTO;

public class CrewCommunityPageAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		String path = "CrewCommunity.jsp"; // 마이페이지로
		boolean flagRedirect = false; // 포워드 방식
		
		/*
		 * 크루커뮤니티 페이지 이동
		 * 뷰에게서 페이지네이션을 위해 페이지 번호를 받아옵니다.
		 * 페이지네이션 계산 후
		 * 크루보드 DAO와 DTO를 생성해서
		 * min_num과 max_num, writer_id를 set해줍니다.
		 * 크루 글을 셀렉올 해줍니다.
		 * 컨디션은 CREW_BOARD_ALL_CREW_BARD
		 * 
		 * 그 다음 crewboardDTO를 따로 하나 더 파서
		 * writer_id를 set해주고
		 * 게시글의 총개수를 위해 selectOne해줍니다.
		 * 컨디션은 CREW_BOARD_ALL_CREW_BOARD
		 */
		
		String login[] = LoginCheck.Success(request, response);
		
		String member_id = login[0];
		int crew_num = Integer.parseInt(login[1]);

		int pageNum = 1; // 페이지 번호 초기화
		// 페이지네이션 부분
		if(request.getParameter("page") != null) {
			pageNum = Integer.parseInt(request.getParameter("page")); // 페이지 번호가 있을 경우 변환하여 저장
		}
		int boardSize = 10; // 한 페이지에 표시할 게시글 수 설정
		int minBoard = 1; // 최소 게시글 수 초기화
		int maxBoard = 1; // 최대 게시글 수 초기화

		// 페이지 번호에 따라 최소 및 최대 게시글 수 설정
		if(pageNum <= 1) {
			// 페이지 번호가 1 이하일 경우
			minBoard = 1; // 최소 게시글 번호를 1로 설정
			maxBoard = minBoard * boardSize; // 최대 게시글 번호 계산
		}
		else {
			// 페이지 번호가 2 이상일 경우
			minBoard = ((pageNum - 1) * boardSize) + 1; // 최소 게시글 번호 계산
			maxBoard = pageNum * boardSize; // 최대 게시글 번호 계산
		}
		
		int listNum = 0; // 게시글 총 개수를 저장할 변수 초기화
		
		Crew_boardDTO crew_boardDTO = new Crew_boardDTO();
		Crew_boardDAO crew_boardDAO = new Crew_boardDAO();
		
		crew_boardDTO.setModel_crew_board_min_num(minBoard);
		crew_boardDTO.setModel_crew_board_max_num(maxBoard);
		crew_boardDTO.setModel_crew_board_writer_id(member_id);
		
		crew_boardDTO.setModel_crew_board_condition("CREW_BOARD_ALL_CREW_BARD");
		ArrayList<Crew_boardDTO> model_crew_board_datas = crew_boardDAO.selectAll(crew_boardDTO);
		
		//TODO 수정 필요
		String filename = crew_boardDTO.getModel_crew_board_profile();
//      프로필foreach하고 set으로 주소값추가
		//TODO 수정 필요
      for(Crew_boardDTO data : model_crew_board_datas) {
      	data.setModel_crew_board_profile(request.getServletContext().getContextPath() + "/profile_img/" + filename);
      }
      
		
		Crew_boardDTO crew_board_count = new Crew_boardDTO();
		crew_board_count.setModel_crew_board_writer_id(member_id);
		crew_board_count.setModel_crew_board_condition("CREW_BOARD_ALL_CREW_BOARD");
		crew_board_count = crew_boardDAO.selectOne(crew_board_count);
		listNum = crew_board_count.getModel_crew_board_total();
		
	
		request.setAttribute("model_crew_board_total", listNum);
		request.setAttribute("currentPage", pageNum);
	    request.setAttribute("model_crew_board_datas", model_crew_board_datas);
	    
	    
	    
	    forward.setPath(path); // 이동할 페이지 설정
		forward.setRedirect(flagRedirect); // 페이지 이동 방식 설정 (포워드)

		return forward;
	}

}
