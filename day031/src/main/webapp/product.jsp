<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="product.ProductDTO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

상품명 : ${data.name} <br>
설명 : ${data.details} <br>
가격 : ${data.price}원<br>
재고 : ${data.cnt}개<br>
판매자 이름 :${data.sellerName}<br>
<hr>
<a href="controller.jsp?action=ADDCART&num=${data.num}">장바구니에 상품 추가</a>
<hr>
<a href='controller.jsp?action=MAIN'>메인으로 돌아가기</a>

</body>
</html>