<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script src="https://code.jquery.com/jquery-3.7.1.min.js"
		integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
		crossorigin="anonymous"></script>
	<script>
		$(document).ready(function() {
			// console.log('jQuery CDN 연결완료');
			$("h1").css('color','red');
			$("#banana").css('color','blue');
			$(".kiwi").css('color','green');
		});
	</script>
	
	<h1>사과</h1>
	<h2 id="banana">바나나</h2>
	<h3 class="kiwi">키위</h3>

</body>
</html>