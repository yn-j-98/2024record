<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, member.MemberDTO"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
</head>
<body>

<h2>마이페이지</h2>
<hr>

    <!-- 1. 이름변경 버튼  -->
   <%--<form action ="ctrl_change" method = "POST"> --%>
   <form action ="ctrl_change.jsp" method = "POST">
   	  <input type = "text" name = "NAME" required placeholder="변경하실 이름을 입력해주세요.">
      <input type = "submit" value = "이름변경">
   </form>
      <br>
   <!-- 2. 회원탈퇴 버튼  -->
  <%-- <form action ="ctrl_Memberdelete" method="POST">--%>
   <form action ="ctrl_Memberdelete.jsp" method="POST">
      <input type = "submit" value = "회원탈퇴">
   </form>
   
   <!-- 3. 메인으로 돌아가기 버튼  -->
   <a href = "main.jsp"><button>메인으로 돌아가기</button></a>
   
</body>
</html>