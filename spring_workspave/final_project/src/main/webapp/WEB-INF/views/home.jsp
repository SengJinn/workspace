<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="common/header.jsp" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <title>OTT 서비스 사이트</title>
    
	<!-- Google Fonts: Noto Sans -->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans:wght@400;700&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="${path}/resources/css/styles.css"> 
</head>

<body>

  <!-- 배너 -->
  <section class="banner" style="background-image: url('${path}/resources/images/home_banner.jpg');">
  	<br/> <br/> <br/> <br/> <br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
    <h1>Featured Title</h1>
    <p>Catch the latest blockbuster movies and TV shows now.</p>
    <button class="button">Watch Now</button>
  </section>

  <!-- 영화 목록 섹션 -->
  <section class="section">
    <h2>Popular Movies</h2>
    <div class="movie-list">
      <img src="movie1.jpg" alt="Movie 1">
      <img src="movie2.jpg" alt="Movie 2">
      <img src="movie3.jpg" alt="Movie 3">
      <img src="movie4.jpg" alt="Movie 4">
      <img src="movie5.jpg" alt="Movie 5">
    </div>
  </section>
</body>

<%@ include file="common/footer.jsp" %>

</html>
