<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복 체크</title>
</head>
<body>
	<script src="https://code.jquery.com/jquery-3.7.1.min.js"
		integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
		crossorigin="anonymous"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			
			 $("#checkButton").click(function(){
				var id = $('input[name=mid]').val(); // 입력 필드에서 아이디 값을 가져옵니다
	            
	            if (id) { 
					$.ajax({
						type : "GET",
						url : "CheckId.do",
						data: { id: id }, // 서버에 전송할 데이터 (아이디)
						dataType : "text", // 기본값: text, 즉..안써도됨
						success : function(data) { 
                                // 응답 텍스트를 그대로 처리
                                if (data.includes("true")) { // true 라면
                                    $("#result").text("아이디 사용 가능!");
                                } else if (data.includes("false")) { // false라면
                                    $("#result").text("아이디 중복!");
                                } else {
                                    $("#result").text("서버 응답 오류!");
                                }
                        },
                        error: function(error) {
                            console.error("요청실패 : " + error);
                            $("#result").text("오류 발생");
						}
					});
	            }
	            else { // 아이디가 입력되지 않은 경우
	                $("#result").text("아이디를 입력해 주세요"); // 아이디 입력 요구 표시
	            }
			
			});
		});
	</script>

	<h1>아이디 중복 체크</h1>
	<input type="text"  placeholder="아이디 입력" name="mid">
	<button id="checkButton">중복 체크</button>
	<p id="result"></p>
</body>
</html>