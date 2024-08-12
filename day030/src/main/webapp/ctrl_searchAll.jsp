<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, product.ProductDTO" %>
<jsp:useBean class="product.ProductDAO" id="dao"></jsp:useBean>
<jsp:useBean class="product.ProductDTO" id="data"></jsp:useBean>
<jsp:setProperty property="*" name="data"/>
<%
/*
4. 상품 검색 버튼
*/

//String product_name = request.getParameter("product_name");
boolean flag = request.getMethod().equals("POST");

if(flag){ // POST방식으로 나오면 
	//-----------------------------------

	ArrayList<ProductDTO> datas  = dao.selectAll(data); //model에서 전체 상품 정보를 받아오고
	request.setAttribute("datas", datas); //해당 상품을 datas파라메터로 저장해서
	pageContext.forward("main.jsp");//main으로 전달한다.
}
else{
	response.sendRedirect("main.jsp");
}
%>