<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:if test="${empty loginInfo}">
	<a href="joinPage.do">회원가입</a><br>
	<a href="loginPage.do">로그인</a><br>
</c:if>
<c:if test="${not empty loginInfo}">
	<a href="mypagePage.do">마이페이지</a><br>
	<a href="logout.do">로그아웃</a><br>
</c:if>
