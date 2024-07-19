<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.sql.*, util.JDBCUtil"%>
<%@ page import="vo.TestBoardVO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% String paramNum = request.getParameter("board_num");%>
	<h1>게시물 수정</h1>
	<form action="board_update_submit.jsp" method="post">
		<table>
			<input type="hidden" name="board_num" value="<%=paramNum %>"/>
			
			<tr>
				<td>작성자</td>
				<td><input type="text" name="board_name"/></td>
				<td>  </td>
			</tr>
			
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="checkPass" required /></td>
			</tr>
			
			<tr>
				<td>제목</td>
				<td><input type="text" name="board_title" /></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea rows=10 cols=40 name="correctContent"></textarea></td>
			</tr>
			<tr>
				<td colspan=2><input type="submit" value="수정완료"/></td>
			</tr>
		</table>
	</form>
</body>
</html>