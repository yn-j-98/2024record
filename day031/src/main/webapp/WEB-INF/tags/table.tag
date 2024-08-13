<%@ tag language="java" pageEncoding="UTF-8"%>

<%@ attribute name="border" %>
<%@ attribute name="bgcolor" %>

<table border="${border}" bgcolor="${bgcolor}">
	<tr>
		<td><jsp:doBody /></td>
		<td>태그바디에 넣어준 값을 불러올 수 있음</td>
	</tr>
	<tr>
		<td>20</td>
		<td>21</td>
	</tr>
	<tr>
		<td>30</td>
		<td>31</td>
	</tr>
</table>