<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
</head>
<body>

<img alt="${data.name}님의 프로필 이미지" src="images/${data.imagepath}">
<ul>
	<li>아이디 >> ${data.mid}</li>
	<li>이름 >> ${data.name}</li>
</ul>

<hr>

<a href="main.do">메인으로 이동</a>
<a href="insertBoardPage.do">글 작성 페이지로 이동</a>

</body>
</html>