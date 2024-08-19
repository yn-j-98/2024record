<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>session 내장객체의 scope</title>
</head>
<body>

	<%
		if(session.isNew()){
			session.setAttribute("member","작은티모");
			out.println("<script>alert('새로운 session을 연결합니다! :D');</script>");
		}
	%>

	<%=session.getAttribute("member")%>님, 안녕하세요!	:D

</body>
</html>