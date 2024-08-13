<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, product.ProductDTO" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 
<ol>
	<c:forEach var="data" items="${datas}">
		<li>
			${data.name} ${data.price}원
		</li>
	</c:forEach>
</ol>
<hr>
2. 구매
<hr>
<a href='controller.jsp?action=MAIN'>메인으로 돌아가기</a>

</body>
</html>