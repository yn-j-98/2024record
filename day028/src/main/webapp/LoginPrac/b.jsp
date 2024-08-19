<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, day028.MemberDTO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 버튼을 누르면 도착하는 페이지</title>
</head>
<body>
	<%
	String member = (String)session.getAttribute("member");
	ArrayList<MemberDTO> datas=(ArrayList<MemberDTO>)session.getAttribute("datas");
	%>

		<h1>메인 화면</h1>	
		<p><%=member%>님, 안녕하세요! :D</p>

<hr>
	<%
		if(datas == null){
		out.println("아직 가입한 회원이 없습니다!");
		}
		else{
	%>
<p>### 이 사이트의 회원목록 ###</p>
		<table>
			<tr>
			<td>아이디</td>
			<td>이름</td>
			</tr>
	<%
		for(MemberDTO data:datas){
		out.println("<tr><td>"+data.getMid()+"</td><td>"+data.getName()+"</td></tr>");
		}
	%>
		</table>
	<% } %>
		<a href="a.jsp">처음으로 돌아가기</a>

</body>
</html>