<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="mytag"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>코마 : 크루 커뮤니티</title>

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
				<a href="">내 크루</a> &nbsp;&nbsp;/&nbsp;&nbsp; <a href=""><b>커뮤니티</b></a>
				&nbsp;&nbsp;/&nbsp;&nbsp; <a href="">크루전 개최</a>
				&nbsp;&nbsp;/&nbsp;&nbsp; <a href="">크루 가입</a>
			</h2>
			<br> <br>
			<h4 align="center">내가 가입한 크루명</h4>
			<br>
			<div class="row justify-content-center">
				<div class="col-md-10">
					<div class="card card-stats card-round pt-3 px-5 pb-5">
						<!-- 글 작성 form -->
						<form action="#" method="POST">
							<div class="row">
								<div class="col-md-3 text-center">
									<img src="#" class="avatar-img rounded-circle form-group"
										alt="작성자 사진"> &nbsp;작성자
								</div>


								<div
									class="col-md-1 d-flex align-items-center justify-content-center justify-content-md-end">
									<h6>글 제목</h6>
								</div>
								<div class="col-md-5 text-left">
									<input type="text" class="form-control" id="title" name="title"
										required placeholder="글의 제목을 입력해주세요 ( 제한 : 100자 )"
										maxlength="100">
								</div>
								<div class="col-md-2">
									<!-- 크루 커뮤니티 글 작성 submit -->
									<button class="btn btn-primary me-3" onclick="#">글 작성</button>
								</div>
							</div>
							<br> <br>
							<div class="row">
								<div class="col-md-3"></div>
								<div
									class="col-md-1 d-flex justify-content-center justify-content-md-end">
									<h6>글 내용</h6>
								</div>
								<div class="col-md-5">
									<div class="form-group">
										<div class="input-group">
											<!-- 내용 바이트 제한 : 1000자 -->
											<textarea id="content" class="form-control" name="content"
												required style="height: 200px !important;" maxlength="1000"
												placeholder="글의 내용을 입력해주세요 ( 제한 : 1000자 )"></textarea>
										</div>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<div class="row justify-content-center">
			<div class="col-md-10">
				<div class="card card-stats card-round pt-3 px-5 pb-5">
					<div class="row">

						<div class="col-md-3 text-center">
							<img src="${MEMBERDATA.member_profile}"
								class="avatar-img rounded-circle form-group" alt="작성자 사진">
							&nbsp;작성자
						</div>


						<div
							class="col-md-1 d-flex align-items-center justify-content-center justify-content-md-end">
							<h6>글 제목</h6>
						</div>
						<div
							class="col-md-7 d-flex align-items-center justify-content-left">
							<b>글 제목입니다.</b>
						</div>
					</div>
					<br> <br>
					<div class="row">
						<div class="col-md-3"></div>
						<div
							class="col-md-1 d-flex justify-content-center justify-content-md-end">
							<h6>글 내용</h6>
						</div>
						<div class="col-md-7">글 내용입니다.글 내용입니다.글 내용입니다. 글 내용입니다.글
							내용입니다.글 내용입니다. 글 내용입니다.글 내용입니다.글 내용입니다.</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row justify-content-center">
			<div class="col-md-10">
				<div class="card card-stats card-round pt-3 px-5 pb-5">
					<div class="row">

						<div class="col-md-3 text-center">
							<img src="${MEMBERDATA.member_profile}"
								class="avatar-img rounded-circle form-group" alt="작성자 사진">
							&nbsp;작성자
						</div>


						<div
							class="col-md-1 d-flex align-items-center justify-content-center justify-content-md-end">
							<h6>글 제목</h6>
						</div>
						<div
							class="col-md-7 d-flex align-items-center justify-content-left">
							<b>글 제목입니다.</b>
						</div>
					</div>
					<br> <br>
					<div class="row">
						<div class="col-md-3"></div>
						<div
							class="col-md-1 d-flex justify-content-center justify-content-md-end">
							<h6>글 내용</h6>
						</div>
						<div class="col-md-7">글 내용입니다.글 내용입니다.글 내용입니다. 글 내용입니다.글
							내용입니다.글 내용입니다. 글 내용입니다.글 내용입니다.글 내용입니다.</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row justify-content-center">
			<div class="col-md-10">
				<div class="card card-stats card-round pt-3 px-5 pb-5">
					<div class="row">

						<div class="col-md-3 text-center">
							<img src="${MEMBERDATA.member_profile}"
								class="avatar-img rounded-circle form-group" alt="작성자 사진">
							&nbsp;작성자
						</div>


						<div
							class="col-md-1 d-flex align-items-center justify-content-center justify-content-md-end">
							<h6>글 제목</h6>
						</div>
						<div
							class="col-md-7 d-flex align-items-center justify-content-left">
							<b>글 제목입니다.</b>
						</div>
					</div>
					<br> <br>
					<div class="row">
						<div class="col-md-3"></div>
						<div
							class="col-md-1 d-flex justify-content-center justify-content-md-end">
							<h6>글 내용</h6>
						</div>
						<div class="col-md-7">글 내용입니다.글 내용입니다.글 내용입니다. 글 내용입니다.글
							내용입니다.글 내용입니다. 글 내용입니다.글 내용입니다.글 내용입니다.</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row justify-content-center">
			<div class="col-md-10">
				<div class="card card-stats card-round pt-3 px-5 pb-5">
					<div class="row">

						<div class="col-md-3 text-center">
							<img src="${MEMBERDATA.member_profile}"
								class="avatar-img rounded-circle form-group" alt="작성자 사진">
							&nbsp;작성자
						</div>


						<div
							class="col-md-1 d-flex align-items-center justify-content-center justify-content-md-end">
							<h6>글 제목</h6>
						</div>
						<div
							class="col-md-7 d-flex align-items-center justify-content-left">
							<b>글 제목입니다.</b>
						</div>
					</div>
					<br> <br>
					<div class="row">
						<div class="col-md-3"></div>
						<div
							class="col-md-1 d-flex justify-content-center justify-content-md-end">
							<h6>글 내용</h6>
						</div>
						<div class="col-md-7">글 내용입니다.글 내용입니다.글 내용입니다. 글 내용입니다.글
							내용입니다.글 내용입니다. 글 내용입니다.글 내용입니다.글 내용입니다.</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 페이지네이션 예시 -->
		<nav aria-label="Page navigation example">
			<ul class="pagination justify-content-center">
				<li class="page-item disabled"><a class="page-link" href="#"
					tabindex="-1" aria-disabled="true">Previous</a></li>
				<li class="page-item"><a class="page-link" href="#">1</a></li>
				<li class="page-item"><a class="page-link" href="#">2</a></li>
				<li class="page-item"><a class="page-link" href="#">3</a></li>
				<li class="page-item"><a class="page-link" href="#">Next</a></li>
			</ul>
		</nav>
		<!-- container end -->
	</div>
	<!--   Core JS Files   -->
	<script src="assets/js/core/jquery-3.7.1.min.js"></script>
	<script src="assets/js/core/popper.min.js"></script>
	<script src="assets/js/core/bootstrap.min.js"></script>
</body>

</html>