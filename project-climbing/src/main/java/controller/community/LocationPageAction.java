package controller.community;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import controller.common.Action;
import controller.common.ActionForward;
import controller.function.LoginCheck;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.board.BoardDAO;
import model.board.BoardDTO;

public class LocationPageAction implements Action { 

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		String path = "LocalCommunity.jsp"; // 지역글 검색 페이지로 이동
		boolean flagRedirect = false; // 포워드 방식 사용 여부 설정 (false = forward 방식)

		// 로그인 정보가 있는지 확인
		String login[] = LoginCheck.Success(request, response);

        // 뷰에서 전달받는 지역 값 (SEOUL, GYEONGGI, INCHEON, CHUNGNAM)
        String view_Location = request.getParameter("board_location");
        
        // 검색 키워드 (제목 검색)
        String keyword = request.getParameter("board_keyword");

        // 지역명 맵핑
        String location = Location(view_Location);

        int pageNum = 1; // 페이지 번호 초기화
        if (request.getParameter("page") != null) {
            pageNum = Integer.parseInt(request.getParameter("page")); // 페이지 번호 가져오기
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
        BoardDTO boardDTO = new BoardDTO(); // 게시글 DTO 객체 생성
        BoardDAO boardDAO = new BoardDAO(); // 게시글 DAO 객체 생성

        boardDTO.setModel_board_location(view_Location);
        boardDTO.setModel_board_min_num(maxBoard);
        boardDTO.setModel_board_max_num(maxBoard);
        boardDTO.setModel_board_searchKeyword(keyword);
        
        boardDTO.setModel_board_condition("BOARD_ALL_SEARCH_LOCATION_TITLE");
        ArrayList<BoardDTO> datas = boardDAO.selectAll(boardDTO);
        
        BoardDTO boardCount = new BoardDTO();
        boardCount.setModel_board_condition("BOARD_ONE_SEARCH_LOCATION_COUNT");
        boardCount = boardDAO.selectOne(boardCount);
        listNum = boardCount.getModel_board_total();
        
        
        request.setAttribute("currentPage", pageNum);
        request.setAttribute("model_board_page_total", listNum);
        request.setAttribute("datas",datas);
        return forward;
	}
     /* 뷰에서 전달받은 지역 값을 실제 지역명으로 변환하는 함수
     */
     public String Location(String view_Location) {
        Map<String, String> locationMap = new HashMap<>();
        locationMap.put("SEOUL", "서울특별시");
        locationMap.put("GYEONGGI", "경기도");
        locationMap.put("INCHEON", "인천");
        locationMap.put("CHUNGNAM", "충청남도");

        return locationMap.getOrDefault(view_Location, "서울특별시"); // 기본값은 서울특별시
        //getOrDefault  Map 인터페이스에서 제공하는 메서드로, 
        //특정 키에 해당하는 값을 반환하되,
        //만약 그 키가 존재하지 않으면 기본값을 반환하는 역할을 합니다.
    }


}
