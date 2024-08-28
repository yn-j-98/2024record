<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	<!-- responsive side menu -->
	<!-- mobile offcanvas -->
	<div class="offcanvas-lg offcanvas-start d-lg-none" tabindex="-1"
		id="offcanvasResponsive" aria-labelledby="offcanvasResponsiveLabel">
		<div class="offcanvas-header">
			<h5 class="offcanvas-title" id="offcanvasResponsiveLabel"></h5>
			<button type="button" class="btn-close" data-bs-dismiss="offcanvas"
				data-bs-target="#offcanvasResponsive" aria-label="Close"></button>
		</div>
		<div class=" offcanvas-body py-3">
			<nav class="navbar h-100 flex-column justify-content-between">
				<ul class="navbar-nav text-center">
					<li class="nav-item p-3"><a class="nav-link" href="#">상점</a></li>
					<li class="nav-item p-3"><a class="nav-link" href="#">암벽장</a></li>
					<li class="nav-item p-3"><a class="nav-link"
						href="CREWPAGE.do">크루</a></li>
					<li class="nav-item p-3"><a class="nav-link"
						href="RANKPAGE.do">랭킹</a></li>
					<li class="nav-item p-3"><a class="nav-link"
						href="COMMUNITYPAGE.do">커뮤니티</a></li>
				</ul>
				<ul class="navbar-nav text-center">
					<c:if test="${empty MEMBER_ID}">
						<li class="nav-item p-3"><a class="nav-link"
							href="LOGINPAGE.do">로그인</a></li>
					</c:if>
					<c:if test="${not empty MEMBER_ID}">
						<li class="nav-item p-3"><a class="nav-link"
							href="MYPAGEPAGE.do">마이페이지</a></li>
						<li class="nav-item p-3"><a class="nav-link"
							href="LOGOUTPAGE.do">로그아웃</a></li>
					</c:if>
				</ul>
			</nav>
		</div>
	</div>
	<div class="main-header">
		<div class="main-header-logo">
			<!-- Logo Header -->
			<div class="logo-header" data-background-color="dark">
				<a href="index.html" class="logo"> <img
					src="assets/img/kaiadmin/logo_light.svg" alt="navbar brand"
					class="navbar-brand" height="20" />
				</a>
				<div class="nav-toggle" data-bs-toggle="offcanvas"
					data-bs-target="#offcanvasResponsive"
					aria-controls="offcanvasResponsive">
					<button class="btn btn-toggle toggle-sidebar">
						<i class="gg-menu-right"></i>
					</button>
					<button class="btn btn-toggle sidenav-toggler">
						<i class="gg-menu-left"></i>
					</button>
				</div>
			</div>
			<!-- End Logo Header -->
		</div>
		<!-- Navbar Header -->
		<nav
			class="navbar navbar-header navbar-header-transparent navbar-expand-lg border-bottom">
			<div class="container-fluid justify-content-between">
				<nav
					class="navbar navbar-header-left navbar-expand-lg navbar-form nav-search p-0 d-none d-lg-flex">
					<a class="navbar-brand"> <img
						src="assets/img/kaiadmin/logo_light.svg" alt="navbar brand"
						class="navbar-brand" height="20" />
					</a>
					<ul class="navbar-nav">
						<li class="nav-item"><a class="nav-link" href="#">상점</a></li>
						<li class="nav-item"><a class="nav-link" href="#">암벽장</a></li>
						<li class="nav-item"><a class="nav-link" href="CREWPAGE.do">크루</a></li>
						<li class="nav-item"><a class="nav-link" href="RANKPAGE.do">랭킹</a></li>
						<li class="nav-item"><a class="nav-link"
							href="COMMUNITYPAGE.do">커뮤니티</a></li>
					</ul>
				</nav>
				<ul class="navbar-nav topbar-nav ms-md-auto align-items-center">
					<c:if test="${empty MEMBER_ID}">
						<li class="nav-item"><a class="nav-link" href="LOGINPAGE.do">
								login </a></li>
					</c:if>
					<c:if test="${not empty MEMBER_ID}">
						<li class="nav-item"><a class="nav-link" href="#"> 마이페이지 </a>
						</li>
						<li class="nav-item"><a class="nav-link" href="LOGINPAGE.do">
								logout </a></li>
					</c:if>
				</ul>
			</div>
		</nav>
		<!-- End Navbar -->
	</div>
	<!-- container start -->
	<div class="container">
		<div class="page-inner">
			<div class="row pt-3">
				<div class="col-12 p-0">
					<form action="MAINPAGEACTION.do" method="GET">
						<div class="row">
							<div class="col-md-3 col-lg-3">
								<div class="form-group">
									<select name="board_list" id="bord"
										class="form-select form-control-lg">
										<option>글 제목</option>
										<option>작성자</option>
										<option>아이디</option>
									</select>
								</div>

							</div>
							<div class="col-md-6 col-lg-7">
								<div class="form-group">
									<div class="input-icon">
										<input name="board_keyword" type="text" class="form-control"
											placeholder="검색어를 입력해주세요" /> <span class="input-icon-addon">
											<button type="submit" class="btn">
												<i class="fa fa-search"></i>
											</button>
										</span>
									</div>
								</div>
							</div>
							<div
								class="col-md-3 col-lg-2 d-flex align-items-center justify-content-end">
								<a href="INSERTBOARD.do" class="d-block btn">
									<button type="button"
										class="btn btn-primary btn-round px-5 py-3">글 작성</button>
								</a>
							</div>
						</div>
					</form>
				</div>
			</div>
			<c:forEach var="board" items="${BOARD}">
				<c:choose>
					<c:when test="${board.BOARD_ID} > 0}">
						<div class="row pt-5">
							<div class="col-md-10">
								<div class="card card-stats card-round">
									<div class="card-body p-5 d-flex justify-content-between">
										<h3 class="card-title">
											<a href="MAINPAGEACTION.do?BOARD_ID=${board.BOARD_ID}"
												class="link-dark"> ${board.BOARD_TITLE}</a>
										</h3>
										<div class="info-user">
											<div class="username">작성자 : ${board.BOARD_WRITER}</div>
											<div class="status">글 조회수 : ${board.BOARD_CNT}</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<h1>최신 글 목록이 없습니다...</h1>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<div class="row pt-2">
				<div class="col-md-10 d-flex justify-content-center">
					<nav aria-label="Page navigation">
						<ul id="pagination" class="pagination justify-content-center">

						</ul>
					</nav>
				</div>
			</div>
		</div>
		<!-- container end -->
		<div class="cookies d-none" id="cookies">
			<div class="cookies-header p-3 text-end">
				<a id="cookies-cancel" class="btn btn-toggle">x</a>
			</div>
			<div class="cookies-body p-3 text-center">
				<h2 class="text-white">최고의 클라이밍 슈즈</h2>
				<p class="text-white">모멘텀 암벽화</p>
				<img src="assets/img/shoes.png" />
				<h2 class="text-white py-1">~ 50%</h2>
				<button class="btn btn-info btn-round">바로 구매하기</button>
				<a id="cookie-today-hide" class="btn btn-toogle text-white">오늘
					하루 보지 않기</a>
			</div>
		</div>
	</div>

	<!--   Core JS Files   -->
	<script src="assets/js/core/jquery-3.7.1.min.js"></script>
	<script src="assets/js/core/popper.min.js"></script>
	<script src="assets/js/core/bootstrap.min.js"></script>
	<script src="assets/js/core/jquery.cookie.js"></script>

	<script>
		//cookies
		var cookies = document.getElementById("cookies");
		var cancel = document.getElementById("cookies-cancel");
		var btnTodayHide = document.getElementById("cookie-today-hide");

		// 최초 쿠키배너 노출
		// cookieBanner 라는 이름의 쿠키가 존재하지 않으면 레이어 노출
		if (!$.cookie('cookieBanner')) {
			cookieShow();
		}

		// 쿠키 배너 닫기 버튼 클릭
		cancel.addEventListener("click", function() {
			cookieHide(0);
		});

		// 쿠키 배너 오늘 하루 닫기 버튼 클릭
		btnTodayHide.addEventListener("click", function() {
			cookieHide(1);
		});

		// 쿠키 배너 노출
		function cookieShow() {
			cookies.classList.remove("d-none");
		}

		// 쿠키 배너 비노출
		function cookieHide(state) {
			cookies.classList.add("d-none");
			if (state === 1) {
				// cookie 처리
				// 'cookieBanner' 이름의 쿠키가 있는지 체크해본다
				if ($.cookie('cookieBanner') == undefined) {
					//'cookieBanner'이름을 넣고 1일 후 쿠키가 삭제되도록 
					// path 값을 '/'를 주면 모든페이지에서 유효한 쿠키가 생성
					$.cookie('cookieBanner', 'Y', {
						expires : 1,
						path : '/'
					});
				}

			}
		}

		// 페이지네이션 생성

		// 4가지 값
		// 화면에 보여질 페이지 그룹
		// 화면에 보여질 첫번째 페이지 = 화면에 그려질 마지막 페이지 - (한 화면에 나타낼 페이지 - 1)
		// 화면에 보여질 마지막 페이지 = 화면에 보여질 페이지 그룹 * 한 화면에 나타낼 페이지
		// 총 페이지 수 = Math.ceil(전체 개수 / 한 페이지에 나타낼 데이터 수)

		
		function renderPagination(currentPage) {
		    // 현재 게시물의 전체 개수가 20개 이하면 pagination을 숨깁니다.
		    if (_totalCount <= 20) return;
		
		    // 총 페이지 수
		    var totalPage = Math.ceil(_totalCount / 10);
		    // 화면에 보여질 페이지 그룹
		    var pageGroup = Math.ceil(currentPage / 10);
		
		    var last = pageGroup * 10;
		    if (last > totalPage)
		        last = totalPage;
		    var first = last - (10 - 1) <= 0 ? 1 : last - (10 - 1);
		    var next = last + 1;
		    var prev = first - 1;
		
		    // 화면에 보여질 페이지 그룹
		    const fragmentPage = document.createDocumentFragment();
		
		    // 처음으로 이동하는 버튼 구현
		    if (prev > 0) {
		        var preli = document.createElement('li');
		        preli.id = 'prev-btn';
		        preli.className = 'page-item';
		        preli.insertAdjacentHTML("beforeend",
		            `
		            <a id="allprev" class="page-link" href="#js-bottom" aria-label="Previous"> 
		                <span aria-hidden="true">&laquo;</span>
		            </a>
		            `);
		        fragmentPage.appendChild(preli);
		    }
		
		    // 가운데 숫자 나오는 버튼 구현
		    for (var i = first; i <= last; i++) {
		        const li = document.createElement("li");
		        li.className = 'page-item';
		        li.insertAdjacentHTML("beforeend",
		            `
		            <a class='page-link' href='MAINPAGEACTION.do?page=${i}' id='page-${i}' data-num='${i}'>
		                ${i}
		            </a>
		            `);
		        fragmentPage.appendChild(li);
		    }
		
		    // 마지막으로 이동 버튼 구현
		    if (last < totalPage) {
		        var endli = document.createElement('li');
		        endli.id = 'next-btn';
		        endli.className = 'page-item';
		        endli.insertAdjacentHTML("beforeend",
		            `
		            <a class="page-link" href="#js-program-detail-bottom" id='allnext' aria-label="Next"> 
		                <span aria-hidden="true">&raquo;</span>
		            </a>
		            `);
		
		        fragmentPage.appendChild(endli);
		    }
		
		    // 페이지 목록 생성
		    document.getElementById('pagination').appendChild(fragmentPage);
		
		    $(`#pagination a`).removeClass("active");
		    $(`#pagination a#page-${currentPage}`).addClass("active");
		    $("#pagination a").click(function (e) {
		        e.preventDefault();
		        var $item = $(this);
		        var $id = $item.attr("id");
		        var selectedPage = $item.text();
		
		        if ($id == "next")
		            selectedPage = next;
		        if ($id == "prev")
		            selectedPage = prev;
		        if ($id == "allprev")
		            selectedPage = 1;
		        if ($id == "allnext")
		            selectedPage = totalPage;
		
		        // 페이지네이션 그리는 함수
		        list.renderPagination(selectedPage);
		        // 페이지 그리는 함수
		        list.search(selectedPage);
		    });
		}
		
		
		document.addEventListener("DOMContentLoaded", function() {
		    renderPagination(1);  // 페이지네이션 초기화 호출
		});
		
		
	</script>
</body>

</html>