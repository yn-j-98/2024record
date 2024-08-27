package controller.board;

import java.util.ArrayList;

import controller.common.Action;
import controller.common.ActionForward;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.dao.BoardDAO;
import model.dao.ReplyDAO;
import model.dto.BoardDTO;
import model.dto.ReplyDTO;

public class BoardAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		int bid=Integer.parseInt(request.getParameter("bid"));
				
		BoardDAO boardDAO=new BoardDAO();
		BoardDTO boardDTO=new BoardDTO();
		boardDTO.setBid(bid);
		boardDTO=boardDAO.selectOne(boardDTO);
		
		ReplyDAO replyDAO=new ReplyDAO();
		ReplyDTO replyDTO=new ReplyDTO();
		replyDTO.setBid(bid);
		ArrayList<ReplyDTO> datas=replyDAO.selectAll(replyDTO);
		request.setAttribute("datas", datas);

		ActionForward forward=new ActionForward();
		if(boardDTO!=null) {
			request.setAttribute("data", boardDTO);
			forward.setRedirect(false);
			forward.setPath("board.jsp");
		}
		else {
			forward.setRedirect(true);
			forward.setPath("error.do");
		}
		return forward;
	}

}
