<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비동기 처리를 통해 JSON 데이터 로드하기</title>
</head>
<body>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$.ajax({
			type: "GET",
			url: "data.json", // 데이터 자체를 요청
			dataType: "json", // text 데이터를 C한테 요청했었는데,
			success: function(data){ // data라는 인자는 응답받은 데이터를 의미
				var elems="";
				
				$.each(data, function(index, obj){
					elems += "<img alt='"+this.details+"' src='images/"+this.imgName+"'>";
				});
				
				$("#box").append(elems);
			},
			error: function(error){
				console.log("요청실패 : "+error);
			}
		});
	});
</script>

<div id="box"></div>

</body>
</html>