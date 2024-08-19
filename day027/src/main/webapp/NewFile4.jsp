<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포워드(forward) 방식으로 데이터를 전송</title>
</head>
<body>

	 <jsp:forward page="NewFile6.jsp">
	 	<jsp:param value="키위" name="kiwi" />
	 </jsp:forward>

</body>
</html>