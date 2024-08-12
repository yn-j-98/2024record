<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, product.ProductDTO" %>
    <jsp:useBean class="product.ProductDAO" id="dao"></jsp:useBean>
<jsp:useBean class="product.ProductDTO" id="data"></jsp:useBean>
<jsp:setProperty property="*" name="data"/>
<%
ArrayList<ProductDTO> datas = (ArrayList<ProductDTO>)session.getAttribute("cart");

if(datas == null){//만약 datas가 null이면
 datas = new ArrayList<ProductDTO>();//new 객체 생성하여 장바구니를 추가
 session.setAttribute("cart", datas); //session을 추가를 안해서.... 안됬던것..
}


ProductDTO productDTO = dao.selectOne(data);

if(productDTO != null){//검색된 값이 null이아니면 datas.add로 값을 저장하고
	boolean flag = false;
	int num = -1;
	for(int i=0; i < datas.size(); i++){
		if(datas.get(i).getNum() == data.getNum()){//장바구니에 있는 값이 받아온 PK(num)과 동일하다면
			num = i;
			flag=true;
			break;
		}
	}
	
	if(flag){ //만약 flag가 true가 된다면 해당 배열 번호의 값을 수정한다.
		datas.set(num, productDTO); // 배열리스트의 내용을 변경한다.
		//datas.set(num, data); // selectOne으로 받아와 놓고 이상한거 저장하고 있네
		System.out.println(datas);
		response.sendRedirect("main.jsp");
		
	}
	else{//그게 아니라면 새로 저장
		datas.add(productDTO);
		System.out.println(datas);
		//datas.add(data);// selectOne으로 받아와 놓고 이상한거 저장하고 있네
		response.sendRedirect("main.jsp");
	}
}
else{
	response.sendRedirect("main.jsp");
}



%>

