<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!-- sqlUpdate.jsp -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="sqlUpdateSubmit.jsp" method="POST">
		<input type="hidden" name="num" value="${param.num}"/>
		<h2>기존 비밀번호를 입력해 주세요.</h2>
		<input type="password" name="pass"/>
		<h3>새로운 비밀번호를 입력해 주세요.</h3>
		password : <input type="password" name="newPass"/>
		<button>확인</button>
	</form>
</body>
</html>