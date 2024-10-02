<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>home.jsp</title>
</head>
<body>
	<h1>HOME</h1>
	<!-- 인증된 사용자 -->
	<sec:authorize access="isAuthenticated()">
		<sec:authentication var="user" property="principal.member"/>
		${user} | 
		<a href="test/master">관리자 이용가능</a> | 
		<a href="test/user">회원 이용가능</a> | 
		<a href="test/all">전체 이용가능</a> | 
		<a href="logout">로그아웃</a> | 
	</sec:authorize>
	<!-- 인증되지 않은 익명 사용자 -->
	<sec:authorize access="isAnonymous()">
		<a href="join">회원가입</a> | 
		<a href="login">로그인</a>
	</sec:authorize>
</body>
</html>


















