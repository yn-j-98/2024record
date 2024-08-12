<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 화면</title>
</head>
<body>
   <!-- 1. 회원가입 버튼 -->
   <h2>회원가입 화면</h2>
   <hr>
   <form action="ctrl_join.jsp" method="POST">
      <table>
         <tr>
            <td>아이디</td>
           <%--  <td><input type="text" name="mid" required></td>--%>
            <td><input type="text" name="member_id" required></td>
         </tr>
         <tr>
            <td>비밀번호</td>
           <%-- <td><input type="password" name="password" required></td>--%>
            <td><input type="password" name="member_password" required></td>
         </tr>
         <tr>
            <td>이름</td>
           <%-- <td><input type ="text" name ="name" required></td>--%>
            <td><input type ="text" name ="member_name" required></td>
         </tr>
      </table>
      <input type="submit" class="button primary small" value="회원가입"> 
   </form>
   
   <!-- 2. 메인으로 돌아가기 버튼 -->
   <a href="main.jsp" class="button small">처음으로 돌아가기</a>
</body>
</html>