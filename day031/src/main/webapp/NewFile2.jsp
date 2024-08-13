<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>application 실습 02</title>
</head>
<body>

<%
	int count=(Integer)application.getAttribute("count");
	count++;
	application.setAttribute("count", count);
%>
현재 방문자 수 : <%=count %>명

</body>
</html>