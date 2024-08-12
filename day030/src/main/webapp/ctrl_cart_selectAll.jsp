<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, product.ProductDTO" %>
<jsp:useBean class="product.ProductDTO" id="data"></jsp:useBean>
<jsp:setProperty property="*" name=""/>
<%
/*
cart.jsp				-> 내가할일 (checkbox로 넘어올예정)
   1. 장바구니 목록 출력
      상품 선택 버튼
   2. 구매
   3. 메인으로 돌아가기 버튼
*/
ArrayList<ProductDTO> datas = (ArrayList<ProductDTO>)session.getAttribute("cart");
if(datas == null){
	pageContext.forward("main.jsp");
}
else{	
//	request.setAttribute("datas", datas);
	request.setAttribute("cart", datas); // view에서 cart를 받을 거기 때문에 datas -> cart로 수정
	pageContext.forward("cart.jsp");
}


%>