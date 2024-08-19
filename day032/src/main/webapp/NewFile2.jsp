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
	function hello(){
		alert('함수 선언');
	}
	hello(); // 함수 호출
	
	var test = function(){
		alert('익명 함수');
	};
	test();
	
	var test2 = (n1,n2) => {
		return (n1+n2); // 화살표 함수
	}
	var res=test2(10,20);
	console.log(res);
	
	// 남들의 코드를 해석할 정도로만 익혀두기!
	
	
</script>

</body>
</html>