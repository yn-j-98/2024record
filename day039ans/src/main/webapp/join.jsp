<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
</head>
<body>
    <div class="main-header">
        <!-- Header Content -->
    </div>
    <!-- container start -->
    <div class="container">
        <div class="page-inner">
            <div class="row py-3">
                <div class="col-12">
                    <h1 class="text-center">글쓰기</h1>
                </div>
            </div>
            <!-- Form for Posting -->
            <form id="checkByte" action="BOARDINSERTACTION.do" method="POST" name="editing">
                <div class="row">
                    <div class="col-md-1 d-flex align-items-center justify-content-center justify-content-md-end">
                        <h3>제목</h3>
                    </div>
                    <div class="col-md-11">
                        <div class="form-group">
                            <input type="text" class="form-control" id="title" name="title" required placeholder="글의 제목을 입력해주세요" maxlength="100"/>
                            <div id="titleError" class="byte-error">제목은 100자를 넘을 수 없습니다.</div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-1 d-flex justify-content-center justify-content-md-end">
                        <h3>내용</h3>
                    </div>
                    <div class="col-md-11">
                        <div class="form-group">
                            <div class="input-group">
                                <textarea id="content" class="form-control" name="content" required style="height: 500px !important;" maxlength="1000"></textarea>
                            </div>
                        </div>
                        <div id="contentError" class="byte-error">내용은 1000자를 넘을 수 없습니다.</div>
                    </div>
                </div>
                <div class="row pt-5">
                    <div class="col-12 d-flex justify-content-center">
                        <button type="button" class="btn btn-black me-4" onclick="cancelEditing()">취소</button>
                        <button type="submit" class="btn btn-primary" onclick="return validateForm()">작성</button>
                    </div>
                </div>
                <!-- End of Form -->
            </form>
        </div>
    </div>

    <script type="text/javascript">
    // 바이트 계산 함수
    function getByteLength(str) {
        return new TextEncoder().encode(str).length;
    }

    // 제목과 내용의 입력 체크 함수
    function updateByteCount() {
        const title = document.getElementById('title').value;
        const content = document.getElementById('content').value;

        const titleByteCount = getByteLength(title);
        const contentByteCount = getByteLength(content);

        const titleError = document.getElementById('titleError');
        const contentError = document.getElementById('contentError');

        // 제목 바이트 초과 시 오류 메시지 표시
        if (titleByteCount > 100) {
            titleError.style.display = 'block';
            document.getElementById('title').value = title.slice(0, -1); // 초과된 문자 제거
        } else {
            titleError.style.display = 'none';
        }

        // 내용 바이트 초과 시 오류 메시지 표시
        if (contentByteCount > 1000) {
            contentError.style.display = 'block';
            document.getElementById('content').value = content.slice(0, -1); // 초과된 문자 제거
        } else {
            contentError.style.display = 'none';
        }
    }

    // 실시간 바이트 체크
    document.getElementById('title').addEventListener('input', updateByteCount);
    document.getElementById('content').addEventListener('input', updateByteCount);

    // 폼 검증 함수
    function validateForm() {
        updateByteCount(); // 폼 제출 전에 바이트 수를 업데이트
        const titleError = document.getElementById('titleError').style.display === 'block';
        const contentError = document.getElementById('contentError').style.display === 'block';
        return !titleError && !contentError; // 에러가 없으면 폼 제출
    }

    function cancelEditing() {
        window.location.href = 'MAINPAGEACTION.do';
    }

    // 페이지 로드 시 초기 바이트 수 업데이트
    window.onload = updateByteCount;
    </script>

    <!-- Core JS Files -->
    <script src="assets/js/core/jquery-3.7.1.min.js"></script>
    <script src="assets/js/core/popper.min.js"></script>
    <script src="assets/js/core/bootstrap.min.js"></script>

</body>
</html>