<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%

/*
g.jsp 페이지에서
장바구니에 저장했던 상품들을 출력해주세요.
*/
%>
<%
    // 장바구니를 세션에서 가져옵니다.
    ArrayList<String> cart = (ArrayList<String>) session.getAttribute("cart");
	//session.removeAttribute("cart"); //카트에 있는걸 지워줄래?
			//전부 지우고싶다면 session.invalidate();
%>
<h2>장바구니에 담긴 상품들</h2>
    <ul>
        <%
        if(cart != null){ 
                for (String product : cart) {
                    out.println("<li>" + product + "</li>");
                }        	
        }
        else{
        	out.println("현재 장바구니가 비어있습니다.");
		}%>
    </ul>
    <a href="e.jsp">상품 추가하기</a> |
    <a href="d.jsp">다시 시작하기</a>
</body>
</html>