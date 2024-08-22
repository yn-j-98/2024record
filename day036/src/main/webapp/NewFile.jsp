<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비동기 처리</title>
</head>
<body>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#btn").click(function(){
			$.ajax({
				type : "GET", // 요청 메서드
				url : "main.do", // 요청할 URL
				dataType : "text", // 서버에서 응답해오는 데이터의 형식
				success : function(data){ // 콜백 함수(응답을 받아야 수행한다)
					console.log("data는 서버에서 응답한 데이터");
					console.log(data);
					if(data == 'true'){
						// 좋아요를 누른 행위
						$("#fav").text("♥");
					}
					else{
						// 좋아요를 취소한 행위
						$("#fav").text("♡");
					}			
				},
				error : function(error){
					console.log("응답 실패...");
					console.log(error);
				}
			});
		});
	});
</script>

<button id="btn">좋아요</button>
<span id="fav">♡</span>

</body>
</html>