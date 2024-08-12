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
		<input type="hidden" name="action" value="CHANGENAME">
			이름 <input type="text" name="name" value="<%=request.getAttribute("name")%>" required>
			<input type="submit" value="이름 변경하기">
</form>
<a href='controller.jsp?action=DELETEID'>회원탈퇴</a>
<hr>
<a href='controller.jsp?action=MAIN'>메인으로 돌아가기</a>

</body>
</html>