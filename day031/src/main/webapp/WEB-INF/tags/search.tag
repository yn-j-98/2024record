<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div id="search">
		<form action="controller.jsp" method="GET">
		<input type="hidden" name="action" value="MAIN">
			카테고리 <select name="searchKeyword">
				<option value="NAME">상품명</option>
				<option value="SELLER">판매자 이름</option>
			</select>
			<input type="text" name="searchContent" placeholder="검색어를 입력하세요.">
			<input type="submit" value="검색하기">
		</form>
	</div>