<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<table border="1">
		<tr>
			<td>이름</td>
			<td><%= request.getParameter("name") %></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><%= request.getParameter("password") %></td>
		</tr>
		<tr>
			<td>성별</td>
			<td><%= request.getParameter("gender") %></td>
		</tr>
		<tr>
			<td>관심 언어</td>
			<td><%
				String[] lang=request.getParameterValues("lang");
				for(String v:lang){
					out.println(v+"<br>");
				}
			%></td>
		</tr>
		<tr>
			<td>관심 언어</td>
			<td><%
				String[] lang2=request.getParameterValues("lang");
				for(String v:lang2){
				%>
					<%= v %> <br>
				<%
				}
			%></td>
		</tr>
		<tr>
			<td colspan="2" align="right"><a href="NewFile1.jsp">처음으로 돌아가기</a></td>
		</tr>
	</table>

</body>
</html>