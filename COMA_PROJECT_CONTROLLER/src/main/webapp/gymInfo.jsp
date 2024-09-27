<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="mytag"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>암벽장 상세 페이지</title>

<!-- Fonts and icons -->
<script src="assets/js/plugin/webfont/webfont.min.js"></script>
<script src="https://kit.fontawesome.com/7f7b0ec58f.js"
	crossorigin="anonymous"></script>

<!-- CSS Files -->
<link rel="stylesheet" href="assets/css/bootstrap.min.css" />
<link rel="stylesheet" href="assets/css/plugins.min.css" />
<link rel="stylesheet" href="assets/css/kaiadmin.css" />
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">

<style>
/*
.img-box {
	width: 1200px;
	height: 400px;
	background: url("images/1.jpg") no-repeat;
	background-size: cover;
}
*/
.img-btn {
	position: absolute;
	right: 30px;
	bottom: 30px;
}
</style>



</head>
<body>

	<!-- 상단 네비게이션 바 -->
	<mytag:gnb member_id="${MEMBER_ID}"></mytag:gnb>

	<!-- 메인 컨테이너: 암벽장 정보 -->
	<div class="container pt-3">
		<div class="page-inner">
			<div class="col-md-12">
				<div class="card card-stats card-round p-3">

					<!-- 암벽장 이름 -->
					<div class="card-header">
						<div class="card-title">고물 볼더</div>
					</div>
					<div class="card-body">
						<!-- 암벽장 사진 / 좋아요 -->
						<div class="row">
							<div class="col-12 position-relative overflow-hidden"
								style="height: 400px;">
								<button
									class="btn btn-info img-btn position-absolute z-3 rounded-3">♡</button>
								<img src="images/1.jpg" alt=""
									class="w-100 position-absolute z-0">
							</div>
						</div>
						<!-- 예약 / 신청 -->
						<div class="row pt-4">
							<div class="col-6">
								<button type="button" class="btn btn-secondary  w-100 col-md-3"
									id="reservation">예약</button>
							</div>
							<div class="col-6">
								<button type="button" class="btn btn-primary w-100 col-md-3"
									id="crewMatch">신청</button>
							</div>
						</div>
						<div class="row pt-5">
							<div class="col-4">
								<!-- 소개글 -->
								<div class="card card-stats card-round p-3 col-md-5  w-100">
									<div class="card-header">
										<div class="card-title">암벽장 소개</div>
									</div>
									<div class="card-body">
										<p>이 암벽장은 서울에 있다</p>
									</div>
								</div>
							</div>
							<div class="col-8">
								<!-- 역대 승리크루 / MVP -->
								<div class="card card-stats card-round p-3 col-md-5 w-100">
									<div class="card-header d-flex align-itemss-center">
										<div class="card-title">역대승리크루</div>
										<button type="button" id="crewMore" class="btn btn-info ms-5">
											>> more</button>
									</div>
									<div class="card-body">
										<div class="row">
											<div class="col-3 d-flex flex-column align-items-center">
												<div class="avatar avatar-xl">
													<img src="images/jm_denis.jpg" alt="..."
														class="avatar-img rounded-circle">
												</div>
												<small>oo크루</small>
												<p>ooo</p>
												<small>2024.09.24</small>
											</div>

											<div class="col-3 d-flex flex-column align-items-center">
												<div class="avatar avatar-xl">
													<img src="images/jm_denis.jpg" alt="..."
														class="avatar-img rounded-circle">
												</div>
												<small>oo크루</small>
												<p>ooo</p>
												<small>2024.09.24</small>
											</div>
											<div class="col-3 d-flex flex-column align-items-center">
												<div class="avatar avatar-xl">
													<img src="images/jm_denis.jpg" alt="..."
														class="avatar-img rounded-circle">
												</div>
												<small>oo크루</small>
												<p>ooo</p>
												<small>2024.09.24</small>
											</div>
											<div class="col-3 d-flex flex-column align-items-center">
												<div class="avatar avatar-xl">
													<img src="images/jm_denis.jpg" alt="..."
														class="avatar-img rounded-circle">
												</div>
												<small>oo크루</small>
												<p>ooo</p>
												<small>2024.09.24</small>
											</div>
										</div>
									</div>
									<div class="card-header">
										<div class="card-title">mvp</div>
									</div>
									<div class="card-body">
										<div class="row">

											<div class="col-3 d-flex flex-column align-items-center">
												<div class="avatar avatar-xl">
													<img src="images/jm_denis.jpg" alt="..."
														class="avatar-img rounded-circle">
												</div>
												<small>oo크루</small>
												<p>ooo</p>
												<small>2024.09.24</small>
											</div>
											<div class="col-3 d-flex flex-column align-items-center">
												<div class="avatar avatar-xl">
													<img src="images/jm_denis.jpg" alt="..."
														class="avatar-img rounded-circle">
												</div>
												<small>oo크루</small>
												<p>ooo</p>
												<small>2024.09.24</small>
											</div>
											<div class="col-3 d-flex flex-column align-items-center">
												<div class="avatar avatar-xl">
													<img src="images/jm_denis.jpg" alt="..."
														class="avatar-img rounded-circle">
												</div>
												<small>oo크루</small>
												<p>ooo</p>
												<small>2024.09.24</small>
											</div>
											<div class="col-3 d-flex flex-column align-items-center">
												<div class="avatar avatar-xl">
													<img src="images/jm_denis.jpg" alt="..."
														class="avatar-img rounded-circle">
												</div>
												<small>oo크루</small>
												<p>ooo</p>
												<small>2024.09.24</small>
											</div>
										</div>
									</div>
								</div>
							</div>

						</div>
					</div>
					<div class="row">
						<div class="col-12">
							<!-- 역대 승리크루 / 역대 MVP 더보기 -->
							<div class="card card-stats card-round p-3 d-none"
								id="crewMoreBox">
								<div class="card-title">역대승리크루</div>
								<div class="card-title">MVP</div>
							</div>
						</div>
					</div>


				</div>
			</div>
		</div>
	</div>

	<!-- 예약 modal -->
	<div class="modal fade" id="reservationModal" tabindex="-1"
		role="dialog" aria-labelledby="reservationModalLabel"
		aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="reservationModalLabel">예약</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="gym.jsp">
						<div class="form-group">
							<p>가격 20,000원</p>
							<div class="d-flex align-items-center">
								<p>
									날짜 <input type="text" id="datepicker">
								</p>
							</div>
							<input type="radio" id="pointUse"> <label>포인트
								사용하기</label>
							<div class="form-group d-none" id="point">
								<p>보유포인트 : 20,000pt</p>
								사용포인트 :<input type="number">pt
							</div>
							<div class="form-group">
								<button type="submit" class="btn btn-primary"
									id="reservation-btn">예약</button>
								<small class="error" id="fileError"></small>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal" id="reservationClose">닫기</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 크루전 신청 modal -->
	<div class="modal fade" id="crewMatchModal" tabindex="-1" role="dialog"
		aria-labelledby="crewMatchModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="crewMatchModalLabel">크루전신청</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="gym.jsp">
						<div class="form-group">
							<p>개최일 2024-09-02</p>
							<p>상금 10,000pt</p>
							<div class="form-group">
								<button type="submit" class="btn btn-primary" id="crewMatch-btn">크루전신청</button>
								<small class="error" id="fileError"></small>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal" id="crewMatchClose">닫기</button>
				</div>
			</div>
		</div>
	</div>
	</div>
	</div>

	<!-- Core JS Files -->
	<script src="assets/js/core/jquery-3.7.1.min.js"></script>
	<script src="assets/js/core/popper.min.js"></script>
	<script src="assets/js/core/bootstrap.min.js"></script>
	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

	<script>
		$(document).ready(function() {

			// >> more 버튼 클릭함수
			$("#crewMore").click(function() {
				$("#crewMoreBox").removeClass("d-none");
			});

			// >> 예약 모달창 함수
			$('#crewMatch').click(function() {
				$('#crewMatchModal').modal('show');
			});
			$('#crewMatchModal .close').click(function() {
				$('#crewMatchModal').modal('hide');
			});
			$('#crewMatchClose').click(function() {
				$('#crewMatchModal').modal('hide');
			});

			// >> 크루전 신청 모달창 함수
			$('#reservation').click(function() {
				$('#reservationModal').modal('show');
			});
			$('#reservationModal .close').click(function() {
				$('#reservationModal').modal('hide');
			});
			$('#reservationClose').click(function() {
				$('#reservationModal').modal('hide');
			});

			// 포인트 사용하기 radio 체크 시 함수
			$('#pointUse').click(function() {
				$("#point").removeClass("d-none");
			});
			// 데이트 피커 함수
			$(function() {
				$("#datepicker").datepicker();
			});

			// 포인트 사용하기 radio 체크 시 함수
			$('.img-btn').click(function() {
				console.log($(this).text());
				if ($(this).text() === '♡') {
				console.log($(this).text());
					$(this).text('♥');
					console.log($(this).text());
				} 
				else {
					$(this).text('♡');
					console.log($(this).text());
				}
			});
		});
	</script>

</body>
</html>