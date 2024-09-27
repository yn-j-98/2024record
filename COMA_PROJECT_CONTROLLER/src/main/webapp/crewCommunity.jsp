<%@page import="io.opentelemetry.exporter.logging.SystemOutLogRecordExporter"%>
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

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!--   Core JS Files   -->
		<script src="assets/js/core/jquery-3.7.1.min.js"></script>
		<script src="assets/js/core/popper.min.js"></script>
		<script src="assets/js/core/bootstrap.min.js"></script>
</head>

<body style="background: #F5F7FD !important;">
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
						<a href="CrewPage.do"
							class="text-dark text-decoration-none link-primary">
							<p class="fs-4 m-0">내 크루</p>
						</a>
						<h3 class="px-5 m-0">/</h3>
						<a href="CrewCommunityPage.do"
							class="text-dark text-decoration-underline  link-primary">
							<h3 class="m-0">
								<b>커뮤니티</b>
							</h3>
						</a>
						<h3 class="px-5 m-0">/</h3>
						<a href="CrewBattlePage.do"
							class="text-dark text-decoration-none link-primary">
							<p class="fs-4 m-0">크루전 개최</p>
						</a>
						<h3 class="px-5 m-0">/</h3>
						<a href="CrewListPage.do"
							class="text-dark text-decoration-none link-primary">
							<p class="fs-4 m-0">크루 가입</p>
						</a>
					</div>
				</div>
			</div>
			<div class="row justify-content-center">
				<div class="col-md-10">
					<div class="card card-stats card-round p-5">
						<!-- 글 작성 form -->
						<form id="postForm" method="POST">
					        <div class="row">
					            <div class="col-md-2 d-flex align-items-center justify-content-center justify-content-md-start">
					                <h6>글 제목</h6>
					            </div>
					            <div class="col-md-8 text-left">
					                <input type="text" class="form-control" id="title" name="VIEW_TITLE"
					                    required placeholder="글의 제목을 입력해주세요 ( 제한 : 100자 )" maxlength="100">
					            </div>
					            <div class="col-md-2">
					                <!-- 크루 커뮤니티 글 작성 submit -->
					                <button class="btn btn-primary me-3 w-100" type="submit">글 작성</button>
					            </div>
					        </div>
					        <br> <br>
					        <div class="row">
					            <div class="col-md-2 d-flex justify-content-center justify-content-md-start">
					                <h6>글 내용</h6>
					            </div>
					            <div class="col-md-10">
					                <div class="form-group p-0 mb-0">
					                    <div class="input-group">
					                        <!-- 내용 바이트 제한 : 1000자 -->
					                        <textarea id="content" class="form-control" name="VIEW_CONTENT"
					                            required style="height: 200px !important;" maxlength="60"
					                            placeholder="글의 내용을 입력해주세요 ( 제한 : 60자 )"></textarea>
					                    </div>
					                </div>
					            </div>
					        </div>
					    </form>
				    </div>
					<!-- 글 목록을 표시할 곳 -->
					<% int cnt = 1; %>
					<div id="postList" class="row justify-content-center">
					    <c:forEach var="model_crew_board_data" items="${model_crew_board_datas}">
					        <script>
					            // JSON 형식 로그
					            console.log("110 model_crew_board_data", {
					                index: <%=cnt%>,  // 현재 인덱스
					                writer: "${model_crew_board_data.model_crew_board_writer_id}",
					                title: "${model_crew_board_data.model_crew_board_title}",
					                content: "${model_crew_board_data.model_crew_board_content}"
					            });
					        </script>
					        <div class="col-12 mb-2">
					            <div class="card card-stats card-round pt-3 px-5 pb-5">
					                <div class="row">
					                    <div class="col-md-3 text-center">
					                       	<div class="avatar avatar-xl">
					                       		<img src="${model_crew_board_data.model_crew_board_member_profile}" class="avatar-img rounded-circle form-group" alt="작성자 사진">					                       		
					                       	</div>
					                       	<p>${model_crew_board_data.model_crew_board_writer_id}</p>
					                  	</div>
					                  	<div class="col-md-9">
					                  		<div class="row">
							                  	<div class="col-md-2 d-flex align-items-center">
							                        <h6>글 제목</h6>
							                    </div>
							                    <div class="col-md-9 d-flex align-items-center">
							                        <b>${model_crew_board_data.model_crew_board_title}</b>
							                    </div>
					                  		</div>
					                  		<div class="row">
							                  	<div class="col-md-2 d-flex align-items-center">
							                        <h6>글 내용</h6>
							                    </div>
							                    <div class="col-md-9 d-flex align-items-center">${model_crew_board_data.model_crew_board_content}</div>
					                  		</div>
					                  	</div>
					                </div>
					            </div>
					        </div>
					        <% cnt++; %>
					    </c:forEach>
					</div>
				</div>
			</div>
			<!-- 페이지네이션 -->
			<div id="pageNation" class="row justify-content-center">
				<div class="row pt-5">
					<div class="col-md-10 d-flex justify-content-center">
						<nav aria-label="Page navigation">
							<input type="hidden" id="totalCount" value="${totalCount}">
							<input type="hidden" id="currentPage" value="${currentPage}">
							<ul id="pagination" class="pagination justify-content-center">
							
							</ul>
						</nav>
					</div>
				</div>
			</div>
			<!-- container end -->
		</div>
		<script type="text/javascript">
		var totalCount = ${totalCount != null ? totalCount : 1}; // 서버에서 JSP로 전달된 값
	    var currentPage = ${currentPage != null ? currentPage : 1}; // 서버에서 JSP로 전달된 값
	    console.log("156 totalCount ",totalCount)
	    console.log("157 currentPage ",currentPage); // 콘솔로그
	    
	    
	 	// 크루 게시판 작성부분(비동기 처리)
	    $('#postForm').on('submit', function(event) {
	        event.preventDefault(); // 기본 폼 제출 동작 방지
	        
		 	// textarea의 내용을 가져와 줄바꿈을 <br>로 변환
		    const content = $('#content').val().replace(/\n/g, '<br>');
	
		    // 변환된 내용을 다시 textarea에 설정
		    $('#content').val(content);

	        // 비동기 요청
	        $.ajax({
	            url: 'crewBoardInsert', // 게시글 추가 및 목록 가져오기 위한 URL
	            type: 'POST', // HTTP 요청 방식: POST
	            // JSON 문자열로 변환하여 전송
	            data: $(this).serialize(), // 기본 폼 데이터 전송
	            success: function(insertResponse) {
	            	console.log("165 insertResponse ",insertResponse)
	                // 요청 성공 시 처리
	                if (insertResponse.status === 'success') {
	                    // 성공 메시지 표시
	                    alert(insertResponse.message); 
	                    
	        	        console.log("비우기 전 게시글 리스트 내용 = ", $('#postList').html());
	        	        // 게시글 리스트 비우기
	        	        $('#postList').empty(); 
	        	        console.log("비우기 후 게시글 리스트 내용 = ", $('#postList').html());

	                    // 게시글 목록을 업데이트
	                    updatePostList(insertResponse.model_crew_board_datas); // 서버에서 받은 게시글 목록 사용
	                } else {
	                    alert(insertResponse.message); // 실패 메시지 표시
	                }
	            },
	            error: function(xhr, status, error) {
	            	console.log("에러 = ",error)
	                alert('에러 ' + error); // 에러 메시지 표시
	            }
	        });
	    });

	    // 게시글 목록을 업데이트하는 함수
	    function updatePostList(model_crew_board_datas) {
	        var postsHtml = ''; // 게시글 목록을 담을 변수 초기화
	        console.log("게시글 목록 = ", model_crew_board_datas);
			
	        // 응답에서 게시글 데이터를 처리
	        $.each(model_crew_board_datas, function(index, post) {
	        	//model_crew_board_datas 배열의 반복문
	        	//function(index, post)
	        	//index : 0부터 시작하여 배열의 길이-1까지 증가
	        	//post : 현재 반복에서 처리할 데이터 변수명
	        	//foreach문과 같은 구조 + 기본 for문의 index처리 가능
	            var profile = post.model_crew_board_member_profile; // 프로필 URL
	            console.log("216 updatePostList profile",profile);
	            
	            // 작성자 ID, HTML로 변환
	            var writer = $('<div>').text(post.model_crew_board_writer_id).html(); 
	            console.log("220 updatePostList writer",writer);
	            
	            // 제목, HTML로 변환
	            var title = $('<div>').text(post.model_crew_board_title).html(); 
	            console.log("224 updatePostList title",title);
	            
	            // 내용, HTML로 변환
	            var content = post.model_crew_board_content.replace(/&lt;br&gt;/g, '<br>').replace(/\n/g, '<br>');
	            console.log("228 변환된 updatePostList content",content);
	            
	            // 각 게시글의 HTML을 동적으로 생성하여 `postsHtml`에 추가
	            postsHtml += '<div class="col-12 mb-2">' +
	            '<div class="card card-stats card-round pt-3 px-5 pb-5">' +
	                '<div class="row">' +
	                    '<div class="col-md-3 text-center">' +
	                        '<div class="avatar avatar-xl">' +
	                            '<img src="' + profile + '" class="avatar-img rounded-circle form-group" alt="작성자 사진">' +
	                        '</div>' +
	                        '<p>' + writer + '</p>' +
	                    '</div>' +
	                    '<div class="col-md-9">' +
	                        '<div class="row">' +
	                            '<div class="col-md-2 d-flex align-items-center">' +
	                                '<h6>글 제목</h6>' +
	                            '</div>' +
	                            '<div class="col-md-9 d-flex align-items-center">' +
	                                '<b>' + title + '</b>' +
	                            '</div>' +
	                        '</div>' +
	                        '<div class="row">' +
	                            '<div class="col-md-2 d-flex align-items-center">' +
	                                '<h6>글 내용</h6>' +
	                            '</div>' +
	                            '<div class="col-md-9 d-flex align-items-center">' +
	                                content +
	                            '</div>' +
	                        '</div>' +
	                    '</div>' +
	                '</div>' +
	            '</div>' +
	        '</div>';
	        });
	        // 동적으로 생성된 게시글 목록을 HTML에 삽입
	        $('#postList').html(postsHtml);
	    }

		// 페이지네이션 생성

		// 4가지 값
		// 화면에 보여질 페이지 그룹
		// 화면에 보여질 첫번째 페이지 = 화면에 그려질 마지막 페이지 - (한 화면에 나타낼 페이지 - 1)
		// 화면에 보여질 마지막 페이지 = 화면에 보여질 페이지 그룹 * 한 화면에 나타낼 페이지
		// 총 페이지 수 = Math.ceil(전체 개수 / 한 페이지에 나타낼 데이터 수)

		// 페이지네이션 생성 함수
		function renderpagination(currentPage, _totalCount) {
		    // 현재 게시물의 전체 개수가 10개 이하이면 pagination을 숨깁니다.
		    if (_totalCount <= 10) return;
		
		    // 총 페이지 수 계산 (전체 게시물 수를 한 페이지에 보여줄 게시물 수로 나눈 값의 올림)
		    const totalPage = Math.ceil(_totalCount / 10);
		    
		    // 현재 페이지 그룹 계산 (현재 페이지를 10으로 나눈 값의 올림)
		    const pageGroup = Math.ceil(currentPage / 10);
		
		    // 현재 페이지 그룹에서의 마지막 페이지 계산
		    let last = pageGroup * 10;
		
		    // 마지막 페이지가 총 페이지 수를 초과하지 않도록 조정
		    if (last > totalPage) last = totalPage;
		
		    // 현재 페이지 그룹에서의 첫 번째 페이지 계산
		    const first = last - (10 - 1) <= 0 ? 1 : last - (10 - 1);
		
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
		
		        // 쿼리 파라미터 없이 링크 생성
		        preli.insertAdjacentHTML("beforeend",
		            "<a id='allprev' class='page-link' href='CrewCommunityPage.do?page=" + prev + "' aria-label='Previous'>" +
		            "<span aria-hidden='true'>&laquo;</span>" +
		            "</a>"
		        );
		
		        fragmentPage.appendChild(preli); // fragment에 추가
		    }
		
		    // 현재 페이지 그룹의 페이지 번호 버튼 생성
		    for (let i = first; i <= last; i++) {
		        const li = document.createElement("li");
		        li.className = 'page-item';
		
		        // 쿼리 파라미터 없이 링크 생성
		        li.insertAdjacentHTML("beforeend",
		            "<a class='page-link m-2' href='CrewCommunityPage.do?page=" + i + "' id='page-" + i + "' data-num='" + i + "'>" +
		            i +
		            "</a>"
		        );
		
		        fragmentPage.appendChild(li); // fragment에 추가
		    }
		
		    // 다음 그룹으로 이동하는 버튼 생성 (last가 totalPage보다 작다면 생성)
		    if (last < totalPage) {
		        const endli = document.createElement('li');
		        endli.id = 'next-btn';
		        endli.className = 'page-item';
		
		        // 쿼리 파라미터 없이 링크 생성
		        endli.insertAdjacentHTML("beforeend",
		            "<a class='page-link' href='CrewCommunityPage.do?page=" + next + "' id='allnext' aria-label='Next'>" +
		            "<span aria-hidden='true'>&raquo;</span>" +
		            "</a>"
		        );
		
		        fragmentPage.appendChild(endli); // fragment에 추가
		    }
		
		    // 생성된 페이지네이션 버튼들을 화면에 추가 
		    document.getElementById('pagination').appendChild(fragmentPage);
		}
		
		// 페이지 버튼 클릭 이벤트 처리
		$("#pagination a").click(function (e) {
		    // 기본 동작(페이지 이동) 방지
		    e.preventDefault();
		    // 클릭된 페이지 링크 요소를 jQuery 객체로 저장
		    const $item = $(this);
		    // 클릭된 페이지 링크의 텍스트(페이지 번호)를 가져와 selectedPage 변수에 저장
		    let selectedPage = $item.text();
		
		    // 각 버튼의 ID에 따라 선택된 페이지 설정
		    if ($item.attr("id") === "next") selectedPage = next;
		    if ($item.attr("id") === "prev") selectedPage = prev;
		    if ($item.attr("id") === "allprev") selectedPage = 1; // 첫 페이지로 이동
		    if ($item.attr("id") === "allnext") selectedPage = totalPage; // 마지막 페이지로 이동
		
		    // 페이지네이션 재생성 및 해당 페이지 데이터 로드
		    renderpagination(selectedPage, _totalCount);
		    list.search(selectedPage); // 이 함수가 제대로 정의되어 있는지 확인
		});
		
		// DOM이 완전히 로드된 후 페이지네이션을 생성
		document.addEventListener("DOMContentLoaded", function() {
		    const _totalCount = ${totalCount};  // 서버에서 전달된 전체 게시물 개수
		    const currentPage = ${currentPage}; // 서버에서 전달된 현재 페이지 번호
		
		    renderpagination(currentPage, _totalCount); // 페이지네이션 생성 함수 호출
		
		    // 현재 페이지를 표시하기 위해 active 클래스 추가
		    $("#pagination a").removeClass("active text-white");
		    $("#pagination a#page-" + currentPage).addClass("active text-white"); // 현재 페이지에 active 클래스 추가
		    console.log("386 _totalCount ", _totalCount);
		    console.log("387 currentPage ", currentPage);
		});
	</script>
</body>

</html>