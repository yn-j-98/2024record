package test01;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/*
모든 Servlet 클래스 파일은 extends HttpServlet 을 상속받는다.
Student ProductDTO MemberDAO
가볍지 않음 == not POJO (Plain old java object)
 */

public class Test01 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	/*
	모든 Servlet 은 기본 생성자로 생성됨
	 */

    public Test01() {

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		out.println("<HTML>");
		out.println("<HEAD>");
		out.println("<TITLE>실습 탭</TITLE>");
		out.println("</HEAD>");
		out.println("<BODY>");
		out.println("<H1>Servlet 으로 작성한 페이지</H1>");
		out.println("<H3>" + new Date()+"</H3>");
		out.println("</BODY>");
		out.println("</HTML>");
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
