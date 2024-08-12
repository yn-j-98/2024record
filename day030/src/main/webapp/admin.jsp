<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="product.ProductDTO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	h1{
		text-align:center;
	}
	.content_box{
		width:50%;
		margin:0 auto;
		display:flex;
		flex-direction:column;
		justify-content:space-between;
	}
	.content_box input[type=text]{
		width:250px;
	}	
	.content_box > .product_add, 
	.content_box > .product_delete{
		border:1px solid #707070;
		padding:10px;
		margin: 0 0 20px 0;
		text-align:center;
	}
	.content_box > .product_add  div,
	.content_box > .product_delete  div{
		margin:20px;
	}
	.product_list{
		text-align:center;
		width:50%;
		margin:0 auto;
	}
	.logout{
		width:100%;
		text-align:right;
	}
</style>
<body>
<h1>Admin</h1>
<div class="content_box">
  	<%
		// 일회성으로 datas 내용을 받아와야할때 
		// request로 c에게 데이터 요청
		ArrayList<ProductDTO> datas = (ArrayList<ProductDTO>)request.getAttribute("datas");
	%> 
	<!-- 1. 상품추가 버튼 -->
	<div class="product_add">
		<form action="ctrl_add.jsp" method="POST">
			<h3>상품 추가하기</h3>
			<div>
				상품명<input type="text" name="name" placeholder="상품명을 입력해주세요">
				상품 가격<input type="text" name="price" placeholder="상품 가격을 입력해주세요">
			</div>
			<div>
				상품 재고<input type="text" name="cnt" placeholder="재고개수를 입력해주세요">
				상품 판매자<input type="text" name="seller" placeholder="상품 판매자를 입력해주세요">
			</div>
			<div>
				상품 설명<input type="text" name="details" placeholder="상품 설명을 입력해주세요">
			</div>
			<input type="submit" value="추가">
		</form>	
	</div>
	<!-- 2. 상품삭제 버튼 -->
	<div class="product_delete">
		<form action="ctrl_delete.jsp" method="POST">
			<h3>상품 삭제하기</h3>
			<div>
				상품 번호<input type="text" name="product_num" placeholder="삭제할 상품 번호을 입력해주세요">
				상품명<input type="text" name="product_name" placeholder="삭제할 상품명을 입력해주세요">
			</div>
			<input type="submit" value="삭제"> 
		</form>
	</div>
</div>
<hr>
<div class="product_list">
	<h2>전체 상품 목록</h2>
	<ul>
	<!-- 전체 상품 목록 -->
 	<%
      	//상품목록을 출력하는데
      if(datas != null){
         for(ProductDTO data:datas) {
        	 // 재고가 있다
        	 if(data.getCnt()>0){
        		 // 선택한 해당 상품으로 이동
            	out.println("<li><a href='controller.jsp?action=PRODUCT&num="+data.getNum()+"'>"+data+"</a></li>");
        	 // 재고가 없다면
        	 }else{
        		out.println("<li>[품절]"+data+"</li>");
        	 }
         }
      }else{
    	  out.println("<li>제품이 없습니다...</li>");
      }
 	
      %> 
	</ul>	
</div>
<hr>
<div class="logout">	
	<form action="ctrl_logout.jsp" method="GET">
<%--	<form action="ctrl_logout" method="GET"> --%>
		<input type="submit" value="로그아웃">
	</form>
</div>
</body>
</html>