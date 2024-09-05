<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="mytag"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>암벽장 페이지</title>

<!-- Fonts and icons -->
<script src="assets/js/plugin/webfont/webfont.min.js"></script>
<script src="https://kit.fontawesome.com/7f7b0ec58f.js"
	crossorigin="anonymous"></script>

<!-- CSS Files -->
<link rel="stylesheet" href="assets/css/bootstrap.min.css" />
<link rel="stylesheet" href="assets/css/plugins.min.css" />
<link rel="stylesheet" href="assets/css/kaiadmin.css" />


<meta content="width=device-width, initial-scale=1.0, shrink-to-fit=no"
	name="viewport" />
<link rel="icon" href="../assets/img/kaiadmin/favicon.ico"
	type="image/x-icon" />

<style>
/* 기본 스타일 */
.card.card-stats {
	cursor: pointer;
	transition: background-color 0.3s ease; /* 배경색 변화에 애니메이션 추가 */
}

.active {
	background-color: silver; /* 클릭 시 배경색을 회색으로 변경 */
}
</style>

</head>
<body>

	<!-- 상단 네비게이션 바 -->
	<mytag:gnb member_id="${MEMBER_ID}"></mytag:gnb>

	<!-- 메인 컨테이너: 지도와 사이드바를 포함 -->
	<div class="container pt-3">

		<div class="page-inner">
			<div class="col-md-12" id="map">
				<div class="card card-stats card-round p-3">
					<div class="card-header">
						<div class="card-title">암벽장 지도</div>
					</div>
					<div class="card-body">
						<div class="row">

							<!-- 지도 영역 -->
							<div class="col-md-8 d-flex align-items-center">
								<iframe
									src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d10084.56337579569!2d126.9780!3d37.5665!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca2f005eb0e63%3A0x1f61df7dcb4852b0!2sSeoul%2C%20South%20Korea!5e0!3m2!1sen!2sid!4v1701054428265!5m2!1sen!2sid"
									width="600" height="600" style="border: 0; width: 100%"
									allowfullscreen="" loading="lazy"
									referrerpolicy="no-referrer-when-downgrade"></iframe>

							</div>

							<!-- 사이드바 영역 -->
							<div class="col-md-4">

								<!-- 검색창 -->

								<div class="form-group">
									<div class="d-flex align-items-center">
										<input type="text" placeholder="검색할 암벽장을 입력해주세요."
											class="form-control">
										<button class="btn btn-primary btn-border">🔍</button>
									</div>

									<!-- 암벽장 리스트 -->
									<form action="gymInfo.jsp">
										<div type="button" class="card card-stats card-round p-3 mt-3"
											onclick="handleClick(this)">

											<div class="table-responsive d-flex align-items-center">
												<i class="fa-solid fa-location-dot fs-2"></i>
												<div class="row">
													<div class="d-flex align-items-center">
														<p class="mb-0">고물 볼더</p>
													</div>
													<div class="d-flex align-items-center">
														<p class="mb-0">서울특별시 주소주소주소</p>
													</div>
												</div>
												<div class="col-md-3 d-none">
													<button class="btn btn-primary">이동</button>
												</div>
											</div>
										</div>
									</form>
									<form action="gymInfo.jsp">
										<div type="button" class="card card-stats card-round p-3 mt-3"
											onclick="handleClick(this)">
											<div class="d-flex align-items-center">
												<i class="fa-solid fa-location-dot fs-2"></i>
												<div class="row">
													<div class="d-flex align-items-center">
														<p class="mb-0">코딩 볼더</p>
													</div>
													<div class="d-flex align-items-center">
														<p class="mb-0">서울특별시 주소주소</p>
													</div>
												</div>
												<div class="col-md-3 d-none">
													<button class="btn btn-primary">이동</button>
												</div>
											</div>
										</div>
									</form>
									<form action="gymInfo.jsp">
										<div type="button" class="card card-stats card-round p-3 mt-3"
											onclick="handleClick(this)">
											<div class="d-flex align-items-center">
												<i class="fa-solid fa-location-dot fs-2"></i>
												<div class="row">
													<div class="d-flex align-items-center">
														<p class="mb-0">코딩 볼더</p>
													</div>
													<div class="d-flex align-items-center">
														<p class="mb-0">서울특별시 주소주소</p>
													</div>
												</div>
												<div class="col-md-3 d-none">
													<button class="btn btn-primary">이동</button>
												</div>
											</div>
										</div>
									</form>
									<form action="gymInfo.jsp">
										<div type="button" class="card card-stats card-round p-3 mt-3"
											onclick="handleClick(this)">
											<div class="d-flex align-items-center">
												<i class="fa-solid fa-location-dot fs-2"></i>
												<div class="row">
													<div class="d-flex align-items-center">
														<p class="mb-0">코딩 볼더</p>
													</div>
													<div class="d-flex align-items-center">
														<p class="mb-0">서울특별시 주소주소</p>
													</div>
												</div>
												<div class="col-md-3 d-none">
													<button class="btn btn-primary">이동</button>
												</div>
											</div>
										</div>
									</form>
									<form action="gymInfo.jsp">
										<div type="button" class="card card-stats card-round p-3 mt-3"
											onclick="handleClick(this)">
											<div class="d-flex align-items-center">
												<i class="fa-solid fa-location-dot fs-2"></i>
												<div class="row">
													<div class="d-flex align-items-center">
														<p class="mb-0">코딩 볼더</p>
													</div>
													<div class="d-flex align-items-center">
														<p class="mb-0">서울특별시 주소주소</p>
													</div>
												</div>
												<div class="col-md-3 d-none">
													<button type="submit" class="btn btn-primary">이동</button>
												</div>
											</div>
										</div>
									</form>


									<!-- 페이지 네비게이션 -->

								</div>
							</div>
						</div>
					</div>


				</div>
			</div>

		</div>

		<!-- 스크립트 -->
		<script>
			function handleClick(element) {
				// 배경색을 회색으로 변경
				element.classList.toggle('active');

				// 이동 버튼의 visibility를 토글
				const button = element.querySelector('.col-md-3');
				if (button) {
					button.classList.toggle('d-none');
				}
			}
		</script>
</body>
</html>
