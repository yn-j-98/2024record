<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="product.ProductDTO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 페이지</title>
</head>
<body>
	
	<%
		ProductDTO data=(ProductDTO)request.getAttribute("data"); // c한테 데이터값 받아와서
		//ProductDTO data=(ProductDTO)request.getAttribute("product"); // c한테 데이터값 받아와서
	%>
	   <h2> 상품 설명 출력 </h2> 
   <p>---- <%=data.getName()%> 의 정보 ----</p> <!-- 상품이름 -->
   <ul> <!-- unorderlist로 출력할거야 -->
   <li>정보 : <%= data.getDetails() %></li> <!-- 1) 상품 상세정보 -->
   <li>가격 : <%= data.getPrice() %></li> <!-- 2) 상품 가격 -->
   <li>재고 : <%= data.getCnt() %></li> <!-- 3) 상품 재고 -->
   <li>판매자 : <%= data.getSeller() %></li> <!-- 4) 상품 판매자 이름 -->
   </ul>
   
   <!-- 2.장바구니에 추가 버튼 상품을 선택하고 추가 버튼을 눌렀을 때 CONTROLLER 페이지로 지금 보고 있는 상품의 데이터 전달 -->
   <form action="ctrl_cart_insert.jsp" method="GET"> <!-- 폼만들어서 -->
   <%--<form action="controller.jsp" method="GET"> <!-- 폼만들어서 --> --%>
      <input type="hidden" value="<%= data.getNum() %>" name="num"> <!-- 사용자 눈에 보이지않게 PK값 저장한뒤 -->
      <%-- <input type="hidden" value="<%= data.getNum() %>" name="product_num"> <!-- 사용자 눈에 보이지않게 PK값 저장한뒤 -->--%>
      <input type="submit" value="장바구니에 추가"  > <!-- 장바구니에 추가버튼 누르면 -->
   </form> <!-- PK값 C한테 전달 -->

   <!-- 3. 메인으로 돌아가기 버튼 메인으로 돌아가기 버튼을 눌렀을 때 메인 페이지로 돌아감 (상품 전체 목록을 출력해주는 화면 /
   로그인 직후 화면) -->
   <button onclick="location.href='main.jsp'">메인으로 돌아가기</button> <!-- 버튼 누르면 메인화면으로 돌아간다. -->
	
	
	
</body>
</html>