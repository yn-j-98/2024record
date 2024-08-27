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
public class CheckMid extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CheckMid() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid");
		
		MemberDAO memberDAO=new MemberDAO();
		MemberDTO memberDTO=new MemberDTO();
		memberDTO.setCondition("CHECKMID");
		memberDTO.setMid(mid);
		memberDTO = memberDAO.selectOne(memberDTO);
		boolean flag = false;
		if(memberDTO == null){
			flag = true;
		}
		response.getWriter().print(flag);
	}
}
