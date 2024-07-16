<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!-- jstlFmtForm.jsp -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="jstlFMT.jsp" method="POST">
		<input type="date" name="selectDate" min="2024-07-15" max="2024-08-14" required/><br/>
		<input type="number" name="price" min="0" max="1000000" step="1000"/> <br/>
		<input type="text" name="addr" />
		<select name="encode">
			<option value="ko_KR">한국어</option>
			<option value="en_US">English</option>
		</select>
		<br/> 	
		<button>확인</button>
	</form>
</body>
</html>













