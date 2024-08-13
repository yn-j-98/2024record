<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>application 실습 01</title>
</head>
<body>

<!-- tomcat이 살아있어야 데이터가 살아있다. -->
<% application.setAttribute("count", 0); %>
<a href="NewFile2.jsp">페이지 방문하기</a>

</body>
</html>