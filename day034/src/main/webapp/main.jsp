<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="mytag" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
</head>
<body>

<table border="1">
<c:forEach var="data" items="${datas}">
	<tr>
		<td><a href="board.do?bid=${data.bid}">${data.title}</a></td>
		<td>${data.writer}</td>
		<td>${data.regtime}</td>
	</tr>
</c:forEach>  
</table>

<hr>

<a href="joinPage.do">회원가입</a>
<a href="loginPage.do">로그인</a>
<a href="boardPage.do">글</a>
</body>

</body>
</html>