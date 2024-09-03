<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib tagdir="/WEB-INF/lib/tags" prefix="mytag" %> 
<!DOCTYPE html>
<html> 
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 
 <!-- C에서 받아온 DATA의 (글)제목, (글)내용, (글)작성자, (글)번호, (글)작성 시간 -->
${data.title} <br>
${data.content} <br>
${data.writer} <br>
${data.cnt} <br>
${data.regtime} <br> 

<hr>

<!-- 커스텀 태그(reply.tag) datas 변수 전달 -->
<mytag:reply datas="${datas}" />

<hr>

<a href="main.do">메인으로 이동</a>

</body>
</html>