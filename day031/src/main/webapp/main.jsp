<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="product.ProductDTO, java.util.ArrayList" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="mytag" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="login">
	<!-- 커스텀태그 사용 -->
	<!-- 왜쓰냐 ??? 잘 돌아가는 것을 모듈화 하기 위해 하는것! 가독성!!! -->
	<mytag:login/>
</div>
<br><br><br>
<div id="content">
	<mytag:search /><br>
	 <!-- forEach? 타입 변수명 : 컬렉션명 -->
	 <!-- when ? 사용자가 들어온 링크가 베이지링크면 -->
	 <!-- 커스텀태그 사용 -->
	 <mytag:productlist>### 상품 목록 ###</mytag:productlist>
</div>
</body>
</html>