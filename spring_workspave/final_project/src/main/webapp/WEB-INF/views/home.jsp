<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="common/header.jsp" %>

<html>
<head>

<style>

body {
  margin: 0;
  font-family: 'Noto Sans KR', sans-serif;
  background-color: #141414;
  color: #e5e5e5;
  overflow-x: hidden;
}

.banner {
  position: relative;
  height: 700px;
  background-size: cover;
  background-position: center;
  color: #e5e5e5;
  display: flex;
  flex-direction: column;
  justify-content: center;
  padding: 20px;
}

.banner h1 {
  font-size: 3rem;
  margin: 0;
}

.banner p {
  font-size: 1.5rem;
  margin: 10px 0;
}

.banner .button {
  background-color: #ffa200;
  color: #ffffff;
  border: none;
  padding: 10px 20px;
  font-size: 1rem;
  cursor: pointer;
  border-radius: 5px;
}

.banner .button:hover {
  background-color: #ffbe4d;
}

/* 영화 목록 */
.section {
  padding: 20px;
}

.section h2 {
  font-size: 2rem;
  margin: 20px 0;
}

.section .movie-list {
  display: flex;
  gap: 10px;
  /* overflow-x: scroll; */
  padding: 10px 0;
}

.section .movie-list img {
  height: 200px;
  border-radius: 5px;
  transition: transform 0.3s;
}

.section .movie-list img:hover {
  transform: scale(1.05);
}
	
</style>

	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <title>VIVIVIEW HOME</title>
    
	<!-- Google Fonts: Noto Sans -->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans:wght@400;700&display=swap" rel="stylesheet">
	<!--  <link rel="stylesheet" href="${path}/resources/css/styles.css"> -->
</head>

<body>

  <!-- 배너 -->
  <section class="banner" style="background-image: url('${path}/resources/images/home_banner.jpg');">
  	<br/><br/><br/><br/> <br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
    <h1>최신 영화 바로 시청하기</h1>
    <p>듄2, 웡카, 분노의 질주:라이드 오어 다이 등 최신 영화를 마음껏 시청할 절호의 기회!</p>
    <button class="button" onclick="location.href='${path}/main'" >보러가기</button>
  </section>

  <!-- 영화 목록 섹션 -->
  <section class="section">
    <h2>인기 영화 살펴보기</h2>
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
