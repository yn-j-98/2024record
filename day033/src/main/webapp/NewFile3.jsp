<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#box {
	width: 100px; /* 상자의 너비 */
	height: 100px; /* 상자의 높이 */
	background-color: red; /* 초기 배경 색상: 빨간색 */
	margin: 20px; /* 상자의 외부 여백 */
}
</style>
</head>
<body>
	<script src="https://code.jquery.com/jquery-3.7.1.min.js"
		integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
		crossorigin="anonymous"></script>

	<script>
	// 토글 사용하기 !
		$(document).ready(function() {
			$('#colorchange').click(function() {
				if($('#box').css('background-color') === 'rgb(255, 0, 0)') {
					$('#box').css('background-color', 'blue');
				} else {
					$('#box').css('background-color', 'red');

				}
			});
		});
	</script>
	
	<button id=colorchange>버튼</button>
	<div id="box"></div>
</body>
</html>