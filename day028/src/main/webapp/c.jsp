<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<!DOCTYPE HTML>
<html>
<head>
<title>회원가입 화면</title>
<meta charset="utf-8" />

</head>
<body>
							<h2>회원가입 화면</h2>
						<form action="e.jsp" method="POST">
							<table>
								<tr>
									<td>아이디</td>
									<td><input type="text" name="mid" required></td>
								</tr>
								<tr>
									<td>비밀번호</td>
									<td><input type="password" name="password" required></td>
								</tr>
								<tr>
									<td>이름</td>
									<td><input type="text" name="name" required></td>
								</tr>
							</table>
							<input type="submit" class="button primary small" value="회원가입"> <a href="a.jsp" class="button small">처음으로 돌아가기</a>
						</form>
</body>
</html>