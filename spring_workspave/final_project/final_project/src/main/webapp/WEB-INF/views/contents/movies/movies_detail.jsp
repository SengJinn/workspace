<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../common/header.jsp" %>

<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>VVV - 라라랜드</title>
    <link rel="stylesheet" href="${path}/resources/css/movies_detail_styles.css">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans:wght@400;700&display=swap" rel="stylesheet">
    <!-- iconbox 설정 -->
	<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'> 
</head>


<body>
    <main>
    
    <input type="hidden" id="loginStatus" value="${!empty sessionScope.member}">
    <input type="hidden" id="movieNum" value="${mv_num}">
    
    <script>
    	var movieNum = document.getElementById("movieNum").value;
    </script>
    
        <section class="main-banner" style="background-image: url('${movie.image_url}');">
            <div class="overlay"></div>
            <div class="content">
            <br/> <br/> <br/> <br/> <br/> <br/> 
            
                <h1>${movie.title}</h1>
                <p>2016 • 127분 • 드라마</p>
                <button class="watchbutton" onclick="window.open('${path}/contents/movies/movies_video')">시청하기</button>
                <p class="description">${movie.summary}</p>
                
           		<p style="color : #ffcc00;">
				<span style="color : white;">평점 :</span>
				    <c:choose>
				        <c:when test="${movie.star == 5}">★★★★★</c:when>
				        <c:when test="${movie.star == 4}">★★★★☆</c:when>
				        <c:when test="${movie.star == 3}">★★★☆☆</c:when>
				        <c:when test="${movie.star == 2}">★★☆☆☆</c:when>
				        <c:when test="${movie.star == 1}">★☆☆☆☆</c:when>
				        <c:otherwise>☆☆☆☆☆</c:otherwise>
				    </c:choose>
				</p>
           		
           		<p>♡ 좋아요 &nbsp; &nbsp; &nbsp; &nbsp; 공유하기</p>
           		<br/> 
            </div>
        </section>
        
        <section class="information">
        
        	<h2>영화 소개</h2>
        	
        	<p>${movie.summary}</p>
        	<p>감독 : ${movie.director}</p>
        	<p>등급 : ${movie.age_limit}세 이상 시청 가능</p>
        	<p>장르 : ${movie.genre}</p>
        	<p>출연 : ${movie.actor} 등</p>
        	
        </section>
        
        <br/><hr/><br/>
        
       
      <section class="rating">    
      <h2>평점 남기기</h2>      
            <form action="movies_rating" method="post">
            <input type="hidden" name="name" value="${currentProfile.name}">
            <input type="hidden" name="email" value="${currentProfile.email}">
            <input type="hidden" name="mv_num" value="${movie.mv_num}">
                <div class="rating-stars">
                	<!-- 고민해보고 required 추가해야 할 것 같으면 추가 -->
                    <input type="radio" id="star1" name="mr_stars" value="1"><label for="star1" title="1 star">&#9733;</label>
                    <input type="radio" id="star2" name="mr_stars" value="2"><label for="star2" title="2 stars">&#9733;</label>
                    <input type="radio" id="star3" name="mr_stars" value="3"><label for="star3" title="3 stars">&#9733;</label>
                    <input type="radio" id="star4" name="mr_stars" value="4"><label for="star4" title="4 stars">&#9733;</label>
                    <input type="radio" id="star5" name="mr_stars" value="5"><label for="star5" title="5 stars">&#9733;</label>
                </div>
                 <div class="review-section">
                <input type="text" name="mr_comment" maxlength='100' placeholder="영화에 대한 100자 리뷰를 남겨보세요! 위의 별을 클릭하여 별점을 입력할 수 있습니다." rows="4" cols="50" required ></input>
                <button type="submit" class="submit-button">리뷰 입력</button>
                </div>
            </form>
        </section>
        
<section class="user-rating">
        <h2>평점 둘러보기</h2>

<c:set var="hasRating" value="false" />

<!-- ratingList를 순회하여 mr_num이 1인 항목이 있는지 확인 -->
<c:forEach var="ratingBoard" items="${ratingList}">
    <c:if test="${ratingBoard.mv_num == 1}">
        <c:set var="hasRating" value="true" />
    </c:if>
</c:forEach>

<!-- 데이터가 존재하는지 여부에 따라 출력 -->
<c:choose>
    <c:when test="${hasRating}">
        <c:forEach var="ratingBoard" items="${ratingList}">
           <p><i class='bx bxs-user'></i> ${ratingBoard.name}
               <c:choose>
                   <c:when test="${ratingBoard.mr_stars == 5}">★★★★★</c:when>
                   <c:when test="${ratingBoard.mr_stars == 4}">★★★★☆</c:when>
                   <c:when test="${ratingBoard.mr_stars == 3}">★★★☆☆</c:when>
                   <c:when test="${ratingBoard.mr_stars == 2}">★★☆☆☆</c:when>
                   <c:when test="${ratingBoard.mr_stars == 1}">★☆☆☆☆</c:when>
                   <c:otherwise>☆☆☆☆☆</c:otherwise>
               </c:choose>
           </p>
           <p class="user-comment">${ratingBoard.mr_comment}</p>
        </c:forEach>
    </c:when>
    <c:otherwise>
        <p>등록된 평점이 없습니다.</p>
    </c:otherwise>
</c:choose>

</section>

		<br/>
		
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
    
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script>
        $(document).ready(function() {
        	
        			      //${!empty sessionScope.member}
            var isLogin = $('#loginStatus').val() === 'true'; // 사용자가 로그인되어 있으면 isLogin은 true가 됨

            if (!isLogin) {
                $('input[name="mr_comment"]').attr('placeholder', '로그인 후 사용할 수 있습니다.').prop('disabled', true);
                $('.submit-button').addClass('disabled').prop('disabled', true);
            }
        	 
        	 var selectedCount = 0; //별점 값을 저장할 변수
        	
            $('.rating-stars label').on('click', function() {
                // 현재 클릭된 별의 for속성 값을 가져와서 별의 id값을 저장함
                var clickedStar = $(this).attr('for');
                
                // 모든 별을 selected 클래스 값을 초기화
                $('.rating-stars label').removeClass('selected');

                // 클릭된 별의 값보다 작거나 같은 별들에 'selected' 클래스를 추가
                $('.rating-stars label').each(function() {
                    if ($(this).attr('for') <= clickedStar) {
                        $(this).addClass('selected'); 
                    }
                });
            });
        	 
            // 마우스가 올라갔을 때
            $('.rating-stars label').hover(
                function() {
                    // 클릭 이벤트와 마찬가지로 for 값을 통해 별의 id 값 저장
                    var hoverStar = $(this).attr('for');
                    $('.rating-stars label').each(function() {
                        if ($(this).attr('for') <= hoverStar) {
                            $(this).addClass('hover');      
                        }
                    });
                }, // 마우스를 떼어냈을 때
                function() {
                    $('.rating-stars label').removeClass('hover');
                }
            );
            
        });
    </script>

</body>
</html>
<%@ include file="../../common/footer.jsp" %>
