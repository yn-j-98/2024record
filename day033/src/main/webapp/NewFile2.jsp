<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	div {
		border : 1px solid black;
		margin : 5px;
		padding : 2px;
	}
</style>
</head>
<body>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"
		integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
		crossorigin="anonymous"></script>
<script>
	$(document).ready(function(){
		$('#area').mouseover(function(){
			$('#result').append('<h6>마우스OVER</h6>');
		});
	});
</script>

<div id="area"></div>
<div id="result"></div>

</body>
</html>