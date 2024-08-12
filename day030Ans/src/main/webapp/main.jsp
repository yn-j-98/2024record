<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="product.ProductDTO, java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div id="login">
	<%
		if(session.getAttribute("member") != null){
	%>
		<a href="controller.jsp?action=LOGOUT">로그아웃</a>
		<a href="controller.jsp?action=MYPAGE">마이페이지</a>
		<a href="controller.jsp?action=CART">장바구니</a>
	<%
		}
		else{
	%>
		<form action="controller.jsp" method="POST">
		<input type="hidden" name="action" value="LOGIN">
			아이디 <input type="text" name="mid" required> <br>
			비밀번호 <input type="password" name="password" required> <br>
			<input type="submit" value="로그인"> <br>
		</form>
		<a href="join.jsp">회원가입</a>
	<%
		}
	%>
</div>

<br><br><br>

<div id="content">
	<div id="search">
		<form action="controller.jsp" method="GET">
		<input type="hidden" name="action" value="MAIN">
			카테고리 <select name="searchKeyword">
				<option value="NAME">상품명</option>
				<option value="SELLER">판매자 이름</option>
			</select>
			<input type="text" name="searchContent" placeholder="검색어를 입력하세요.">
			<input type="submit" value="검색하기">
		</form>
	</div>
	### 상품 목록 ###
	<ol>
	<%
		for(ProductDTO data:(ArrayList<ProductDTO>)request.getAttribute("datas")){
			if(data.getCnt()<=0){
				out.println("<li>[품절] ["+data.getName()+"]</li>");
			}
			else{
				out.println("<li><a href='controller.jsp?action=PRODUCT&num="+data.getNum()+"'>["+data.getName()+"]</a></li>");
			}
		}
	%>
	</ol>
</div>

</body>
</html>