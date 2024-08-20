<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
<h1>로그인</h1>
<hr>
<form action = "login.do" method="POST">
<table border = "1">
	<tr>
		<td>아이디</td><td><input type="text" required name ="mid"></td>
	</tr>
	<tr>
		<td>비밀번호</td><td><input type="password" required name ="password"></td>
	</tr>
	<tr>
		<td colspan ="2" align = "right"><input type="submit" value = "로그인"></td>
	</tr>
</table>
</form>
<hr>
<a href="main.do">메인으로 이동</a>


</body>
</html>