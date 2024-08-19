package controller.board;

import java.util.ArrayList;

import controller.common.Action;
import controller.common.ActionForward;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.dao.BoardDAO;
import model.dto.BoardDTO;

public class MainAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		BoardDAO boardDAO=new BoardDAO();
		BoardDTO boardDTO=new BoardDTO();
		ArrayList<BoardDTO> datas=boardDAO.selectAll(boardDTO);
		request.setAttribute("datas", datas);
		
		ActionForward forward=new ActionForward();
		forward.setRedirect(false); // 포워드 방식
		forward.setPath("main.jsp");
		return forward;
	}
	
}
