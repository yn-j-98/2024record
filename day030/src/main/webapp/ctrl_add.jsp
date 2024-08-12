<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<jsp:useBean class="product.ProductDAO" id="productDAO"/>
<jsp:useBean class="product.ProductDTO" id="productData"/>
<jsp:setProperty property="*" name="productData" />

<%
    // POST 요청인지 확인
    if(request.getMethod().equals("POST")) {
        // 뷰에서 전달된 이름과 번호(PK)를 받아옵니다.
 
        // productDAO를 통해 DB에서 해당 상품을 삭제합니다.
        productDAO.insert(productData);
        out.println("<script>alert('상품등록에 성공했습니다.');history.go(-1);</script>");
        
    } else {
    	out.println("<script>alert('상품등록에 실패했습니다.');history.go(-1);</script>");
    }
%>