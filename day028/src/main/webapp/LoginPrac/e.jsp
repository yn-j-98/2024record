<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.ArrayList, day028.MemberDTO"%>

<%
	// 이전 페이지 세팅 ??
	String mid=request.getParameter("mid");
	String password=request.getParameter("password");
	String name=request.getParameter("name");
	
	
	
	//
	ArrayList<MemberDTO> datas=(ArrayList<MemberDTO>)session.getAttribute("datas");
	if(datas==null){
		datas=new ArrayList<MemberDTO>();
		session.setAttribute("datas", datas);
	}
	
	// M - INSERT
	MemberDTO data=new MemberDTO(); 
	// db에 값 넣기
	data.setMid(mid);
	data.setPassword(password);
	data.setName(name);
	datas.add(data);
	
	// 마지막은 어디로 향해야하는가?
	out.println("<script>alert('회원가입이 완료되었습니다!');location.href='a.jsp';</script>");
%>