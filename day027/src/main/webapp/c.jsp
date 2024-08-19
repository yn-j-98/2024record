<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import ="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글 등록</title>
</head>
<body>

<%
    // 세션에서 사용자 이름 가져오기
    String username = (String) session.getAttribute("username");

    // 세션에서 댓글 목록 가져오기
    ArrayList<String> comments = (ArrayList<String>) session.getAttribute("comments");
    if (comments == null) {
        comments = new ArrayList<String>();
        session.setAttribute("comments", comments);
    }
    
    // POST 요청일 때 댓글을 처리
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String comment = request.getParameter("comment");
        comments.add(username + ">> " + comment);
 		session.setAttribute("comments", comments); // 세션에 댓글 목록 저장
    }
    
    // b.jsp로 리다이렉트
    response.sendRedirect("b.jsp");
%>

</body>
</html>
