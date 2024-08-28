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

// 메서드 강제 오버라이딩을 위해 Action 인터페이스를 구현
public class BoardAction implements Action {

	// 요청을 처리하고 ActionForward 객체를 반환하는 execute 메서드
	// implements Action 
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		// V에서 받아온 bid 파라미터를 추출하고 정수로 형변환
		int bid=Integer.parseInt(request.getParameter("bid"));
		
		// DB에서 정보를 조회하기 위해 객체 생성
		BoardDAO boardDAO=new BoardDAO();
		BoardDTO boardDTO=new BoardDTO();
		// 조회하기위해 bid를 set
		boardDTO.setBid(bid);
		// DB에서 bid와 일치하는 board 정보를 조회하여 boardDTO에 저장
		boardDTO=boardDAO.selectOne(boardDTO);
		
		// DB에서 댓글 정보를 조회하기 위해 객체 생성
		ReplyDAO replyDAO=new ReplyDAO();
		ReplyDTO replyDTO=new ReplyDTO();
		// 조회하기위해 bid를 set
		replyDTO.setBid(bid);
		// 특정 boardID에 해당하는 모든 댓글 조회
		ArrayList<ReplyDTO> datas=replyDAO.selectAll(replyDTO);
		// 조회된 댓글 데이터를 request 속성에 저장
		request.setAttribute("datas", datas);

		// ActionForward 객체를 생성하여 페이지 전환 정보를 설정
        ActionForward forward = new ActionForward();
        
        // 조회된 보드 정보가 null이 아닌 경우, 페이지를 'board.jsp'로 설정
        if (boardDTO != null) {
            // 보드 정보를 request 속성에 저장.
            request.setAttribute("data", boardDTO);
            // 리다이렉트가 아닌 포워딩을 설정
            forward.setRedirect(false);
            // 페이지 경로를 'board.jsp'로 설정
            forward.setPath("board.jsp");
        } else {
            // 보드 정보가 null인 경우, 에러 페이지로 리다이렉트
            forward.setRedirect(true);
            // 에러 페이지 경로를 'error.do'로 설정
            forward.setPath("error.do");
        }
        
        // 설정된 ActionForward 객체를 반환
        return forward;
	}

}
