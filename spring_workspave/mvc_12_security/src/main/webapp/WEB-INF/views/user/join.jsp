<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join.jsp</title>
</head>
<body>
	<form method="POST" action="${pageContext.request.contextPath}/join">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<table>
			<tr>
				<th colspan="2"><h1>JOIN PAGE</h1></th>
			</tr>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="u_id"/></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="u_pw"/></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="u_name"/></td>
			</tr>
			<tr>
				<th colspan="2">
					<button>회원가입</button>
				</th>
			</tr>
		</table>
	</form>
</body>
</html>













