package controller.page;

import java.util.ArrayList;

import controller.common.Action;
import controller.common.ActionForward;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.dao.BoardDAO;
import model.dao.ReplyDAO;
import model.dto.BoardDTO;
import model.dto.ReplyDTO;

public class BoardPageAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		BoardDAO boardDAO=new BoardDAO();
		BoardDTO boardDTO=new BoardDTO();
		ReplyDAO replyDAO = new ReplyDAO();
		ReplyDTO replyDTO = new ReplyDTO();
		
		ArrayList<BoardDTO> datas=boardDAO.selectAll(boardDTO);
		request.setAttribute("datas", datas);
		
		BoardDTO data = boardDAO.selectOne(boardDTO);
		request.setAttribute("data", data);
		
		ArrayList<ReplyDTO> contents = replyDAO.selectAll(replyDTO);
		request.setAttribute("contents", contents);
		
		
		
		ActionForward forward=new ActionForward();
		forward.setPath("board.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
