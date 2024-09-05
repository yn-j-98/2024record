<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="mytag" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 
${data.title} <br>
${data.content} <br>
${data.writer} <br>
${data.cnt} <br>
${data.regtime} <br>

<hr>

<mytag:reply datas="${datas}" />

<hr>

<a href="main.do">메인으로 이동</a>

</body>
</html>