<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="mytag"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>코마 : 크루전 개최 내용</title>

<!-- Fonts and icons -->
<script src="assets/js/plugin/webfont/webfont.min.js"></script>
<script src="https://kit.fontawesome.com/7f7b0ec58f.js"
	crossorigin="anonymous"></script>

<!-- CSS Files -->
<link rel="stylesheet" href="assets/css/bootstrap.min.css" />
<link rel="stylesheet" href="assets/css/plugins.min.css" />
<link rel="stylesheet" href="assets/css/kaiadmin.css" />

</head>
<body>
	<!-- GNB 커스텀 태그 -->
	<mytag:gnb member_id="${MEMBER_ID}"></mytag:gnb>

	<!-- container start -->
	<div class="container">

		<div class="page-inner">
			<div class="col-12 d-flex justify-content-center pb-3">
				<h2>
					<b>코리아 에듀 크루</b>
				</h2>
			</div>
			<div class="col-12 d-flex justify-content-center">

				<p>크루전 개최 날짜 : 2024.11.01</p>
			</div>
			<div class="row border-top border-dark pb-3"></div>
			<div class="row">
				<div class="col-md-7 d-flex align-items-center">
					<p class="mb-0">크루 장소 : 서울시 강남구 역삼동</p>
				</div>
				<div class="col-md-5 d-flex align-items-center justify-content-end">
					<p class="mb-0">참여 크루 수 : 3크루</p>
				</div>
			</div>
			<div class="row border-bottom border-dark pb-3"></div>
			<div class="row py-5">
				<div class="col-12 d-flex justify-content-center">
					<p class="text-start">개최되는 크루전 내용 입니다. 개최되는 크루전 내용 입니다. 개최되는
						크루전 내용 입니다. 개최되는 크루전 내용 입니다. 개최되는 크루전 내용 입니다. 개최되는 크루전 내용 입니다.
						개최되는 크루전 내용 입니다. 개최되는 크루전 내용 입니다. 개최되는 크루전 내용 입니다. 개최되는 크루전 내용
						입니다. 개최되는 크루전 내용 입니다. 개최되는 크루전 내용 입니다. 개최되는 크루전 내용 입니다. 개최되는 크루전
						내용 입니다. 개최되는 크루전 내용 입니다. 개최되는 크루전 내용 입니다. 개최되는 크루전 내용 입니다. 개최되는
						크루전 내용 입니다. 개최되는 크루전 내용 입니다. 개최되는 크루전 내용 입니다. 개최되는 크루전 내용 입니다.
						개최되는 크루전 내용 입니다. 개최되는 크루전 내용 입니다. 개최되는 크루전 내용 입니다. 개최되는 크루전 내용
						입니다. 개최되는 크루전 내용 입니다. 개최되는 크루전 내용 입니다. 개최되는 크루전 내용 입니다. 개최되는 크루전
						내용 입니다. 개최되는 크루전 내용 입니다.</p>
				</div>
			</div>
			<div class="row border-bottom border-dark pb-3"></div>
		</div>
	</div>
	<!--   Core JS Files   -->
	<script src="assets/js/core/jquery-3.7.1.min.js"></script>
	<script src="assets/js/core/popper.min.js"></script>
	<script src="assets/js/core/bootstrap.min.js"></script>


</body>
</html>