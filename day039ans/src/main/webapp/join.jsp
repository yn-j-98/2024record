<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
</head>
<body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var checkMid = false; // : 아이디 체크를 했는지 확인해주는 전역변수
	
	function check(){
		var mid = $('input[name="mid"]').val(); // 지역변수, 입력된 아이디 값 가져오기
		$.ajax({
			url: "checkMid", // 아이디 중복 검사 요청을 보낼 url
			method: "POST",
			data: { mid : mid }, // 서버로 보낼 데이터
			success: function(data){
				console.log("["+data+"]"); // flag, 서버로부터 받은 응답데이터 console창에 보여주기
				checkMid = data; // 값을 전역변수에 저장
				if(checkMid == 'true'){ //아이디 중복검사 
					$("#checkMsg").text("사용가능한 아이디입니다.").css('color','green');
				}
				else{
					$("#checkMsg").text("이미사용중인 아이디입니다.").css('color','red');
				}
			}
		});
	}

	// 아이디 입력값이 변경(change)될 때마다 중복검사 수행하는 로직
	$('input[name="mid"]').on('change',function(){
		if($(this).val() !== ''){ // 입력값이 있다면
			check(); // 중복검사 실시
		}
	});
	// 회원가입 폼 (joinForm) 제출 시 아이디 중복검사
	$('#joinForm').on('submit',function(){
		if(checkMid != 'true'){ // checkMid : 아이디 체크를 했는지 확인해주는 전역변수
			alert('아이디 중복검사를 완료해주세요!');// 만약 중복검사를 안 했다면 띄워주는 알랏창
			return false; //폼 제출 막기
		}
	});
});
</script>

<form action="join.do" id="joinForm" method="POST" enctype="multipart/form-data">
<table border="1">
	<tr>
	 <!-- 아이디 중복 검사 결과를 보여줄 영역 -->
		<td>아이디</td><td><input type="text" required name="mid">&nbsp;<span id="checkMsg"></span></td>
	</tr>
	<tr>
		<td>비밀번호</td><td><input type="password" required name="password"></td>
	</tr>
	<tr>
		<td>비밀번호 확인</td><td><input type="password" required></td>
	</tr>
	<tr>
		<td>이름</td><td><input type="text" required name="name"></td>
	</tr>
	<tr>
		<td>프로필 이미지</td><td><input type="file" name="imagefile"></td>
	</tr>
	<tr>
		<td colspan="2" align="right"><input type="submit" value="회원가입"></td>
	</tr>
</table>
</form>

<hr>

<a href="main.do">메인으로 이동</a>

</body>
</html>