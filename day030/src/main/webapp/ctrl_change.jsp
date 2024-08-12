<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean class="member.MemberDAO" id="memberDAO"/>
<jsp:useBean class="member.MemberDTO" id="data"/>

   
   

   <%
   //이름변경
  
   //뷰에게 이름을 받아온다
   //
   //입력받은 이름을 업데이트로 보낸다
   //이름변경에 실패한다면 else
   
   if(request.getMethod().equals("POST")){//post인지 get인지
      
//      String sessionMemberId = (String) session.getAttribute("member_mid");
      String sessionMemberId = (String) session.getAttribute("member_id");
         
      String inputMemberName = request.getParameter("NAME"); 
      //추가된 코드입니다. 확인해주세요.
      data.setMember_id(sessionMemberId);
      data.setMember_name(inputMemberName);
      //데이터를 넣어서 전달
      memberDAO.update(data);
   }
   else{
      out.println("<script>alert('이름 변경에 실패했습니다.');history.go(-1);</script>");
      
   }
   
   
   
   
   %>
   
   