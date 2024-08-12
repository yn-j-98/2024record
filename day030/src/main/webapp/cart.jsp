<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="product.ProductDTO, java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니 페이지</title>
<style>
    /* ul의 기본 불릿을 없애기 위한 CSS */
    ul {
        list-style-type: none; /* 불릿을 제거 */
        padding: 0; /* 여백 제거 */
        margin: 0; /* 여백 제거 */
    }
    li {
        margin-bottom: 10px; /* 항목 사이에 여백 추가 */
    }
</style>
</head>
<body>
	<%
		ArrayList<ProductDTO> datas=(ArrayList<ProductDTO>)request.getAttribute("cart"); // c한테 장바구니 받아올거야!!
	%>
	
	<div id="cartlist">
	### 장바구니 목록 ###
	
	<ul> <!-- unorderList로 목록 작성 -->
<%-- 	<form action="ctrl_cart.jsp" method="GET"> <!-- 폼 만든 뒤 --%>
	<form action="ctrl_cart.jsp" method="POST"> <!-- 폼 만든 뒤 -->
	<%
		for(ProductDTO data:datas) { // 배열만큼 비교해서 // 장바구니 안에 목록들 전체 출력
			
	%>
	
		<label><li><input type="checkbox" name="cart_product" value=<%= data.getNum() %>> 
		<!-- 1. 상품 선택을 checkbox로 해서 구매하고 싶은 상품만 선택 후 -->
		<!-- PK값만 보낸다.(다시 얘네 가격만 더해서 줘) -->
			상품명 : <%= data.getName()+" " %>
			재고 : <%= data.getCnt()+" "  %>
			가격 : <%= data.getPrice()+" "  %>
			</li></label> <!-- 장바구니에 담긴 상품들 ul로 모두 출력 -->
			
	<%
		}
	%>
		<input type="submit" value="구매"> <!-- 2. 구매버튼 누르면 -->
	</form> <!-- 컨트롤에게 해당 데이터 보냄 -->
	</ul>
	
	</div>
	
	<button onclick="location.href='main.jsp'">메인으로 돌아가기</button> <!-- 3. 메인으로 돌아가는 버튼 -->
	
	
</body>
</html>