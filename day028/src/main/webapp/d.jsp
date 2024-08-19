<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, day028.MemberDTO" %>
<jsp:useBean id="memberDAO" class="day028.MemberDAO" scope="session" />
<jsp:useBean id="memberDTO" class="day028.MemberDTO" />
<jsp:setProperty property="*" name="memberDTO" />

<%
	memberDTO=memberDAO.selectOne(memberDTO);
		
	if(memberDTO != null){
		session.setAttribute("member", memberDTO.getName());
		response.sendRedirect("b.jsp");
	}
	else{
		out.println("<script>alert('로그인에 실패했습니다!');history.go(-1);</script>");
	}
%>