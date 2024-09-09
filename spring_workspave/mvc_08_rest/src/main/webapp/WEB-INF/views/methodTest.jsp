<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>methodTest.jsp</title>
</head>
<body>
	<h2>requestScope name : ${name}</h2>
	<h2>requestScope age : ${age}</h2>
	<h2></h2>
	<h1>POST</h1>
	<form action="methodTest" method="POST">
		<input type="text" name="name" required> <br/>
		<input type="number" name="age" required> <br/>
		<input type="submit" VALUE="POST"> 
	</form>
	<br/>
	<hr/>
	<br/>
	<!-- GET(읽기), POST(쓰기), PATCH(부분수정), PUT(전체수정), DELETE(삭제) -->
	<h1>PUT</h1>
	<form action="methodTest" method="POST">
		<input type="hidden" name="_method" value="PUT"/>
		<input type="text" name="name" required> <br/>
		<input type="number" name="age" required> <br/>
		<input type="submit" VALUE="PUT"> 
	</form>
	
	<hr/>
	<h1>Response Data Test</h1>
	<form action="sampleTest" method="GET">
		<input type="text" name="name" required/> <br/>
		<input type="number" name="age"  required/> <br/>
		<input type="submit" value="GET SAMPLE"/>
	</form>
	
</body>
</html>