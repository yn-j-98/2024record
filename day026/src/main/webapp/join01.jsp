<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import ="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String msg = "";
	
	if (request.getMethod().equals("POST")){
		ArrayList<String> datas = new ArrayList<String>();
		datas.add("teemo");
		datas.add("ari");
	
	
		if(datas.contains(request.getParameter("id"))) { // 얘가 있니?
			msg ="이미 존재하는 아이디입니다";
		}
		else{
			msg = "사용 가능한 아이디입니다";
		}
	}
	
	%>

	<form method = "POST">
		아이디 <input type ="text" name = "id">
		<input type = "submit" value = "중복확인">
		
	
	
	</form>
	<hr>
	<% msg %>

</body>
</html>