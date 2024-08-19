<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
window.onload = function(){
	
	function test(){
		var btn=document.querySelector('#btn');
		function popup(){
			window.open('https://www.naver.com/');
		}
		btn.click=popup();
	}
	
	addEventListener('load',test);
	
};
</script>

	<button id="btn">버튼 클릭</button>

</body>
</html>