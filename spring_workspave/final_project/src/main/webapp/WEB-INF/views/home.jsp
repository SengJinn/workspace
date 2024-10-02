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
  padding: 13px 25px;
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
	display: grid;
    grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
	gap: 60px;
	padding: 20px;
}
.movie-item {
    position: relative;
	cursor: pointer;
}
		
.movie-item img {
	width: 100%;
	height: 100%;
    border-radius: 10px;
}
		      
.movie-item img:hover {
	transform: scale(1.05);
	transition-duration: 0.3s
}
	
.slider {
    position: relative;
    width: 100%;
    height: 100%;
    overflow: hidden;
}

.slide {
    position: absolute;
    width: 100%;
    height: 100%;
    background-size: cover;
    background-position: center;
    opacity: 0;
    transition: opacity 1s ease-in-out;
}

.slide.active {
    opacity: 1;
}

.banner-content {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    text-align: center;
    color: #e5e5e5;
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
  <section class="banner">
	    <div class="slider">
	        <div class="slide" style="background-image: url('${path}/resources/images/banner3.png');"></div>
	        <div class="slide" style="background-image: url('${path}/resources/images/banner.jpeg');"></div>
	        <div class="slide" style="background-image: url('${path}/resources/images/banner2.png');"></div>
	    </div>
	    <div class="banner-content">
	    	<br/><br/><br/><br/> <br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
	        <h1>최신 영화 바로 시청하기</h1>
	        <p>듄2, 웡카, 매드맥스:퓨리오사 등 최신 영화를 마음껏 시청할 절호의 기회!</p>
	        <button class="button" onclick="location.href='${path}/contents/movies/movies'" >보러가기</button>
	    </div>
	</section>
	<br/><br/>

  <!-- 영화 목록 섹션 -->
  <section class="section">
    <h2>인기 영화 추천</h2>
    <div class="movie-list"> 
	         
	            <c:forEach var="movie" items="${randomMovies}">
	            <div class="movies">
	                <div class="movie-item"> 
	                    <a href="${path}/contents/movies/movies_detail?mv_num=${movie.mv_num}">
	                    <img src="${movie.poster_url}" alt="${movie.title}"/>
	                    </a>
	                </div>
	            </div>
	            </c:forEach>  
    </div>
  </section>
  
  <!-- 영화 목록 섹션 -->
  <section class="section">
    <h2>최신 영화 살펴보기</h2>
    <div class="movie-list"> 
	         
	            <c:forEach var="movie" items="${recentMovies}">
	            <div class="movies">
	                <div class="movie-item"> 
	                    <a href="${path}/contents/movies/movies_detail?mv_num=${movie.mv_num}">
	                    <img src="${movie.poster_url}" alt="${movie.title}"/>
	                    </a>
	                </div>
	            </div>
	            </c:forEach>  
    </div>
  </section>
  <br/><br/><br/>
  
  <script>
    let currentSlide = 0;
    const slides = document.querySelectorAll('.slide');
    const totalSlides = slides.length;

    function showSlide(index) {
        slides.forEach((slide, i) => {
            slide.classList.remove('active');
            if (i === index) {
                slide.classList.add('active');
            }
        });
    }

    function nextSlide() {
        currentSlide = (currentSlide + 1) % totalSlides;
        showSlide(currentSlide);
    }

    // 3초 간격으로 슬라이드 전환
    setInterval(nextSlide, 3000);
    
    // 초기화
    showSlide(currentSlide);
    
</script>
  
  
  
</body>

<%@ include file="common/footer.jsp" %>

</html>