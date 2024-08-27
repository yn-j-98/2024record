package controller.async;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.dao.MemberDAO;
import model.dto.MemberDTO;

@WebServlet("/checkMid")
//아이디 중복검사를 위한 SERVLET 파일
public class CheckMid extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CheckMid() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// V에서 mid 파라미터를 가져온다
		String mid = request.getParameter("mid");
		// 받아온 mid를 저장할 객체를 생성한다 (DB연동)
		MemberDAO memberDAO=new MemberDAO();
		MemberDTO memberDTO=new MemberDTO();
		// 컨디션값에 맞는 쿼리문을 불러온다 == 회원 조회를 위한 조건 설정
		memberDTO.setCondition("CHECKMID");
		// 쿼리문 안에 ? 부분(mid=?)에 V에서 받아온 값을 넣는다
		memberDTO.setMid(mid);
		// DAO의 SELECTONE 을 수행한다
		memberDTO = memberDAO.selectOne(memberDTO);
		// 중복 검사 FLAG
		boolean flag = false;
		// DTO(DB)에서 V에서 받아온 MID값이 없다면
		if(memberDTO == null){
			flag = true;
		}
		// FLAG 값을 V에게 출력(T/F)
		response.getWriter().print(flag);
	}
}
