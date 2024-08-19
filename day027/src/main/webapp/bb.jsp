<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글 등록 페이지</title>
</head>
<body>
<%
	String name=request.getParameter("name");
	if(name != null){
		session.setAttribute("member", name);
	}
	String member=(String)session.getAttribute("member");

	ArrayList<String> datas=(ArrayList<String>)session.getAttribute("datas");
%>

<a href="aa.jsp">처음으로 돌아가기</a>
<hr>
	<form action="cc.jsp" method="POST">
		<%=member%>님의 댓글 : <input type="text" name="msg" required> <input type="submit" value="댓글작성">
	</form>
<hr>
<%
	if(datas != null){
%>
		<ul>
			<% for(String data:datas){ %>
				<li><%= data %></li>
			<% } %>
		</ul>
<%
	}
	else{
		out.println("아직 작성된 댓글이 없습니다...");
	}
%>

</body>
</html>