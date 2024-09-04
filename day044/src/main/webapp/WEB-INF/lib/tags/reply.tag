<%@ tag language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ attribute name="datas" type="java.lang.Object" %>


<!-- 리스트로 항목 나열 -->
<ul>
 <!-- 'datas' 속성으로 전달된 데이터를 반복하여 각 항목을 'r'로 사용 -->
<c:forEach var="r" items="${datas}">
 <!-- 작성자와 내용을 출력 -->
	<li>${r.writer} >> ${r.content}</li>
</c:forEach> 
</ul>  