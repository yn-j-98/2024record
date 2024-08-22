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
	<script type="text/javascript">
	$(document).ready(function(){
		$.ajax({
			type: "GET",
			url: "language.json",
			dataType: "json",
			success: function(data){
				var elems="";
				
				 $.each(data, function(index, article){
	                    elems += "<div><h2>" + article.title + "</h2><p>" + article.content + "</p></div>";
	                });
				 
				 $("#language").append(elems);
			},
			error: function(error){
				console.log("요청실패 : "+error);
			}
			
		});
	});
</script>

<div id="language"></div>

</body>
</html>