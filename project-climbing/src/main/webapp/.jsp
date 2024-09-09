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
<style>
.crew-image {
	width: 100%;
	height: auto;
	max-height: 400px; /* 원하는 최대 높이 설정 */
	object-fit: cover; /* 이미지 비율 유지하며 잘림 방지 */
}
</style>

</head>
<body>
	<!-- GNB 커스텀 태그 -->
	<mytag:gnb member_id="${MEMBER_ID}"></mytag:gnb>
	<div class="row pt-5">
		<div
			class="col-md-12 d-flex align-items-center justify-content-center">
			<img src="images/crewImageEx.jpg" class="crew-image" alt="크루 이미지">
		</div>
	</div>
	<!-- container start -->
	<div class="container">

		<div class="page-inner">


			<div class="col-12 d-flex justify-content-center pb-3">
				<h2>
					<b>코리아 에듀</b>
				</h2>
			</div>
			<div class="col-12 d-flex justify-content-end pt-3 px-3 pb-3">

				<button type="button" class="btn btn-info" onclick="#">가입하기</button>
			</div>
			<div class="row border-top border-dark pb-3"></div>
			<div class="row">
				<div class="col-md-7 d-flex align-items-center">
					<p class="mb-0">크루장 : 주예나</p>
				</div>
				<div class="col-md-5 d-flex align-items-center justify-content-end">
					<p class="mb-0">크루 인원 : 8명</p>
				</div>
			</div>
			<div class="row border-bottom border-dark pb-3"></div>
			<div class="row py-5">
				<div class="col-12 d-flex justify-content-center">
					<p class="text-start">코리아 에듀 크루에 관한 설명입니다. 코리아 에듀 크루에 관한 설명입니다.
						코리아 에듀 크루에 관한 설명입니다. 코리아 에듀 크루에 관한 설명입니다. 코리아 에듀 크루에 관한 설명입니다. 코리아
						에듀 크루에 관한 설명입니다. 코리아 에듀 크루에 관한 설명입니다. 코리아 에듀 크루에 관한 설명입니다. 코리아 에듀
						크루에 관한 설명입니다. 코리아 에듀 크루에 관한 설명입니다. 코리아 에듀 크루에 관한 설명입니다. 코리아 에듀 크루에
						관한 설명입니다. 코리아 에듀 크루에 관한 설명입니다. 코리아 에듀 크루에 관한 설명입니다. 코리아 에듀 크루에 관한
						설명입니다. 코리아 에듀 크루에 관한 설명입니다. 코리아 에듀 크루에 관한 설명입니다. 코리아 에듀 크루에 관한
						설명입니다. 코리아 에듀 크루에 관한 설명입니다. 코리아 에듀 크루에 관한 설명입니다. 코리아 에듀 크루에 관한
						설명입니다. 코리아 에듀 크루에 관한 설명입니다. 코리아 에듀 크루에 관한 설명입니다. 코리아 에듀 크루에 관한
						설명입니다.</p>
				</div>
			</div>
			<div class="row border-bottom border-dark pb-3"></div>
			<div class="row pt-3 px-3 pb-3">
				<div class="col-md-7 d-flex align-items-center pt-3 px-3 pb-3">
					<p class="mb-0">
						<b>크루전 승리 목록</b>
					</p>
				</div>
			</div>
			<div class="row pt-1 px-1 pb-1">
				<div
					class="col-md-3 d-flex align-items-center justify-content-center">
					코리아 에듀 크루</div>
				<div
					class="col-md-3 d-flex align-items-center justify-content-center">
					서울특별시 강남구 역삼동</div>
				<div
					class="col-md-3 d-flex align-items-center justify-content-center">
					크루전 MVP : 주예나</div>
				<div
					class="col-md-3 d-flex align-items-center justify-content-center">
					2024.08.01</div>
			</div>
			<div class="row pt-1 px-1 pb-1">
				<div
					class="col-md-3 d-flex align-items-center justify-content-center">
					완전 큰 티모</div>
				<div
					class="col-md-3 d-flex align-items-center justify-content-center">
					서울특별시 성북구 정릉동</div>
				<div
					class="col-md-3 d-flex align-items-center justify-content-center pt-1 px-1 pb-1">
					크루전 MVP : 박선아</div>
				<div
					class="col-md-3 d-flex align-items-center justify-content-center pt-1 px-1 pb-1">
					2024.08.01</div>
			</div>
		</div>
		<!-- page inner end -->
	</div>
	<!-- container end -->
	<!--   Core JS Files   -->
	<script src="assets/js/core/jquery-3.7.1.min.js"></script>
	<script src="assets/js/core/popper.min.js"></script>
	<script src="assets/js/core/bootstrap.min.js"></script>


</body>
</html>