package controller.board;

import controller.common.Action;
import controller.common.ActionForward;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.dao.BoardDAO;
import model.dto.BoardDTO;

public class InsertBoardAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		// V에서 받은 데이터를 ===>> parameter
		String content = request.getParameter("content");
		String title = request.getParameter("title");
		String writer = request.getParameter("writer");

		// M한테 전달 ===>> DTO
		BoardDAO boardDAO=new BoardDAO();
		BoardDTO boardDTO=new BoardDTO();
		boardDTO.setContent(content);
		boardDTO.setTitle(title);
		boardDTO.setWriter(writer);
		boolean flag = boardDAO.insert(boardDTO);
		
		ActionForward forward = new ActionForward();
		if(flag) {
			forward.setPath("main.do");
		}
		else {
			forward.setPath("insertBoardPage.do");
		}
		forward.setRedirect(true);
		return forward;
	}

}
