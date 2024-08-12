<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.ArrayList, product.ProductDTO" %>
<jsp:useBean id="memberDAO" class="member.MemberDAO" />
<jsp:useBean id="memberDTO" class="member.MemberDTO" />
<jsp:setProperty property="*" name="memberDTO" />
<jsp:useBean id="productDAO" class="product.ProductDAO" />
<jsp:useBean id="productDTO" class="product.ProductDTO" />
<jsp:setProperty property="*" name="productDTO" />
<%
	String action=request.getParameter("action");
	System.out.println("action : "+action);
	
	if(action.equals("LOGIN")){
		memberDTO.setSearchKeyword("LOGIN");
		memberDTO=memberDAO.selectOne(memberDTO);
		if(memberDTO==null){
			out.println("<script>alert('로그인 실패!');location.href='controller.jsp?action=MAIN';</script>");
		}
		else{
			session.setAttribute("member", memberDTO.getMid());
			if(memberDTO.getRole().equals("ADMIN")){
				response.sendRedirect("controller.jsp?action=ADMIN");
			}
			else{
				session.setAttribute("cart", new ArrayList<Integer>());
				out.println("<script>alert('로그인 성공!');location.href='controller.jsp?action=MAIN';</script>");
			}
		}
	}
	else if(action.equals("LOGOUT")){
		session.removeAttribute("member");
		session.removeAttribute("cart");
		out.println("<script>alert('로그아웃 성공!');location.href='controller.jsp?action=MAIN';</script>");
	}
	else if(action.equals("MAIN")){
		if(productDTO.getSearchKeyword()==null){
			productDTO.setSearchKeyword("ALL");
		}
		request.setAttribute("datas", productDAO.selectAll(productDTO));
		pageContext.forward("main.jsp");
	}
	else if(action.equals("PRODUCT")){
		request.setAttribute("data", productDAO.selectOne(productDTO));
		pageContext.forward("product.jsp");
	}
	else if(action.equals("CHANGENAME")){
		memberDTO.setMid((String)session.getAttribute("member"));
		memberDAO.update(memberDTO);
		session.removeAttribute("member");
		out.println("<script>alert('이름변경 성공! 다시 로그인 해주세요!');location.href='controller.jsp?action=MAIN';</script>");
	}
	else if(action.equals("DELETEID")){
		memberDTO.setMid((String)session.getAttribute("member"));
		memberDAO.delete(memberDTO);
		session.removeAttribute("member");
		out.println("<script>alert('회원탈퇴 성공! 이용해주셔서 감사합니다!');location.href='controller.jsp?action=MAIN';</script>");
	}
	else if(action.equals("MYPAGE")){
		memberDTO.setMid((String)session.getAttribute("member"));
		memberDTO.setSearchKeyword("NAME");
		request.setAttribute("name", memberDAO.selectOne(memberDTO).getName());
		pageContext.forward("mypage.jsp");
	}
	else if(action.equals("JOIN")){
		memberDAO.insert(memberDTO);
		out.println("<script>alert('회원가입 성공! 로그인 후 이용해주세요!');location.href='controller.jsp?action=MAIN';</script>");
	}
	else if(action.equals("ADMIN")){
		productDTO.setSearchKeyword("ALL");
		request.setAttribute("datas", productDAO.selectAll(productDTO));
		pageContext.forward("admin.jsp");
	}
	else if(action.equals("INSERTPRODUCT")){
		productDAO.insert(productDTO);
		response.sendRedirect("controller.jsp?action=ADMIN");
	}
	else if(action.equals("DELETEPRODUCT")){
		productDAO.delete(productDTO);
		response.sendRedirect("controller.jsp?action=ADMIN");
	}
	else if(action.equals("ADDCART")){
		ArrayList<Integer> cart=(ArrayList<Integer>)session.getAttribute("cart");
		cart.add(productDTO.getNum());
		out.println("<script>alert('장바구니에 추가 완료!');location.href='controller.jsp?action=MAIN';</script>");
	}
	else if(action.equals("CART")){
		ArrayList<ProductDTO> datas=new ArrayList<ProductDTO>();
		for(int v:(ArrayList<Integer>)session.getAttribute("cart")){
			productDTO.setNum(v);
			datas.add(productDAO.selectOne(productDTO));
		} 
		request.setAttribute("datas", datas);
		pageContext.forward("cart.jsp");
	}
	else{
		out.println("<script>alert('처리할 수 없는 요청입니다!');histroy.go(-1);</script>");
	}
%>