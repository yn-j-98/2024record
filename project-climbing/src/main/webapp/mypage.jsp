<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

  <!-- Fonts and icons -->
  <script src="assets/js/plugin/webfont/webfont.min.js"></script>
  <script>
    WebFont.load({
      google: {
        families: ["Public Sans:300,400,500,600,700"]
      },
      custom: {
        families: [
          "Font Awesome 5 Solid",
          "Font Awesome 5 Regular",
          "Font Awesome 5 Brands",
          "simple-line-icons",
        ],
        urls: ["assets/css/fonts.min.css"],
      },
      active: function () {
        sessionStorage.fonts = true;
      },
    });
  </script>

  <!-- CSS Files -->
  <link rel="stylesheet" href="assets/css/bootstrap.min.css" />
  <link rel="stylesheet" href="assets/css/plugins.min.css" />
  <link rel="stylesheet" href="assets/css/kaiadmin.css" />

</head>

<body>
  <div class="main-header">
    <div class="main-header-logo">
      <!-- Logo Header -->
      <div class="logo-header" data-background-color="dark">
        <a href="index.html" class="logo">
          <img src="assets/img/kaiadmin/logo_light.svg" alt="navbar brand" class="navbar-brand" height="20" />
        </a>
        <div class="nav-toggle">
          <button class="btn btn-toggle toggle-sidebar">
            <i class="gg-menu-right"></i>
          </button>
          <button class="btn btn-toggle sidenav-toggler">
            <i class="gg-menu-left"></i>
          </button>
        </div>
        <button class="topbar-toggler more">
          <i class="gg-more-vertical-alt"></i>
        </button>
      </div>
      <!-- End Logo Header -->
    </div>
    <!-- Navbar Header -->
    <nav class="navbar navbar-header navbar-header-transparent navbar-expand-lg border-bottom">
      <div class="container-fluid justify-content-between">
        <nav class="navbar navbar-header-left navbar-expand-lg navbar-form nav-search p-0 d-none d-lg-flex">
          <a class="navbar-brand">
            <img src="assets/img/kaiadmin/logo_light.svg" alt="navbar brand" class="navbar-brand" height="20" />
          </a>
          <ul class="navbar-nav">
            <li class="nav-item">
              <a class="nav-link" href="">상점</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="">암벽장</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="">크루</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="">선수페이지</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="">뉴스페이지</a>
            </li>
          </ul>
        </nav>

        <ul class="navbar-nav topbar-nav ms-md-auto align-items-center">
          <li class="nav-item">
            <a class="nav-link" href="#">
              login
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">
              마이페이지
            </a>
          </li>
        </ul>
      </div>
    </nav>
    <!-- End Navbar -->
  </div>
  <!-- container start -->
  <div class="container">
    <div class="page-inner">
        <div class="row justify-content-center">
            <div class="col-md-5">
                <div class="card card-stats card-round d-flex p-5 flex-direction-column align-items-center">
                    <div class="avatar avatar-xxl">
                        <img src="assets/img/jm_denis.jpg"  class="avatar-img rounded-circle" alt="..."/>
                    </div>
                    <div class="info-user pt-4 pb-4">
                        <h5>닉네임 : 코마</h5>
                        <h5>전화번호 : 010-7777-6666</h5>
                        <h5>이메일 : coma1234@gmail.com</h5>
                    </div>
                    <button class="btn btn-secondary">회원정보 변경</button>
                </div>
            </div>
        </div>
        <div class="row justify-content-center ">
            <div class="col-md-12">
                <div class="card card-stats card-round pt-3 px-5 pb-5">
                    <ul class="nav nav-tabs nav-line nav-color-secondary" id="line-tab" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active" id="line-post-tab" data-bs-toggle="pill" href="#line-post" role="tab" aria-controls="pills-post" aria-selected="true">내가 작성한 글 관리</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="line-crew-tab" data-bs-toggle="pill" href="#line-crew" role="tab" aria-controls="pills-crew" aria-selected="false">크루 관리</a>
                        </li>
                    </ul>
                    <div class="tab-content mt-3 mb-3" id="line-tabContent">
                        <div class="tab-pane fade show active" id="line-post" role="tabpanel" aria-labelledby="line-post-tab">
                            <table class="table table-hover">
                                <tbody>
                                    <tr>
                                        <td>
                                            <a href="#" class="text-muted">
                                                내가 남긴 글 제목 입니다.내가 남긴 글 제목 입니다.내가 남긴 글 제목 입니다.내가 남긴 글 제목 입니다.내가 남긴 글 제목 입니다.
                                            </a>
                                        </td>
                                        <td>
                                            <button class="btn btn-primary me-3">수정</button>
                                            <button class="btn btn-danger">삭제</button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <a href="#" class="text-muted">
                                                내가 남긴 글 제목 입니다.내가 남긴 글 제목 입니다.내가 남긴 글 제목 입니다.내가 남긴 글 제목 입니다.내가 남긴 글 제목 입니다.
                                            </a>
                                        </td>
                                        <td>
                                            <button class="btn btn-primary me-3">수정</button>
                                            <button class="btn btn-danger">삭제</button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <a href="#" class="text-muted">
                                                내가 남긴 글 제목 입니다.내가 남긴 글 제목 입니다.내가 남긴 글 제목 입니다.내가 남긴 글 제목 입니다.내가 남긴 글 제목 입니다.
                                            </a>
                                        </td>
                                        <td>
                                            <button class="btn btn-primary me-3">수정</button>
                                            <button class="btn btn-danger">삭제</button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <a href="#" class="text-muted">
                                                내가 남긴 글 제목 입니다.내가 남긴 글 제목 입니다.내가 남긴 글 제목 입니다.내가 남긴 글 제목 입니다.내가 남긴 글 제목 입니다.
                                            </a>
                                        </td>
                                        <td>
                                            <button class="btn btn-primary me-3">수정</button>
                                            <button class="btn btn-danger">삭제</button>
                                        </td>
                                    </tr>

                                </tbody>
                            </table>
                        </div>
                        <div class="tab-pane fade" id="line-crew" role="tabpanel" aria-labelledby="line-crew-tab">
                            <div class="row">
                                <div class="col-md-6 text-center">
                                    <div class="avatar avatar-xl mt-3">
                                        <img src="assets/img/profile.jpg" class="avatar-img rounded-circle" alt="profile" />
                                    </div>
                                    <div class="info-user p-3">
                                        <h5 class="pb-3">남상도</h5>
                                        <h6>운영자</h6>
                                    </div>
                                    <div>
                                        <button type="button" class="btn btn-black">신규 회원 목록 출력</button>
                                        <button type="button" class="btn btn-danger">회원탈퇴</button>
                                    </div>
                                </div>
                                <div class="col-md-6  mt-4 mt-md-0 text-center">
                                    <h3>크루 리스트</h3>
                                    <div class="w-100 pt-3 d-flex justify-content-evenly">
                                        <span>김선호</span>
                                        <span>크루원</span>
                                    </div>
                                    <div class="w-100 pt-3 d-flex justify-content-evenly">
                                        <span>김종민</span>
                                        <span>크루원</span>
                                    </div>
                                    <div class="w-100 pt-3 d-flex justify-content-evenly">
                                        <span>남상도</span>
                                        <span>운영자</span>
                                    </div>
                                    <div class="w-100 pt-3 d-flex justify-content-evenly">
                                        <span>박선아</span>
                                        <span>크루원</span>
                                    </div>
                                    <div class="w-100 pt-3 d-flex justify-content-evenly">
                                        <span>이승찬</span>
                                        <span>크루원</span>
                                    </div>
                                </div>
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
  <script>
        var cookies = document.getElementById("cookies");
        var cancel = document.getElementById("cookies-cancel");

        cancel.addEventListener("click",(e)=>{
            cookies.style.display = "none";
        });

  </script>
</body>

</html>