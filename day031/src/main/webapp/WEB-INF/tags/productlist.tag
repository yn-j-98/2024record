<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<ol>
	<c:forEach var="data" items="${datas}">
		<c:choose>
			<c:when test="${data.cnt<=0}">
				<li>[품절] [${data.name}]</li>
			</c:when>
			<c:otherwise> 
				<li>
					<a href='controller.jsp?action=PRODUCT&num=${data.num}'>[${data.name}]
					</a>
				</li>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	</ol>