<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="controller.jsp" method="POST">
		<input type="hidden" name="action" value="JOIN">
			아이디 <input type="text" name="mid" required> <br>
			비밀번호 <input type="password" name="password" required> <br>
			이름 <input type="text" name="name" required> <br>
			<input type="submit" value="회원가입"> <br>
</form>
<hr>
<a href='controller.jsp?action=MAIN'>메인으로 돌아가기</a>

</body>
</html>