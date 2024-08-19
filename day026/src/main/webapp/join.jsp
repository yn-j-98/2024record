<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
 <h1>회원가입</h1>

    <form method="post" action="join.jsp">
        아이디 : <input type="text" id="username" name="username" required>
        <br>
        비밀번호 : <input type="password" id="password" name="password" required>
        <br>
     
        <input type="submit" value="회원가입">
    </form>

    <%
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if (username != null && password != null) {
            if ("teemo".equals(username)) {
                out.println("<p>이미 있는 ID입니다.</p>");
            } 
            else {
                out.println("<p>회원가입 성공!</p>");
            }
        }
    %>
</body>
</html>	