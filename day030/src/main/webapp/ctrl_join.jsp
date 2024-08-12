<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean class="member.MemberDAO" id="memberDAO"/>
<jsp:useBean class="member.MemberDTO" id="data"/>
<jsp:setProperty property="*" name="data" />
<% 

   //1. 회원가입 버튼
   //2. 메인으로 돌아가기 버튼 

if(request.getMethod().equals("POST")){//post인지 get인지
   
   //회원가입 실행할건데~
   //입력받은 아이디, 비밀번호, 이름을 가져온다
   //만약에 입력받은 아이디, 비밀번호, 이름이 DB에 있는 아이디와 겹친다면
   if(memberDAO.selectOne(data)!=null){
      
      out.print("중복이얌");
      out.print("<script>alert='중복되었습니다.'; history.go(-1);</script>");
      
   }
   else{
      memberDAO.insert(data);
		//중복시 main으로 돌려보내는 코드를 추가했습니다.
		response.sendRedirect("main.jsp");
   }
   //중복입니다 출력하고 페이지를 뒤로 보낸다
   //겹치지 않는다면 MODEL에게 입력받은 아이디, 비밀번호, 이름을 보내서 DB에 추가하게 시킨다
   
   
}
//dao insert 

   %>