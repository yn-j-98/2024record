<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:if test="${not empty member}">
		<a href="controller.jsp?action=LOGOUT">로그아웃</a>
		<a href="controller.jsp?action=MYPAGE">마이페이지</a>
		<a href="controller.jsp?action=CART">장바구니</a>
</c:if>
<c:if test="${empty member}">
		<form action="controller.jsp" method="POST">
			<input type="hidden" name="action" value="LOGIN">
				아이디 	<input type="text" name="mid" required> <br>
				비밀번호 	<input type="password" name="password" required> <br>
						<input type="submit" value="로그인"> <br>
		</form>
	<a href="join.jsp">회원가입</a>
</c:if>