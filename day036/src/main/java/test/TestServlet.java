//package test;
//
//import java.io.IOException;
//import java.io.PrintWriter;
//
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//
//@WebServlet("*.do")
//public class TestServlet extends HttpServlet {
//	private static final long serialVersionUID = 1L;
//	
//	private boolean flag=false; // DB에 저장된 데이터라는 뜻
//       
//    /**
//     * @see HttpServlet#HttpServlet()
//     */
//    public TestServlet() {
//        super();
//        // TODO Auto-generated constructor stub
//    }
//
//	/**
//	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
//	 */
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		System.out.println("GET 요청 도착");
//		
//		flag = !flag; // false <<--->> true
//		
//		PrintWriter out=response.getWriter();
//		out.print(flag);
//	}
//
//	/**
//	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
//	 */
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		System.out.println("POST 요청 도착");
//	}
//
//}
