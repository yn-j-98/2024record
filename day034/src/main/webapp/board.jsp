<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<c:if empty data ="데이터가 없습니다!">
${data.title} <br>
${data.content} <br>
${data.writer} <br>
${data.cnt} <br>
${data.regtime} <br>
</c:if>
</body>
</html>