<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="mytag"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>코마 : 크루전 개최</title>

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
			<div class="row pt-5 pb-2">
				<div class="col-12">
					<h1 class="text-center">크루</h1>
				</div>
			</div>
			<div class="row pt-2 pb-5">
				<div class="col-12">
					<div class="d-flex justify-content-center align-items-center">
						<a href="CREWPAGEACTION.do"
							class="text-dark text-decoration-none link-primary">
							<p class="fs-4 m-0">내크루</p>
						</a>
						<h3 class="px-5 m-0">/</h3>
						<a href="CREWCOMMUNITYPAGEACTION.do"
							class="text-dark text-decoration-none link-primary">
							<p class="fs-4 m-0">커뮤니티</p>
						</a>
						<h3 class="px-5 m-0">/</h3>
						<a href="CREWBATTLEPAGEACTION.do"
							class="text-dark text-decoration-underline link-primary">
							<h3 class="m-0">
								<b>크루전 개최</b>
							</h3>
						</a>
						<h3 class="px-5 m-0">/</h3>
						<a href="CREWLISTPAGEACTION.do"
							class="text-dark text-decoration-none link-primary">
							<p class="fs-4 m-0">크루 가입</p>
						</a>
					</div>
				</div>
			</div>
			<h4 align="center">우리 크루가 참여하고 있는 크루전</h4>
			<br>
			<!-- 우리가 참여하고 있는 크루전 -->
			<div class="row justify-content-center">
				<div class="col-md-10">
					<div class="card card-stats card-round pt-3 px-5 pb-5">
						<!-- 크루전 번호가 없거나 빈 경우 메시지 표시 -->
						<c:if test="${empty model_battle_num}">
							<div class="alert alert-danger" role="alert">크루전 번호가
								누락되었습니다.</div>
						</c:if>
						<div class="row">
							<!-- 크루전 번호가 있는 경우 -->
							<c:if test="${not empty model_battle_num}">
								<c:forEach var="model_battle_data" items="model_battle_datas">
									<c:choose>
										<c:when test="${model_battle_data != null}">
											<div class="col-md-6">
												<!-- 크루전 개최한 장소명 -->
												<h2>암벽장 이름 : ${model_battle_data.model_battle_gym_name}</h2>
											</div>
											<div class="col-md-6">
												<h4 align="right">위치 :
													${model_battle_data.model_battle_gym_location}</h4>
											</div>
											<div class="col-md-6">
												<br>
												<h5>크루전 개최 날짜:
													${model_battle_data.model_battle_game_date}</h5>
											</div>
										</c:when>
										<c:otherwise>
											<p>크루전 개최 목록 데이터가 없습니다 ...</p>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</c:if>
						</div>
					</div>
				</div>
			</div>
			<!-- 우리가 참여하고 있는 크루전 end -->
			<div class="row border-top border-dark pt-3 px-3 pb-3"></div>


			<div class="row pt-5">
				<div class="col-md-10 d-flex justify-content-center">
					<nav aria-label="Page navigation">
						<ul id="pagination" class="pagination justify-content-center">

						</ul>
					</nav>
				</div>
			</div>

		</div>
		<!-- container end -->
	</div>


	<script type="text/javascript">
		// 페이지네이션 생성

		// 4가지 값
		// 화면에 보여질 페이지 그룹
		// 화면에 보여질 첫번째 페이지 = 화면에 그려질 마지막 페이지 - (한 화면에 나타낼 페이지 - 1)
		// 화면에 보여질 마지막 페이지 = 화면에 보여질 페이지 그룹 * 한 화면에 나타낼 페이지
		// 총 페이지 수 = Math.ceil(전체 개수 / 한 페이지에 나타낼 데이터 수)

		// 페이지네이션 생성 함수
		function renderpagination(currentPage, _totalCount) {
			// 현재 게시물의 전체 개수가 10개 이하면 pagination을 숨깁니다.
			if (_totalCount <= 10)
				return;

			// 총 페이지 수 계산 (전체 게시물 수를 한 페이지에 보여줄 게시물 수로 나눈 값의 올림)
			const totalPage = Math.ceil(_totalCount / 5);

			// 현재 페이지 그룹 계산 (현재 페이지를 10으로 나눈 값의 올림)
			const pageGroup = Math.ceil(currentPage / 5);

			// 현재 페이지 그룹에서의 마지막 페이지 계산
			let last = pageGroup * 5;

			// 마지막 페이지가 총 페이지 수를 초과하지 않도록 조정
			if (last > totalPage)
				last = totalPage;

			// 현재 페이지 그룹에서의 첫 번째 페이지 계산
			const first = last - (5 - 1) <= 0 ? 1 : last - (5 - 1);

			// 다음 그룹의 첫 페이지 계산
			const next = last + 1;

			// 이전 그룹의 마지막 페이지 계산
			const prev = first - 1;

			// 페이지네이션 버튼을 담을 비어있는 DocumentFragment 객체 생성
			const fragmentPage = document.createDocumentFragment();

			// 이전 그룹으로 이동하는 버튼 생성 (prev가 0보다 크다면 생성)
			if (prev > 0) {
				const preli = document.createElement('li');
				preli.id = 'prev-btn';
				preli.className = 'page-item';
				preli
						.insertAdjacentHTML(
								"beforeend",
								"<a id='allprev' class='page-link' href='CREWBATTLEPAGEACTION.do?page="
										+ prev
										+ "' aria-label='Previous'>"
										+ "<span aria-hidden='true'>&laquo;</span> </a>");

				fragmentPage.appendChild(preli);
			}

			// 현재 페이지 그룹의 페이지 번호 버튼 생성
			for (let i = first; i <= last; i++) {
				const li = document.createElement("li");
				li.className = 'page-item';

				li.insertAdjacentHTML("beforeend",
						"<a class='page-link m-2' href='CREWBATTLEPAGEACTION.do?page="
								+ i + "' id='page-" + i + "' data-num='" + i
								+ "'>" + i + "</a>");

				fragmentPage.appendChild(li);
			}

			// 다음 그룹으로 이동하는 버튼 생성 (last가 totalPage보다 작다면 생성)
			if (last < totalPage) {
				const endli = document.createElement('li');
				endli.id = 'next-btn';
				endli.className = 'page-item';

				endli
						.insertAdjacentHTML(
								"beforeend",
								"<a class='page-link' href='CREWBATTLEPAGEACTION.do?page="
										+ next
										+ "' id='allnext' aria-label='Next'><span aria-hidden='true'>&raquo;</span></a>");

				fragmentPage.appendChild(endli);
			}

			// 생성된 페이지네이션 버튼들을 화면에 추가 
			document.getElementById('pagination').appendChild(fragmentPage);

		};

		// 페이지 버튼 클릭 이벤트 처리
		$("#pagination a").click(function(e) {
			// 기본 동작(페이지 이동) 방지
			e.preventDefault();
			// 클릭된 페이지 링크 요소를 jQuery 객체로 저장
			const $item = $(this);
			// 클릭된 페이지 링크의 텍스트(페이지 번호)를 가져와 selectedPage 변수에 저장
			let selectedPage = $item.text();

			// 각 버튼의 ID에 따라 선택된 페이지 설정
			if ($item.attr("id") === "next")
				selectedPage = next;
			if ($item.attr("id") === "prev")
				selectedPage = prev;
			if ($item.attr("id") === "allprev")
				selectedPage = 1;
			if ($item.attr("id") === "allnext")
				selectedPage = totalPage;

			// 페이지네이션 재생성 및 해당 페이지 데이터 로드
			renderpagination(selectedPage, _totalCount);
			list.search(selectedPage); // 이 함수가 제대로 정의되어 있는지 확인
		});

		// DOM이 완전히 로드된 후 페이지네이션을 생성
		document.addEventListener("DOMContentLoaded", function() {
			const _totalCount = $
			{
				totalCount
			}
			; // 서버에서 전달된 전체 게시물 개수
			const currentPage = $
			{
				currentPage
			}
			;
			renderpagination(currentPage, _totalCount); // 페이지네이션 생성 함수 호출

			// 현재 페이지를 표시하기 위해 active 클래스 추가
			$("#pagination a").removeClass("active text-white");
			$("#pagination a#page-" + currentPage)
					.addClass("active text-white");
			console.log(currentPage);
		});
	</script>
	<!--   Core JS Files   -->
	<script src="assets/js/core/jquery-3.7.1.min.js"></script>
	<script src="assets/js/core/popper.min.js"></script>
	<script src="assets/js/core/bootstrap.min.js"></script>
</body>

</html>