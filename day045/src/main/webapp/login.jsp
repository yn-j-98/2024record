<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
</head>
<body>

<form action="login.do" method="POST">
	아이디 <input type="text" name="mid" required> <br>
	비밀번호 <input type="password" name="password" required> <br>
	<input type="submit" value="로그인">
</form>

<hr>

<a href="main.do">메인으로 이동</a>

</body>
</html>