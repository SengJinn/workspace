<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!-- sqlQuery.jsp -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="s" %>
<%@ page import="java.util.*, vo.MungMemberVO" %>
<jsp:useBean id="member" class="vo.MungMemberVO" scope="session" />
<jsp:setProperty property="*" name="member"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<s:query var="rs" dataSource="java/MySQLDB">
	SELECT * FROM mung_member WHERE id = ? AND pass = ?
	<s:param>${param.id}</s:param>
	<s:param>${param.pass}</s:param>
</s:query>  

 <c:choose>
 	<c:when test="${rs.rowCount > 0}">
 	<!-- rs.rows[0].name -->
 		<!-- private int num;
	private String id;
	private String pass;
	private String name;
	private String email;
	private Date joinDate; -->
 		<jsp:setProperty property="num" name="member" value="${rs.rows[0].num}"/>
 		<jsp:setProperty property="name" name="member"  value="${rs.rows[0].name}"/>
 		<jsp:setProperty property="email" name="member"  value="${rs.rows[0].email}"/>
 		<jsp:setProperty property="joinDate" name="member"  value="${rs.rows[0].joinDate}"/>
            
 		<script>
 		   alert('로그인이 완료되었습니다. 환영합니다.');
           location.replace('main.jsp');
        </script>
 	</c:when>
 	<c:otherwise>
 		<c:remove var="member" scope="session"/>
 		<script>
      	  alert('해당하는 회원 정보를 찾을 수 없습니다. 아이디와 비밀번호를 다시 확인해주세요.');
       	  location.replace('login.jsp');
		</script>
 	</c:otherwise>
 </c:choose>
 
 <!--  
 // 자동로그인 - 로그인 정보 저장 요청 처리
		if(rememberMe != null) {	// 자동로그인 체크박스 체크
			
			byte[] bytes = id.getBytes();	// 문자열을 byte[]로 반환 
			// byte[]로 변환된 문자열을 64바이트의 새로운 방식의 byte[]로 반환
			byte[] encodedUid = java.util.Base64.getEncoder().encode(bytes);
			System.out.println("uid : " + id);
			// byte[]에 저장된 data를 이용하여 문자열 생성 
			id = new String(encodedUid);
			System.out.println("encodedUid : " + id);
			
			// 인증완료된 사용자의 uid값을 사용자 PC브라우저 Cookie로 저장 
			Cookie cookie = new Cookie("uid", id);
			cookie.setMaxAge(60*60*24*15);	// 초단위
			cookie.setPath("/");
			response.addCookie(cookie);
		}
			response.sendRedirect(request.getContextPath() + "/main.jsp");
%>
-->

</body>
</html>