<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 정보 수정</title>

    <!-- Fonts and icons -->
    <script src="https://kit.fontawesome.com/7f7b0ec58f.js"
	crossorigin="anonymous"></script>

    <!-- CSS Files -->
    <link rel="stylesheet" href="assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="assets/css/plugins.min.css" />
    <link rel="stylesheet" href="assets/css/kaiadmin.css" />
</head>
<body>
   
   
   
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" 
        integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" 
        crossorigin="anonymous"></script>

    <!-- Bootstrap JS -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" 
    integrity="sha384-oBqDVmMz4fnFO9kA2Dx8DlZMx7r2F6h8P8iISGtn0z4mEGE9x4Jk6e+SCyxE/WD5" 
    crossorigin="anonymous"></script>

    <!-- gnb body -->
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
                        <li class="nav-item"><a class="nav-link" href="#">상점</a></li>
                        <li class="nav-item"><a class="nav-link" href="#">암벽장</a></li>
                        <li class="nav-item"><a class="nav-link" href="#">크루</a></li>
                        <li class="nav-item"><a class="nav-link" href="#">선수페이지</a></li>
                        <li class="nav-item"><a class="nav-link" href="#">뉴스페이지</a></li>
                    </ul>
                </nav>

                <ul class="navbar-nav topbar-nav ms-md-auto align-items-center">
                    <li class="nav-item"><a class="nav-link" href="#">login</a></li>
                    <li class="nav-item"><a class="nav-link" href="#">마이페이지</a></li>
                </ul>
            </div>
        </nav>
        <!-- End Navbar -->
    </div>
    <!-- container start -->
    <div class="container pt-3">
        <div class="page-inner">
            <div class="card card-stats card-round p-3">
                <div class="card-header">
                    <h3 class="text-center">회원 정보 수정</h3>
                </div>
                <div class="card-body">
                    <div class="row my-3">
                        <div class="col-12 d-flex justify-content-center">
                            <div class="avatar avatar-xxl">
                                <img src="assets/img/profile.jpg" alt="profile" class="avatar-img rounded-circle">
                            </div>
                        </div>
                        <div class="row pt-3">
                            <div class="col-12 d-flex justify-content-center">
                                <button type="button" class="btn btn-secondary" id="changePhotoBtn">사진 변경</button>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-2 d-flex align-items-center">
                            <p class="mb-0">이름</p>
                        </div>
                        <div class="col-md-10">
                            <div class="form-group">
                                <input type="text" class="form-control" id="name" placeholder="이름을 입력해주세요" />
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-2 d-flex align-items-center">
                            <p class="mb-0">비밀번호</p>
                        </div>
                        <div class="col-md-10">
                            <div class="form-group">
                                <input type="password" class="form-control" id="password" placeholder="비밀번호를 입력해주세요" />
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-2 d-flex align-items-center">
                            <p class="mb-0">비밀번호 확인</p>
                        </div>
                        <div class="col-md-10">
                            <div class="form-group">
                                <input type="password" class="form-control" id="confirmPassword" placeholder="비밀번호를 확인해주세요" />
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-2 d-flex align-items-center">
                            <p class="mb-0">전화번호</p>
                        </div>
                        <div class="col-md-10">
                            <div class="form-group">
                                <input type="text" class="form-control" id="phone" placeholder="전화번호를 입력해주세요" />
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card-action text-center">
                    <button type="button" class="btn btn-black px-5 mb-3 mb-sm-0 me-0 me-sm-4">취소</button>
                    <button type="button" class="btn btn-primary px-5">수정</button>
                </div>
            </div>
        </div>

        <!-- modal -->
        <div class="modal fade" id="photoModal" tabindex="-1" role="dialog" aria-labelledby="photoModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="photoModalLabel">사진 변경</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form>
                            <div class="form-group">
                                <label for="photoUpload">새 프로필 사진 업로드</label>
                                <input type="file" class="form-control-file" id="photoUpload">
                            </div>
                            <div class="form-group">
                                <button type="button" class="btn btn-primary" id="uploadPhoto">업로드</button>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal" id="photoClose">닫기</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Core JS Files -->
    <script src="assets/js/core/jquery-3.7.1.min.js"></script>
    <script src="assets/js/core/popper.min.js"></script>
    <script src="assets/js/core/bootstrap.min.js"></script>


    <script>
        $(document).ready(function() {
            $('#changePhotoBtn').click(function() {
                $('#photoModal').modal('show');
            });
            $('#photoModal .close').click(function() {
                $('#photoModal').modal('hide');
            });
            $('#photoClose').click(function() {
                $('#photoModal').modal('hide');
            });

            // 추가적으로, 업로드 버튼 클릭 시 모달을 닫고 싶다면 다음과 같이 할 수 있습니다
            $('#uploadPhoto').click(function() {
                $('#photoModal').modal('hide');
            });
        });
    </script>
</body>
</html>
