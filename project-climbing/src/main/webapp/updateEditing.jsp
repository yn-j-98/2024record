<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>코마 : 글수정</title>

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
	<mytag:gnb member_id="${member_id}" ></mytag:gnb>
	
   <!-- container start -->
   <div class="container">
      <div class="page-inner">
         <div class="row py-3">
            <div class="col-12">
               <!-- 작성 글 C로 보내기 -->
               <h1 class="text-center">글수정</h1>
            </div>
         </div>
         <!-- C에게 보낼 값 설정 FORM -->
         <form action="BOARDUPDATEACTION.do" method="POST"
            name="updateediting">
            <div class="row">
               <div
                  class="col-md-1 d-flex align-items-center justify-content-center justify-content-md-end">
                  <h3>제목</h3>
               </div>
               <div class="col-md-11">
                  <div class="form-group">
                  <!-- C에서 DATA 가져오기 -->
                     <input type="text" class="form-control" id="title" name="VIEW_TITLE" value="${BOARD_TITLE}" required
                        placeholder="글의 제목을 입력해주세요" />
                     <input type="hidden" class="" id="" name="VIEW_BOARD_NUM" value="${BOARD_NUM}"/>
                  </div>
               </div>
            </div>
            <div class="row">
				<div class="col-md-1 d-flex align-items-center justify-content-center justify-content-md-end">
					<h3>지역</h3>
				</div>
				<div class="col-md-11">
				<div class="form-group">
					<select class="form-control form-select" id="location" name="VIEW_BOARD_LOCATION">
						<option value="" class="text-muted">지역</option>
						<option value="SEOUL">서울특별시</option>
						<option value="SEJONG">세종특별자치도</option>
						<option value="BUSAN">부산광역시</option>
						<option value="DAEGU">대구광역시</option>
						<option value="DAEJEON">대전광역시</option>
						<option value="INCHEON" >인천광역시</option>
						<option value="GWANGJU">광주광역시</option>
						<option value="ULSAN">울산광역시</option>
						<option value="GYEONGGI">경기도</option>
						<option value="CHUNGCHEONGNAMDO">충청남도</option>
						<option value="CHUNGCHEONGBUKDO">충청북도</option>
						<option value="JEONLANAMDO">전라남도</option>
						<option value="JEONLABUKDO">전라북도</option>
						<option value="GYEONGSANGNAMDO">경상남도</option>
						<option value="GYEONGSANGBUKDO">경상북도</option>
						<option value="GANGWONDO">강원도</option>
					</select>
				</div>
				</div>
			</div>
            <div class="row">
               <div
                  class="col-md-1 d-flex justify-content-center justify-content-md-end">
                  <h3>내용</h3>
               </div>
               <div class="col-md-11">
                  <div class="form-group">
                     <div class="input-group">
                     <!-- C에서 DATA 가져오기 -->
                        <textarea class="form-control" name="VIEW_CONTENT"
                           style="height: 500px !important;" required>${BOARD_CONTENT}</textarea>
                     </div>
                  </div>
               </div>
            </div>
            <div class="row pt-5">
               <div class="col-12 d-flex justify-content-center">
                  <!-- 취소 클릭시 cancelEditing 함수 호출 -->
                  <button type="button" class="btn btn-black me-4"
                     onclick="cancelEditing()">취소</button>
                  <!-- 버튼 클릭시 폼을 제출 (C로 보냄) -->
                  <button type="submit" class="btn btn-primary">수정</button>

               </div>
            </div>
         </form>
      </div>
   </div>
   
   <!--   Core JS Files   -->
   <script src="assets/js/core/jquery-3.7.1.min.js"></script>
   <script src="assets/js/core/popper.min.js"></script>
   <script src="assets/js/core/bootstrap.min.js"></script>
   
   <script type="text/javascript">
    function cancelEditing() {
    	// 취소버튼을 누르면 메인페이지 C로 이동
    	window.location.href = 'MYPAGEPAGEACTION.do';
    };
      
      
    document.addEventListener("DOMContentLoaded", function() {
    	var select = document.getElementById("location");
    	select.value = "${BOARD_LOCATION}";  // Controller에서 보내주는 지역 옵션 선택
    });
   </script>


</body>
</html>