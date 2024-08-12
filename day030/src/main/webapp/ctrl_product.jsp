<%@page import="product.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean class="product.ProductDAO" id="dao"></jsp:useBean>
<jsp:useBean class="product.ProductDTO" id="data"></jsp:useBean>
<jsp:setProperty property="*" name="data"/>
<%
/*
product.jsp				-> 내가할일
   1. 상품 설명 출력
   2. 장바구니에 추가 버튼
   3. 메인으로 돌아가기 버튼
*/
	//System.out.print(data.getNum());
	ProductDTO dto = dao.selectOne(data); //model에 product_num을 전달해서
	if(dto != null){	
		request.setAttribute("data", dto);//검색된 값을 data파라미터로
		pageContext.forward("product.jsp");//product.jsp로 전달해준다.
	}
	else{
		response.sendRedirect("main.jsp");
		//System.out.print(data.getNum());
	}

%>