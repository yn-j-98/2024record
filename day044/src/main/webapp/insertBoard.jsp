<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 작성 페이지</title>
</head>
<body>
	<form action="insertBoard.do" method="POST">
		내용 <input type="text" name="content" required placeholder="반드시 작성해주세요"> <br> 
		제목 <input type="text" name="title" required placeholder="반드시 작성해주세요"> <br>
		작성자 <input type="text" name="writer" value="${loginInfo}" readonly> <br>
				<input type="submit" value="글 작성">
	</form>
	<input type="text" name="content" required>
	<input type="text" name="title" required>
	<input type="text" name="writer" required>

</body>
</html>