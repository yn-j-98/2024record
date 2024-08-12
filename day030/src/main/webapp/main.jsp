<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="product.ProductDTO"%>
<jsp:useBean id="productDTO" class="product.ProductDTO"></jsp:useBean>
<jsp:setProperty property="*" name="productDTO"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
<style>

	#login{
		width:300px;
		margin: 0 auto;
		padding:20px;
		transform:translateY(20%);
		text-align:center;
		border:1px solid #707070;
		background-color:lightblue;
	}
	#login > * {
		
		padding:20px;
	}
	#content{
		width:500px;
		margin:20px auto 0; 
		transform: translateY(40%);
		text-align:center;
		border:1px solid #707070;
		padding:20px;
	}
	#content > * {
		padding:20px;
	}
</style>
</head>
<body>
   <!-- color:#fff; -->
   <%
	 // c한테 setAttribute해서 줘~~
     ArrayList<ProductDTO> datas= (ArrayList<ProductDTO>)request.getAttribute("datas");
    // c에서 아이디값이 있는지 받아오기 
   	//String mid = (String)session.getAttribute("member_mid"); //수정했습니다.
   	 String mid = (String)session.getAttribute("member_id");
   %>
   
   <!-- 로그아웃 / 마이페이지 / 장바구니 / 로그인 / 회원가입 -->
   <div id="login">
      <%
      	//아이디값이 있다면
         if(mid != null){
      %>
      <!-- 로그인 시 나오는 메뉴 -->
        <form action="ctrl_logout.jsp" method="GET">
<%--        <form action="ctrl_logout" method="GET"> --%>
        	<input type="submit" value="로그아웃">        
        </form>         
         <a href="mypage.jsp">마이페이지</a>
         <a href="ctrl_cart_selectAll.jsp">장바구니</a>
        <%--  <a href="ctrl_selectAll.jsp">장바구니</a> --%>
      <%
         }
      	//아이디가 없다면
         else{
      %>
      	 <!-- 로그아웃 시 나오는 메뉴 -->
         <form action="ctrl_login.jsp" method="POST">
            아이디 <input type="text" name="member_id" required> <br>
            비밀번호 <input type="password" name="member_password" required> <br>
            <input type="submit" value="로그인"> <br>
         </form>
         <a href="join.jsp">회원가입</a>
      <%      
         }
      %>
   </div>
   
   <!-- 상품 목록 출력 / 상품 선택 버튼 / 상품 검색 버튼 -->
   <div id="content">
    <form action="ctrl_searchAll.jsp" method="POST">
    	<input type="text" name="name">
    	<input type="submit" value="검색하기">
    </form>
      ### 상품 목록 ###
      <ol>
      <%
      if(datas != null){ //datas가 없으면 
      	//상품목록을 출력하는데
         for(ProductDTO data:datas) { //여기서 nullPoint 나올수있어서 추가했습니다
        	 // 재고가 있다
        	 if(data.getCnt()>0){
        		// 선택한 해당 상품으로 이동
            	out.println("<il><a href='ctrl_product.jsp?action=PRODUCT&num="+data.getNum()+"'>"+data.getName()+" "+data.getPrice()+"</a><il>");
            	//out.println("<il><a href='controller.jsp?action=PRODUCT&num="+data.getNum()+"'>"+data.getName()+"</a><il>");
        	 // 재고가 없다면
        	 }else{
        		 out.println("<li>[품절]"+data+"</li>");
        	 }
         }
      }
      %>
      </ol>
   </div>
   
</body>
</html>