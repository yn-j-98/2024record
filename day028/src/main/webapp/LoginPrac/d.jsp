<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, day028.MemberDTO" %>
<%
	// id, pw db에서 꺼내오기
	String mid=request.getParameter("mid"); 
	String password=request.getParameter("password");
	

	
	ArrayList<MemberDTO> datas=(ArrayList<MemberDTO>)session.getAttribute("datas");
	if(datas==null){
		out.println("<script>alert('로그인에 실패했습니다!');history.go(-1);</script>");
	}
	else{
		boolean flag=false;
		String name="";
		for(MemberDTO data:datas){
			if(data.getMid().equals(mid)){
				if(data.getPassword().equals(password)){
					flag=true;
					name=data.getName();
					break;
				}
			}
		}	
		if(flag){
			session.setAttribute("member", name);
			response.sendRedirect("b.jsp");
		}
		else{
			out.println("<script>alert('로그인에 실패했습니다!');history.go(-1);</script>");
		}
	}
%>