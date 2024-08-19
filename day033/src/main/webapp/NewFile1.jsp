<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>갤러리형으로 이미지 출력하기</title>
<style type="text/css">
	* {
		margin : 5px;
		padding : 2px;
	}
	.photo {
		width : 1500px;
		height : 1500px;
		border : 1px solid black;
		overflow : hidden;
	}
</style>
</head>
<body>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"
		integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
		crossorigin="anonymous"></script>
<script>
	$(document).ready(function(){
		var totalPage = $('.photo > div').length;	
		$('.page > span:last').text(totalPage);
		
		var currentPage = 1;	
		$('.page > span:first').text(currentPage);
		
		$('.prev').click(function(){
			currentPage--;
			if(currentPage<=0){
				currentPage=totalPage;
			}
			$('.page > span:first').text(currentPage);
			$('.photo > div:last').insertBefore('.photo > div:first');
		});
		$('.next').click(function(){
			currentPage++;
			if(currentPage>totalPage){
				currentPage=1;
			}
			$('.page > span:first').text(currentPage);
			$('.photo > div:first').insertAfter('.photo > div:last');
		});
	});
</script>

<div class="button">
	<span class="page"> <span></span> / <span></span> </span>
	<button class="prev">◀</button>
	<button class="next">▶</button>
</div>
<div class="photo">
	<div><img alt="이미지01" src="images/JAVA.jpg"></div>
	<div><img alt="이미지02" src="images/C.jpg"></div>
	<div><img alt="이미지03" src="images/MySQL.jpg"></div>
	<div><img alt="이미지04" src="images/python.jpg"></div>
</div>

</body>
</html>