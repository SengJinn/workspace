<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!--  contentType에 charset=UTF-8 이 지정되어있으면  
		pageEncoding="UTF-8" 은 필요없다.-->
		
<!-- 
	*************************************
	*************************************
	 회원가입화면 form의 action에 여기 링크 걸기
	*************************************
	*************************************
-->
		
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="s" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join form action</title>
</head>
<body>
	<c:catch var="e">
		<!-- 변수이름 jr (join_result, 회원가입결과) -->
		<s:update var="jr" dataSource="java/MySQLDB">
			INSERT INTO mung_member VALUES(null,?,?,?,?,now());
				<s:param>${param.id}</s:param>
				<s:param>${param.pass}</s:param>
				<s:param>${param.name}</s:param>
				<s:param>${param.email}</s:param>
		</s:update>	
		<c:choose> 
			<c:when test="${jr == 1}">
				<script>
					alert('회원가입 완료 ! 로그인해주세요 ~ ');
				</script>
				<c:redirect url="login.jsp" />
			</c:when>
			<c:otherwise>
				<script>
					alert('회원가입 실패 다시 시도해주세요');
					location.replace('join.jsp');
				</script>
			</c:otherwise>
		</c:choose>
	</c:catch>
	
	<!-- e에 저장된 값이 존재하면 예외가 발생 -->
	<c:if test="${!empty e}">
		에러메세지 : <c:out value="${e.getMessage()}"/> <br/>
		<c:out value="${e.toString()}"/>
	</c:if>
	<hr />
	
</body>
</html>