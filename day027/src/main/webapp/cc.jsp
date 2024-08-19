<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList" %>

<%
	String member=(String)session.getAttribute("member"); // 현재 로그인한 사용자이름
	String msg=request.getParameter("msg"); // b.jsp에서 건네준 msg
	msg = member + "님 >> " + msg;
	ArrayList<String> datas=(ArrayList<String>)session.getAttribute("datas");
	if(datas == null){ // 첫 댓글 추가
		datas=new ArrayList<String>();
		session.setAttribute("datas", datas);
	}
	datas.add(msg);
	
	response.sendRedirect("bb.jsp");
%>