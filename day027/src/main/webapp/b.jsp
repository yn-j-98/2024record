<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글 쓰기</title>
</head>
<body>

<a href="a.jsp">처음으로 돌아가기</a>
<hr>

<%
    // 세션에서 사용자 이름 가져오기 (유지되어야 하니까 ,,,)
    // session 타입은 object이기 때문에, 강제 형변환(String)
    String username =  (String)session.getAttribute("username");
%>
<form action="c.jsp" method="POST">
    <%= username %>님의 댓글 : <input type="text" name="comment" required placeholder="댓글을 입력해주세요."> 
    <input type="submit" value="댓글등록">
</form>

<hr>
<%
    // 세션에서 댓글 목록 가져오기
    ArrayList<String> comments = (ArrayList<String>) session.getAttribute("comments");
    if (comments == null) { // 댓글이 없을 때 (초기 화면)
    	out.println("댓글을 작성해보세요!");
        comments = new ArrayList<String>();
        session.setAttribute("comments", comments);
    }

    // 댓글 목록 출력
    out.println("<ul>");
    for (String comment : comments) {
        out.println("<li>" + comment + "</li>");
    }
    out.println("</ul>");
%>

</body>
</html>
