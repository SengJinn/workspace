<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../common/header.jsp" %>

<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>VVV - 라라랜드</title>
    <link rel="stylesheet" href="${path}/resources/css/movies_detail_styles.css">
    
</head>

<body>
 
    <main>
        <section class="main-banner">
            <div class="overlay"></div>
            <div class="content">
            <br/> <br/> <br/> <br/> <br/> <br/> 
                <h1>라라랜드</h1>
                <p>2016 • 127분 • 드라마</p>
                <button class="watchbutton">시청하기</button>
                <p class="description">꿈을 꾸는 사람들을 위한 별들의 도시 '라라랜드'. 재즈 피아니스트 '세바스찬'과<br/>
                배우 지망생 '미아', 인생에서 가장 빛나는 순간 만난 두 사람은 미완성인<br/> 서로의 무대를 만들어가기 시작한다.</p>
           		<p>평점 ★★★★★</p>
           		<p>♡ 좋아요 &nbsp; &nbsp; &nbsp; &nbsp; 공유하기</p>
           		<br/> 
            </div>
        </section>
        
        <section class="information">
        	<h2>영화 소개</h2>
        	<p>대충 영화에 대한 기본 정보 줄거리 한 번 더 적어도 OK</p>
        	<p>감독 : 데미안 셔젤</p>
        	<p>등급 : 15세(나중에 로고로 변경)</p>
        	<p>장르 : 로맨스, 드라마, 뮤지컬</p>
        	<p>출연 : 라이언 고슬링, 엠마 스톤 등</p>
        </section>

        <section class="recommended">
            <h2>비슷한 영화</h2>
            <div class="movies">
                <div class="movie"> 
                    <img src="movie1.jpg" alt="Movie 1">
                </div>
                <div class="movie"> 
                    <img src="movie2.jpg" alt="Movie 2">
                </div>
                <div class="movie"> 
                    <img src="movie3.jpg" alt="Movie 3">
                </div>
                <div class="movie"> 
                    <img src="movie4.jpg" alt="Movie 4">
                </div>
            </div>
        </section>
    </main>

</body>
</html>
<%@ include file="../../common/footer.jsp" %>
