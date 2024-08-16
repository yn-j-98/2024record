<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="mytag" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SSOOO SIMPLE MAIN PAGE</title>
</head>
<body>

<mytag:login member="${member}" /><br><br><br> 

<div id="content">
	<mytag:search />
	<mytag:list datas="${datas}">상품 목록</mytag:list>
</div>

</body>
</html>