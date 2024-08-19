<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean class = "join.JoinBean" id = "jb"/>
<jsp:setProperty property = "*" name = "jb" />
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 폼</title>
</head>
<body>


	<h1>회원가입</h1>
	<form method = "post">
	
	아이디 : <input type = "text" name = "id" required>
	<br>
	비밀번호 : <input type = "password" name = "password" required>
	<br>
	
	
	<input type = "submit" value = "회원가입">
	
	
	</form>
  <%
//요청 방식이 POST일 때만 유효성 검사 메소드 호출
  if ("POST".equalsIgnoreCase(request.getMethod())) {
      jb.validate();
      
      // 검증 결과 메시지를 가져옵니다.
      String message = jb.getMessage();
      if (message != null && !message.isEmpty()) {
          // 메시지 출력
          out.println(message);
      }
  }
    %>

</body>
</html>