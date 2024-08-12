<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//-> 로그아웃 받으면 -> session값을 지우고

//logout 클릭시 넘어오는 페이지
//넘어오면 바로 sossion 값에 mid값을 삭제

session.removeAttribute("member_id");
response.sendRedirect("main.jsp");	



%>
