<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, product.ProductDTO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="controller.jsp?action=INSERTPRODUCT" method="POST">
	<input type="hidden" name="seller" value="${data.member}">
	상품명 <input type="text" name="name" required> <br>
	설명 <input type="text" name="details" required> <br>
	가격 <input type="number" name="price" required> <br>
	재고 <input type="number" name="cnt" required> <br>
	<input type="submit" value="상품등록"> <br>
</form>
<hr>
### 상품 목록 ###
	<ol> 
		<c:forEach var="data" items="${datas}">
			<li>
				<a href='controller.jsp?action=DELETEPRODUCT&num=${data.num}'>[${data.name}]
				</a>
			</li>
		</c:forEach>
	</ol>
<hr>
<a href='controller.jsp?action=LOGOUT'>로그아웃</a>

</body>
</html>