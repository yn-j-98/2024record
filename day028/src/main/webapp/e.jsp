<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, day028.MemberDTO" %>
<jsp:useBean id="memberDAO" class="day028.MemberDAO" scope="session" />
<jsp:useBean id="memberDTO" class="day028.MemberDTO" />
<jsp:setProperty property="*" name="memberDTO" />
<%
	memberDAO.insert(memberDTO);
	out.println("<script>alert('회원가입이 완료되었습니다!');location.href='a.jsp';</script>");
%>