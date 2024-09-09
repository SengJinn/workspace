<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Write</title>
</head>

<body>
<h1>글 작성</h1>

<form action="jeongseungjin_write_submit.jsp" method="POST">

	<table>
		<tr>
		<td>작성자</td>
		<td> <input type="text" name="name"> </td>
		</tr>
		
		<tr>
		<td>비밀번호</td>
		<td> <input type="password" name="password"> </td>
		</tr>
		
		<tr>
		<td>글제목</td>
		<td> <input type="text" name="title"> </td>
		</tr>
		
		<tr>
		<td>글내용</td>
		<td> <input type="text" name="message"> </td>
		</tr>
	</table>
	
	<input type="submit" value="작성완료">
	<input type="button" value="새로작성">
	
</form>
</body>