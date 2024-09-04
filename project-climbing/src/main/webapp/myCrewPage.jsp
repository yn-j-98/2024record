<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="mytag"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>코마 : 내 크루 페이지</title>

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
			<h1 align="center">
				<b>크루</b>
			</h1>
			<h2 align="center">
				<a href=""><b>내 크루</b></a>
				&nbsp;&nbsp;/&nbsp;&nbsp;
				<a href="">커뮤니티</a>
				&nbsp;&nbsp;/&nbsp;&nbsp;
				<a href="">크루전	개최</a>
				&nbsp;&nbsp;/&nbsp;&nbsp;
				<a href="">크루 가입</a>
			</h2>
			<br> <br>
			<h4 align="center">내가 가입한 크루명</h4>
			<div class="row justify-content-center">
				<div class="col-md-10">
					<div class="card card-stats card-round pt-3 px-5 pb-5">
						<div class="row">
							<div class="col-12 d-flex justify-content-center">
								<div class="avatar avatar-xxl" align="center">
									<!-- 크루 사진 이미지 -->
									<img src="#"
										class="avatar-img rounded-rectangle" alt="내가 가입한 크루 사진" />
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row justify-content-center ">
				<div class="col-md-10">
					<div class="card card-stats card-round pt-3 px-5 pb-5">
						<div class="tab-content mt-3 mb-3" id="line-tabContent">
							<div class="tab-pane fade show active" id="line-post"
								role="tabpanel" aria-labelledby="line-post-tab">
								<div class="row">
									<div class="col-md-3">
										<h5>크루설명</h5>
									</div>
									<div class="col-md-7">
										<h5>크루 설명입니다.크루 설명입니다.크루 설명입니다.크루 설명입니다.크루 설명입니다.크루
											설명입니다.</h5>
									</div>
								</div>
								<br>
								<div class="row">
									<div class="col-md-3">
										<h5>크루장명</h5>
									</div>
									<div class="col-md-7">
										<h5>주예나</h5>
									</div>
								</div>
								<br>
								<div class="row">
									<div class="col-md-3">
										<h5>크루원명</h5>
									</div>
									<div class="col-md-7">
										<h5>남상도</h5>
										<h5>박선아</h5>
										<h5>이준열</h5>
										<h5>등등...</h5>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-10">
					<div class="card card-stats card-round pt-3 px-5 pb-5">
						<div class="tab-content mt-3 mb-3" id="line-tabContent">
							<div class="tab-pane fade show active" id="line-post"
								role="tabpanel" aria-labelledby="line-post-tab">
								<h4 align="center">크루전 승리목록</h4>
								<br>
								<br>
								<div class="row">
									<div class="col-md-3 text-center"><h5>코리아 에듀 크루</h5></div>
									<div class="col-md-3 text-center"><h5>서울시 강남구 역삼동</h5></div>
									<div class="col-md-3 text-center"><h5>크루전 MVP : 이준열</h5></div>
									<div class="col-md-3 text-center"><h5>2024.08.01</h5></div>
								</div>
								<div class="row">
									<div class="col-md-3 text-center"><h5>작은 티모 크루</h5></div>
									<div class="col-md-3 text-center"><h5>서울시 강남구 역삼동</h5></div>
									<div class="col-md-3 text-center"><h5>크루전 MVP : 김선호</h5></div>
									<div class="col-md-3 text-center"><h5>2024.06.01</h5></div>
								</div>


							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- container end -->
	</div>
	<!--   Core JS Files   -->
	<script src="assets/js/core/jquery-3.7.1.min.js"></script>
	<script src="assets/js/core/popper.min.js"></script>
	<script src="assets/js/core/bootstrap.min.js"></script>
</body>

</html>