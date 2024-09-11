<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="mytag"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
						<div class="card-title">${model_gym_name}</div>
					</div>
					<div class="card-body">
						<!-- 암벽장 사진 / 좋아요 -->
						<div class="row">
							<div class="col-12 position-relative overflow-hidden"
								style="height: 400px;">
								<c:if test="${data == delete}">
								<button
									class="btn btn-info img-btn position-absolute z-3 rounded-3"
									id="favorite">🤍</button>
								</c:if>
								<c:if test="${data == insert}">
								<button
									class="btn btn-info img-btn position-absolute z-3 rounded-3"
									id="favorite">❤️</button>
								</c:if>
								<img src="${model_gym_profile}" alt=""
									class="w-50 position-absolute z-0 "style="margin-left:300px">
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
										<p>${model_gym_description}</p>
										<div id="gymNum" style="display: none;">${model_gym_num}</div>
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
											<c:forEach var="data" items="${datas}" begin="0" end="3">
											<div class="col-3 d-flex flex-column align-items-center">
												<div class="avatar avatar-xl">
													<img src="${data.model_battle_record_rew_profile}" alt="..."
														class="avatar-img rounded-circle">
												</div>
												<small>${data.model_battle_record_crew_name}</small>
												<small>${data.model_battle_record_game_date}</small>
											</div>
											</c:forEach>
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
								<div class="card-title">역대승리크루 및 MVP</div>
								<div class="card-body">
									<div class="d-flex align-items-center">
										<p class="col-md-4">승리크루</p>
										<p class="col-md-4">승리날짜</p>
										<p class="col-md-4">MVP</p>
									</div>
									<hr>
									<c:forEach var="data" items="${datas}">
									<div>
										<p class="col-md-4">${data.model_battle_record_crew_name}</p>
										<p class="col-md-4">${data.model_battle_record_game_date}</p>
										<p class="col-md-4">${data.model_battle_record_mvp}</p>
									</div>
									</c:forEach>
								</div>
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
					<form action="reservation.jsp">
						<div class="form-group">
						<input type="hidden" id="gymNum" name="VIEW_GYM_NUM" value="${model_gym_num}">
							가격 : ${model_gym_price} 원
							<div class="d-flex align-items-center">
								
								날짜 : <input type="text" id="datepicker" name="VIEW_RESERVATION_DATE" required>
								
							</div>
							<input type="radio" id="pointUse"> <label>포인트
								사용하기</label>
							<div class="form-group d-none" id="point">
								<p>보유포인트 : ${model_gym_member_current_point} pt</p>
								사용포인트 :<input type="number" name="VIEW_USE_POINT" max="5000" step="1"> pt
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
	<c:if test="${empty model_battle_game_date}">
	<div class="modal fade" id="crewMatchModal" tabindex="-1" role="dialog"
		aria-labelledby="crewMatchModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="crewMatchModalLabel">크루전 신청</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="gym.jsp">
						<div class="form-group">
							<p>
								신청 날짜 : <input type="text" id="datepicker" name="VIEW_CREW_MATCH_DATE">
							</p>
							
							<div class="form-group">
								<button type="submit" class="btn btn-primary" id="crewMatch-btn">개최 신청</button>
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
	</c:if>
	
	<c:if test="${not empty model_battle_game_date}">
	<div class="modal fade" id="crewMatchModal" tabindex="-1" role="dialog"
		aria-labelledby="crewMatchModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="crewMatchModalLabel">크루전 개최</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="gym.jsp">
						<div class="form-group">
							<p>개최일 ${model_battle_game_date}</p>
							<!-- 추후에 상금은 관리자 페이지에서 설정 가능하게 구현 -->
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
	</c:if>

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
				var favorite = favoriteField.value;
				var favoriteField = document.getElementById('favorite');
				var gymNum = gymNumField.value;
				var gymNumField = document.getElementById('gymNum');
				$.ajax({
	                  type: "POST",
	                  url: "GymFavorite", // 서버에서 비밀번호 맞는지 검사를 처리하는 URL
	                  data: { // POST로 보낼때에는 data로 보낸다~!
	                      gymNum: gymNum
	                  },
	                  success: function(data) {
	                      if (data =='delete') { // C한테 받아온 값이 delete라면
	                    	  $(favorite).text('🤍'); // 색 없음
	                      }
	                      else if(data == 'insert'){
	                    	  $(favorite).text('❤️'); // 빨간색
	                      }
	                      else { // 받아온 값이 없다면
	                    	  alert("찜목록을 불러오지 못했습니다. 다시 시도해주세요");
	                    	  return false;
	                      }
	                  },
	                  error: function(error) {
	                	  alert("서버오류입니다~!");
	                  }
	              });
			});
			
		});
	</script>

</body>
</html>