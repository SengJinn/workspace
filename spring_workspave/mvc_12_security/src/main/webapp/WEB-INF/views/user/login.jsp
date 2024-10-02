<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login.jsp</title>
</head>
<body>
<h1>LOGIN</h1>
<form method="POST" action="${pageContext.request.contextPath}/login">
	아이디 : <input type="text" name="u_id"/> <br/>
	비밀번호 : <input type="password" name="u_pw"/>
	<div>
		<label>
			<!-- 자동 로그인 쿠키 name : default - remember-me -->
			<input type="checkbox" name="userCookie" /> Remember Me
		</label>
	</div>
	<input type="submit" value="로그인"/>
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form>
</body>
</html>











