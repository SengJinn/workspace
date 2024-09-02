<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel="stylesheet" href="${path}/resources/css/header_style.css"> 
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans:wght@400;700&display=swap" rel="stylesheet">

<c:set var="path" value="${pageContext.request.contextPath}" scope="session"/>
    
    <!-- iconbox 설정 -->
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

  <!-- 네비게이션 바 -->
  <header class="header">
    <a href="${path}/home"><img src="${path}/resources/images/logo.png" alt="Logo"> <!-- 로고 이미지 + 홈으로 이동 --> </a>
    <nav class="nav-links">
      <a href="#">드라마</a> 
      <a href="${path}/contents/movies/movies">영화</a> <!-- 세부메뉴 -->
      <a href="#">예능</a>
      <a href="#">다큐멘터리</a>
      <a href="#">커뮤니티</a>
      <i class='bx bx-search'></i><!-- search 아이콘 --> <a href="${path}/search/search_main">검색</a>
      <a href="${path}/member/login">로그인</a>
      <a href="#">내 정보</a> <!-- 세부메뉴 -->
    </nav>
  </header>	