package test02;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Servlet implementation class Test02
 */
public class Test02 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Test02() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id,password;
		boolean flag=false;
		
		id=request.getParameter("id");
		password=request.getParameter("password");
		
		DAO dao=new DAO();
		DTO dto=new DTO();
		dto.setId(id);
		dto.setPassword(password);
		if(dao.selectOne(dto) != null) {
			flag=true;
		}
		
		String msg="실패...";
		if(flag) {
			msg="성공!";
		}
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		out.println("<HTML>");
		out.println("<HEAD>");
		out.println("<TITLE>끝 페이지</TITLE>");
		out.println("</HEAD>");
		out.println("<BODY>");
		out.println("<H1>"+msg+"</H1>");
		out.println("</BODY>");
		out.println("</HTML>");
	}

}
