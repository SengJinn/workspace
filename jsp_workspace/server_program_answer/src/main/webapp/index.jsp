<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url var="path" value="/" scope="session"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- redirect로 board/board_list.jsp 페이지 이동 -->
	
	<c:redirect url="board/board_list.jsp"/>
	<!-- 혹은 아래처럼 -->
	<%
		response.sendRedirect("board/board_list.jsp");
	%>
</body>
</html>





