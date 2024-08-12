<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" import="member.MemberDTO"%>
<jsp:useBean id="memberDAO" class="member.MemberDAO" scope="session" />
<jsp:useBean id="memberDTO" class="member.MemberDTO" />


<%
//회원탈퇴버튼누르면 바로 탈퇴삭제
//delete불러오고
//db에서 삭제
//알랏창으로 탈퇴가 완료되었습니다
//그리고 로그아웃자동으로

// 로그인 상태가 아닌 경우 로그인 페이지로 리디렉션
//if ((String) session.getAttribute("member_mid") == null) {
if ((String) session.getAttribute("member_id") == null) {
   out.println("<script>alert('로그인 후 이용해 주세요.');history.go(-1);</script>");
   return;
}

// MemberDTO에 사용자 ID 설정
memberDTO.setMember_id((String) session.getAttribute("member_id"));
// 회원 삭제 처리
boolean flag = memberDAO.delete(memberDTO);
// 처리 결과에 따른 메시지 출력 및 페이지 리디렉션
if (flag) {
   // 탈퇴 성공 시 알림 및 메인 페이지로 리디렉션
//   out.println("<script>alert('회원 탈퇴가 완료되었습니다.');history.go(-1);</script>");
   out.println("<script>alert('회원 탈퇴가 완료되었습니다.');location.href='main.jsp';</script>");
   // 세션 무효화
   session.invalidate();
} else {
   // 탈퇴 실패 시 알림 및 이전 페이지로 돌아가기
   out.println("<script>alert('회원 탈퇴에 실패했습니다.');history.go(-1);</script>");
}
%>
