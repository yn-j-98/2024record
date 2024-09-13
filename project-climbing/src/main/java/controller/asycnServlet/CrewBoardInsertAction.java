package controller.asycnServlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.crew_board.Crew_boardDAO;
import model.crew_board.Crew_boardDTO;


@WebServlet("/crewBoardInsert")
public class CrewBoardInsertAction extends HttpServlet {
	private static final long serialVersionUID = 1L;


	public CrewBoardInsertAction() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		// 세션에서 로그인된 사용자 ID 가져오기
        HttpSession session = request.getSession(false); // false: 세션이 없으면 새로 만들지 않음
        // 세션이 존재하지 않거나, 로그인된 사용자가 없으면 null이 됨
        String crewBoardMemberId = (session != null) ? (String) session.getAttribute("MEMBER_ID") : null;

        // 사용자가 로그인하지 않은 경우 처리 (비정상적인 접근 막기)
        if (crewBoardMemberId == null) {
            response.sendRedirect("LOGINPAGEACTION.do");
            return; // 로그인하지 않은 사용자는 더 이상의 처리를 하지 않음
        }
        
        
		// V에서 title, content값을 받아오기
		String crew_board_title = request.getParameter("VIEW_TITLE");
		String crew_board_content = request.getParameter("VIEW_CONTENT");
		
		

		// db에 저장하기위해 객체 생성
		Crew_boardDAO crew_boardDAO = new Crew_boardDAO();
		Crew_boardDTO crew_boardDTO = new Crew_boardDTO();
			
		
		// db에 저장하기 위해 만든 객체에 받아온 데이터를 삽입\
		crew_boardDTO.setModel_crew_board_title(crew_board_title);
		crew_boardDTO.setModel_crew_board_content(crew_board_content);
		crew_boardDTO.setModel_crew_board_writer_id(crewBoardMemberId);
		
		// 글 삽입
		boolean flag = crew_boardDAO.insert(crew_boardDTO);
	
		// v에게 값 전달
		response.getWriter().print(flag);
	}

}
