<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!-- loginCheck.jsp -->
<%@ page import="java.util.*, vo.MemberVO" %>
<%
	String uid = request.getParameter("uid");
	String upw = request.getParameter("upw");
	
	String rememberMe = request.getParameter("rememberMe");
	
	List<MemberVO> memberList = (List<MemberVO>) application.getAttribute("memberList");
	if(memberList == null){
%>
<!--  memnerList가 null일 때 실행되는 HTML 영역 -->
<script>
	alert("등록된 회원 정보가 없습니다. 회원가입부터...")
	location.href='join.jsp';
</script>
<%
	return; // service method 종료
	}
	
	// meberList가 존재
	// 로그인 요청한 uid와 upw 정보로 등록된 회원 정보 비교
	
	MemberVO loginMember = null; 	//로그인 성공한 회원 정보를 저장할 변수
	for(MemberVO m : memberList){
		// 아이디와 비밀번호가 둘 다 일치하는 회원 검색
		if(uid.equals(m.getUid()) && upw.equals(m.getUpw())){
			loginMember = m;
			break;
		}
	} // end for
	
	if(loginMember == null){
		// 일치하는 사용자 정보가 존재하지 않음 - 로그인 실패
		out.println("<script>");
		out.println("alert('로그인 실패');");
		out.println("history.go(-1);");	// 이전 페이지로 이동
		out.println("</script>");
	}else{
		// 일치하는 사용자 정보가 존재 - 로그인 성공
		session.setAttribute("loginMember", loginMember);
		// welcome page로 이동
		// /jsp_10_session_application
		// response.sendRedirect("/jsp_10_session_application");
		response.sendRedirect(request.getContextPath());
	}
	
	
	
	
	
	
	
%>