package controller.board;

import controller.common.Action;
import controller.common.ActionForward;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.dao.BoardDAO;
import model.dto.BoardDTO;

public class InsertBoardAction  implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		// V에서 받은 데이터를 ===>> parameter 
		
		
		// V에서 받은 데이터가 아래 세개라고 가정한 경우임
		String content = request.getParameter("content");
		String title = request.getParameter("title");
		String writer = request.getParameter("writer");
		// M한테 전달 ===> DTO
		BoardDAO boardDAO = new BoardDAO();
		BoardDTO boardDTO = new BoardDTO();	
		boardDTO.setContent(content);
		boardDTO.setContent(title);
		boardDTO.setContent(writer);
		boolean flag = boardDAO.insert(boardDTO);
		// 잘 됐는가 확인하려면
		// 로그를 작성해라!
		
		
		ActionForward forward = new ActionForward();
		if(flag) {// 성공했으면
		forward.setPath("main.do");
		}
		else { // 실패했으면
			forward.setPath("insertBoardPage.do");
		}
		forward.setRedirect(true);
		return forward;
	}

}
