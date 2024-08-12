<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, product.ProductDTO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<ol>
<%
	for(ProductDTO data : (ArrayList<ProductDTO>)request.getAttribute("datas")){
		out.println("<li>"+data.getName()+" "+data.getPrice()+"원</li>");
	}
%>
</ol>
<hr>
2. 구매
<hr>
<a href='controller.jsp?action=MAIN'>메인으로 돌아가기</a>

</body>
</html>