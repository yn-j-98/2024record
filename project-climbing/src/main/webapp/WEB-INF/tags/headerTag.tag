<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="main-header">
    <div class="main-header-logo">
        <div class="logo-header" data-background-color="dark">
            <a href="index.jsp" class="logo">
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
    </div>
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
                <li class="nav-item"><a class="nav-link" href="#"> 로그인 </a></li>
                <li class="nav-item"><a class="nav-link" href="#"> 마이페이지 </a></li>
            </ul>
        </div>
    </nav>
</div>