<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "model.dto.BoardDTO, model.dto.ReplyDTO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board</title>
</head>
<body>


${data.title} <br>
${data.content} <br>
${data.writer} <br>
${data.cnt} <br>
${data.regtime} <br>

<hr>
<ul>
<c:forEach var="r" items="${datas}">
	<li>${r.writer} >> ${r.content}</li>
</c:forEach>
</ul>
<hr>
<a href="main.do">메인으로 이동</a>
</body>
</html>