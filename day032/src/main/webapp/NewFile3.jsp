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

	window.onload = function(){}
	//var btn = document.getElementById('btn');
	var btn = document.querySelector('#btn');
	// HTML 문서에.Id 이름으로 요소를 받아올래('btn' 이라는 이름이야);
		btn.onclick = function(){
			window.open('https://www.naver.com/');
			// 인자를 통해 세 탭 x = > 새창, 화면전환 등의 설정을 추가할수도 있음
		};
	};
</script>

	<button id="btn">버튼 클릭</button>

</body>
</html>