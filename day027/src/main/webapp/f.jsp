<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList"%>

	<% 
		String product=request.getParameter("product");
		// 장바구니를 세션에서 가져오기
		ArrayList<String> cart = (ArrayList<String>)session.getAttribute("cart");
			if(cart == null){ // 카트가 비어있을 때 (맨처음)
				cart = new ArrayList<>(); // 카트 객체 추가하기
				session.setAttribute("cart", cart); // 아까 선택한거 객체에 넣기
			}
		// 선택한 상품 장바구니에 추가	
		cart.add(product);
		
		//response.sendRedirect("e.jsp");
		out.println("<script>alert('장바구니에 상품을 추가했습니다!'); history.go(-1);</script>");
		//history.go(-1) 이전 페이지로 넘어가줄래? (==뒤로가기)
	%>
