<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="product.ProductDTO"%>
    <jsp:useBean class="product.ProductDAO" id="dao"></jsp:useBean>
    <jsp:useBean class="product.ProductDTO" id="data"></jsp:useBean>
<%

String[] product_num = request.getParameterValues("cart_product");
ArrayList<ProductDTO> datas = (ArrayList<ProductDTO>)session.getAttribute("cart");

if(product_num == null){
	response.sendRedirect("cart.jsp");
}


int cnt=0;
boolean flag = false;
ArrayList<ProductDTO> ProductDTO = null;
if(request.getMethod().equals("POST")){//메서드가 POST라면
	for(int i=0; i < product_num.length; i++){ // 받아온 product PK값 만큼 for문 돌리고
		data.setNum(Integer.parseInt(product_num[i])); // 해당 번호를 DTO에 넣어
		data = dao.selectOne(data); // model에서 검색해서 해당 값을 찾아온다.
		data.setNum(Integer.parseInt(product_num[i]));
		data.setCnt(2);//나중에 개수 선택하면 0이 아닌 변수로 넣을 예정
		flag = dao.update(data);
	}
		if(flag){
			for(int i=0; i< datas.size(); i++){
				for(int j=0; j<product_num.length;j++){
					if(Integer.parseInt(product_num[j]) == datas.get(i).getNum()){
						int num = datas.get(i).getCnt()-2;//상품 -2는 나중에 개수 확인할때 쓸듯요
							datas.get(i).setCnt(num);
							datas.set(i, data);	
							datas.remove(i);
					}					
				}
			}
			pageContext.forward("main.jsp");//다시 cart.jsp로 넘어간다.
		}
}




%>