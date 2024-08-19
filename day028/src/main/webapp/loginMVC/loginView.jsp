<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
<h2>로그인 페이지</h2>
<hr>
	<form action = "d.jsp" method = "POST"> 
		아이디 <input type = "text" name="mid" required>
		<br>
		비밀번호 <input type = "password" name="password" required>
		<br>
		<hr>
		<input type = "submit" value="로그인">
	</form>
	<a href = "c.jsp"><button>회원가입</button></a>
	

</body>
</html>