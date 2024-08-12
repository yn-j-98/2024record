
<%@page import="product.ProductDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.MemberDTO"%>
<jsp:useBean class="member.MemberDAO" id="dao"></jsp:useBean>
<jsp:useBean class="member.MemberDTO" id="data"></jsp:useBean>
<jsp:setProperty property="*" name="data"/>

<jsp:useBean class="product.ProductDAO" id="productdao"></jsp:useBean>
<jsp:useBean class="product.ProductDTO" id="productdata"></jsp:useBean>
<%

	//main.jsp는
	//로그인 정보와
	//상품 목록을 필요로 한다.
	
/*
main.jsp	-> 내가 할일
   1. 로그인했을때
   2. 로그인안했을때
      로그인 버튼 / selectOne으로 확인. -> null반환이 아니라면 session에 값 저장 -> null반환이면 -> respornse이전 페이지로 돌려보내기
      회원가입 버튼 / join.jsp로 넘길꺼니까 내가 할 필요X
*/

/*<jsp:useBean class="product.ProductDTO" id="data"></jsp:useBean>
<jsp:setProperty property="*" name="data"/>*/
boolean flag = request.getMethod().equals("POST");
	if(flag){
		MemberDTO dto = dao.selectOne(data);
		//System.err.print(dto);
	    if(dto != null){//만약 dto가 null이 아니라면
	    	String member_id = dto.getMember_id(); // 변수에 member_id 추가
			if(dto.getMember_role().equals("ADMIN")){//만약 로그인한 사용자가 ADMIN이라면 admin.jsp로 넘겨줍니다.
			  	session.setAttribute("member_id", member_id);
				//-----------------------------------
				ArrayList<ProductDTO> datas  = productdao.selectAll(productdata); //model에서 전체 상품 정보를 받아오고
				request.setAttribute("datas", datas); //해당 상품을 datas파라메터로 저장해서
				pageContext.forward("admin.jsp");
			}
			else{
		    	// 로그인에 성공한거니 session에 mid값을 저장하고 main으로 전달한다.
			  	session.setAttribute("member_id", member_id);
			  	response.sendRedirect("main.jsp");				
			}
    }
    else{ //그 외 친구들은 모두 실패로 간주하고
  	//로그인 실패한 것이니 다시 뒤로 넘겨준다.
     	response.sendRedirect("main.jsp");
    }
}
else{
	
}






%>