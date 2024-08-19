<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import ="java.util.ArrayList" %>
<!DOCTYPE html>
<jsp:useBean id="dao" class = "joinmember.DAO"/>
<jsp:useBean id="dto" class = "joinmember.DTO"/>
<jsp:setProperty property="*" name="dto"/>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
<h1>회원가입</h1>

<form method ="POST">
	아이디 <input type = "text" name ="id" required>
	<br>
	비밀번호 <input type = "password" name = "password" required>
	<br>
	비밀번호 확인 <input type="password" name="confirmPassword" required>
	<input type = "submit" value = "회원가입">
</form>

<hr>

<%
    String id = request.getParameter("id");
    String password = request.getParameter("password");
    String confirmPassword = request.getParameter("confirmPassword");
    
    if (request.getMethod().equals("POST")) {
        dto.setId(id);
        dto.setPassword(password);
        
        if (password != null && confirmPassword != null && password.equals(confirmPassword)) {
            // 비밀번호가 일치하는 경우
            dto.setCondition("IS_UNIQUE");
            if (dao.selectOne(dto) != null) { // 아이디 중복 확인
%>
                이미 사용중인 아이디입니다. 다른 아이디를 입력해주세요.
<%
            } else {
                // 아이디가 중복되지 않은 경우 회원가입 처리
                dto.setCondition(null); // 회원가입이므로 조건을 null로 설정
                dao.insert(dto);
%>
                회원가입이 완료되었습니다!
<%
            }
        } else {
%>
            비밀번호가 일치하지 않습니다. 다시 확인해주세요.
<%
        }
    }
%>



</body>
</html>