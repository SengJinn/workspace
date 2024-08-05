<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/header.css" rel="stylesheet" type="text/css" />
<link href="css/footer.css" rel="stylesheet" type="text/css" />
<link href="css/common.css" rel="stylesheet" type="text/css" />
</head>
<body>
<header>
	<ul>
		<li><a href="main.jsp">홈</a></li>
		<c:choose>
				<c:when test="${!empty sessionScope.member}">
					<li>
						<a href="info.jsp">${member.name}</a>님 반갑습니다.
					</li>
					<li>
						<a href="">로그아웃</a>
					</li>
				</c:when>
				<c:otherwise>
					<li><a href="login.jsp">로그인</a></li>
					<li><a href="join.jsp">회원가입</a></li>
				</c:otherwise>
		</c:choose>
	</ul>
</header>

