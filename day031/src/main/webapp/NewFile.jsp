<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="mytag" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커스텀태그 실습</title>
</head>
<body>


	<h1><mytag:hello /></h1>
	<hr>
	<mytag:table border="1" bgcolor="lightblue">태그바디 영역</mytag:table>
	<mytag:table border="10" bgcolor="pink">메세지를 넣으면 doBody 액션태그를 통해 출력할 수 있음</mytag:table>

</body>
</html>