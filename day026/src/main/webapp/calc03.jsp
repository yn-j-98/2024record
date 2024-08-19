<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean class = "calc.CalcBean" id = "cb"/>
<jsp:setProperty property = "*" name = "cb" />
<html>
<head>
<meta charset="UTF-8">
<title>계산기 실습 03</title>
</head>
<body>

<%
	cb.calc();
%>

<!--  form 태그의 필수 속성인 action을 설정하지 않으면, 자기자신 페이지(디폴트 설정)로 온다! -->
	<form method="POST">
		정수 01 <input type="number" name="num1"> <br> 
		연산자 <select name="op">
			<option>+</option>
			<option>-</option>
			<option>x</option>
		</select> <br> 
		정수 02 <input type="number" name="num2"> <br> 
		<input	type="submit" value="계산하기"> <br>
	</form>

	<hr>

	계산 결과 : <jsp:getProperty property = "res" name = "cb"/>

</body>
</html>