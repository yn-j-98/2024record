<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean class="product.ProductDAO" id="productDAO"/>
<jsp:useBean class="product.ProductDTO" id="productData"/>
<jsp:setProperty property="*" name="productData" />

<%
    // POST 요청인지 확인
    if(request.getMethod().equals("POST")) {
        // 뷰에서 전달된 이름과 번호(PK)를 받아옵니다.
        String productName = request.getParameter("product_name");
        int productNum = Integer.parseInt(request.getParameter("product_num"));

        // 데이터 객체에 받아온 이름과 번호를 설정합니다.
        productData.setName(productName);
        productData.setNum(productNum);

        // productDAO를 통해 DB에서 해당 상품을 삭제합니다.
        productDAO.delete(productData);
        //삭제완료되고 상품 목록을 보여줘야해서 forward로 추가했습니다.
        out.println("<script>alert('상품삭제를 완료했습니다.');history.go(-1);</script>");
        
    } else {
    	out.println("<script>alert('상품삭제에 실패했습니다.');history.go(-1);</script>");
    }
%>