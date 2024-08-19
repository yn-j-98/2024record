<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 선택</title>
</head>
<body>
<a href = "d.jsp">처음으로 돌아가기</a>
<hr>
<h3><%= request.getParameter("name") %>님, 장바구니에 추가할 상품을 선택해주세요.</h3>	
<hr>
<form action = "f.jsp" method = "post">
	<select name = "product">
		<option value="사과">사과</option>
        <option value="수박">수박</option>
        <option value="메론">메론</option>
        <option value="딸기">딸기</option>
        <option value="참외">참외</option>
	</select>
	<input type="submit" value="장바구니에 추가하기">
</form>
	<hr>
		<form action="g.jsp" method="post">
			<input type="submit" value="계산하기">
    	</form>
</body>
</html>