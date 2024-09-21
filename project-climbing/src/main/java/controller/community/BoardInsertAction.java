package controller.community;

import java.util.HashMap;
import java.util.Map;

import controller.common.Action;
import controller.common.ActionForward;
import controller.function.LoginCheck;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.board.BoardDAO;
import model.board.BoardDTO;


public class BoardInsertAction implements Action{
//글작성페이지

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		//기본으로 넘어가야하는 페이지 와 redirect 여부를 설정
		ActionForward forward = new ActionForward();
		String path = "info.jsp";//메인커뮤니티페이지로 이동
		boolean flagRedirect = false;//포워드 방식으로

		//로그인 정보가 있는지 확인해주고
		String login[] = LoginCheck.Success(request, response);
		String member_id = login[0];//세션에 있는 사용자의 아이디
		
		System.out.println("로그인 확인: " + login);//로그인 확인 로그
		//만약 로그인 정보가 없다면
		if(member_id == null) {
			//로그인 페이지로 전달해줍니다.
			request.setAttribute("msg", "글 작성은 로그인 후 사용 가능합니다.");
			request.setAttribute("path", "LOGINPAGEACTION.do");
			
		}
		else {
	        // 요청에서 게시글 제목과 내용을 가져옴
			
	        String boardTitle = request.getParameter("VIEW_TITLE");
	        String boardContent = request.getParameter("VIEW_CONTENT");
	        String boardLocation = request.getParameter("board_location"); //지역은 아직 구현xx
	        
	        
	        
	        System.out.println("게시글 제목: " + boardTitle);//제목 로그
            System.out.println("게시글 내용: " + boardContent);//내용 로그
            System.out.println("게시글 작성자: " + member_id);//작성자 로그
	        
	        
	        // 게시글의 제목, 내용, 지역, 작성자를 DTO에 설정
	        BoardDTO boardDTO = new BoardDTO();
	        boardDTO.setModel_board_title(boardTitle);
	        boardDTO.setModel_board_content(boardContent);
	        
	        boardDTO.setModel_board_location(Location(boardLocation));
	        boardDTO.setModel_board_writer_id(member_id);
	        
	        // 게시글을 데이터베이스에 저장
	        BoardDAO boardDAO = new BoardDAO();
	        
	        request.setAttribute("msg", "글이 작성 완료");
	        request.setAttribute("path", "MainCommunityPage.do");
	        
	        boolean flag = boardDAO.insert(boardDTO);//글 insert 
	        if (!flag) {
	             //실패했을때
	        	request.setAttribute("msg", "글이 작성 실패");
	        	request.setAttribute("path", "INSERTBOARDPAGEACTION.do");
	        	
	        } 
	    }
    	forward.setPath(path);
    	forward.setRedirect(flagRedirect);
		return forward;
	
	}
	
    /* 뷰에서 전달받은 지역 값을 실제 지역명으로 변환하는 함수
    */
    public String Location(String view_Location) {
       Map<String, String> locationMap = new HashMap<String, String>();

       locationMap.put("SEOUL", "서울특별시");
       locationMap.put("GYEONGGI", "경기도");
       locationMap.put("INCHEON", "인천광역시");       
       locationMap.put("SEJONG", "세종특별자치도");
       locationMap.put("BUSAN", "부산광역시");
       locationMap.put("DAEGU", "대구광역시");
       locationMap.put("DAEJEON", "대전광역시");
       locationMap.put("GWANGJU", "광주광역시");
       locationMap.put("ULSAN", "울산광역시");
       locationMap.put("CHUNGCHEONGNAMDO", "충청남도");
       locationMap.put("CHUNGCHEONGBUKDO", "충청북도");
       locationMap.put("JEONLANAMDO", "전라남도");
       locationMap.put("JEONLABUKDO", "전라북도");
       locationMap.put("GYEONGSANGNAMDO", "경상남도");
       locationMap.put("GYEONGSANGBUKDO", "경상북도");
       locationMap.put("GANGWONDO", "강원도");
       locationMap.put("CHUNGNAM", "충청남도");

       return locationMap.getOrDefault(view_Location, "서울특별시"); // 기본값은 서울특별시
       //getOrDefault  Map 인터페이스에서 제공하는 메서드로, 
       //특정 키에 해당하는 값을 반환하되,
       //만약 그 키가 존재하지 않으면 기본값을 반환하는 역할을 합니다.
   }
	
}
