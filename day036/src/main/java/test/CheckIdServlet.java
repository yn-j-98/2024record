package test;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.dao.IDDAO;
import model.dto.IDDTO;

@WebServlet("*.do") //.do 요청을 이 서블릿이 처리하도록 설정
public class CheckIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;



	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("GET 요청 도착");
		response.setContentType("text/plain"); // 응답의 콘텐츠 타입을 JSON으로 설정
		response.setCharacterEncoding("UTF-8"); // 응답의 문자 인코딩을 UTF-8로 설정

		String id = request.getParameter("id"); // 클라이언트에서 전송한 아이디 파라미터를 가져옵니다
		boolean flag = true; // 기본적으로 아이디가 사용 가능하다고 가정

		if (id != null && !id.trim().isEmpty()) { // 아이디가 유효한 경우
            IDDAO idDao = new IDDAO();
            IDDTO idDto = new IDDTO();
            idDto.setId(id);
            IDDTO result = idDao.selectone(idDto); // DAO를 통해 아이디 조회

            if (result != null) { // 아이디가 존재한다면
                flag = false; 
            }
        } else {
        	flag = false; 
        }

		// 응답 작성
		PrintWriter out = response.getWriter(); // 응답을 작성할 PrintWriter 객체 얻기
		out.print(flag); // 아이디 사용 가능 여부를 JSON 형식으로 응답
		out.flush(); // 출력 스트림을 플러시하여 응답을 클라이언트로 전송
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("POST 요청 도착");
	}

}
