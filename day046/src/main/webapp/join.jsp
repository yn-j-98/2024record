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
		var mid = $('input[name="mid"]').val(); // 지역변수
		$.ajax({
			url: "checkMid",
			method: "POST",
			data: { mid : mid },
			success: function(data){
				console.log("["+data+"]"); // flag
				checkMid = data;
				if(checkMid == 'true'){
					$("#checkMsg").text("사용가능한 아이디입니다.").css('color','green');
				}
				else{
					$("#checkMsg").text("이미사용중인 아이디입니다.").css('color','red');
				}
			}
		});
	}

	$('input[name="mid"]').on('change',function(){
		if($(this).val() !== ''){
			check();
		}
	});
	
	$('#joinForm').on('submit',function(){
		if(checkMid != 'true'){ // checkMid : 아이디 체크를 했는지 확인해주는 전역변수
			alert('아이디 중복검사를 완료해주세요!');
			return false;
		}
	});
});
</script>

<form action="join.do" id="joinForm" method="POST" enctype="multipart/form-data">
<table border="1">
	<tr>
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