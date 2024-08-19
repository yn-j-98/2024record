<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방문자 이름 등록</title>
</head>
<body>

<h1>방문자 이름 등록</h1>

<!-- 사용자로부터 이름을 입력받기 위한 폼 -->
<form action="a.jsp" method="POST">
    이름: <input type="text" name="name" required placeholder="이름을 등록해주세요!">
    <input type="submit" value="등록">
</form>

<%
    // POST 요청일 때만 이름을 처리
    if ("POST".equalsIgnoreCase(request.getMethod())) { // session에 새로운 이름을 넣어야하는 상황이라면
        String name = request.getParameter("name"); // 폼에서 보낸 이름 가져오기
        session.setAttribute("username", name); // 세션에 사용자 이름 저장
        response.sendRedirect("b.jsp"); // b.jsp로 리다이렉트
    }
%>

</body>
</html>
