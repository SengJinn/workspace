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
	
<style>
.rating {
    padding: 20px;
    border-radius: 8px;
    margin-bottom: 40px;
    padding-left: 50px;
}

.rating h2 {
    font-size: 24px;
    margin-bottom: 10px;
}

.rating form {
    display: flex;
    flex-direction: column;
    gap: 10px;
}

.rating-stars {
    display: flex;
    gap: 5px;
}

.rating-stars input[type="radio"] {
    display: none; /* 실제 라디오 버튼 숨기기 */
}

/* 별점 기본 색상 */
.rating-stars label {
    font-size: 24px;
    color: #ddd; 
    cursor: pointer; /* 마우스 커서를 포인터로 변경 */
    transition: color 0.3s; /* 색상 전환 효과 */
}

/* 별점 선택 시 노란색으로 변경 */
.rating-stars .selected {
    color: #ffcc00; 
}

/* 마우스 오버 시 별점 색상 변경 */
.rating-stars .hover {
    color: #ffcc00; 
}

.review-section {
    display: flex; /* Flexbox를 사용하여 자식 요소들을 나란히 배치 */
    gap: 10px; /* 요소 간 간격 설정 */
}

/* 제출 버튼 스타일 */
.submit-button {
    background-color:#FFA200; 
    color: #fff; /* 텍스트 색상 */
    border: none; /* 기본 테두리 제거 */
    border-radius: 8px; /* 버튼 모서리 둥글게 */
    padding: 10px 20px; /* 패딩 조정 */
    font-size: 16px; /* 폰트 크기 조정 */
    cursor: pointer; /* 커서 포인터로 변경 */
    transition: background-color 0.3s; /* 배경색 전환 효과 */
}

button:hover {
  background-color: #ffbe4d;
}

/* 텍스트 영역 스타일 */
input[name="review"] {
    background-color: #333; 
    color: #fff; 
    border: 1px solid #444; 
    border-radius: 8px; 
    padding: 10px; 
    font-size: 14px; 
    width: 50%;
    box-sizing: border-box; 
}

.user-rating{
	padding-left: 50px;
}

.user-comment{
	color: #999999;
}

hr {
    background:#666;
    height:1px;
    border:0;
}

</style>    

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
        
        <br/><hr/><br/>
        
      <!-- 로그인 안 하면 평점 남기는 창이 아예 안 보임 귀찮아서 일단 이렇게 해놓음 -->  
      <c:choose>
      <c:when test="${!empty sessionScope.member}">   
      <section class="rating">
            <h2>평점 남기기</h2>
            <form action="#" method="post">
                <div class="rating-stars">
                	<!-- 고민해보고 required 추가해야 할 것 같으면 추가 -->
                    <input type="radio" id="star1" name="rating" value="1"><label for="star1" title="1 star">&#9733;</label>
                    <input type="radio" id="star2" name="rating" value="2"><label for="star2" title="2 stars">&#9733;</label>
                    <input type="radio" id="star3" name="rating" value="3"><label for="star3" title="3 stars">&#9733;</label>
                    <input type="radio" id="star4" name="rating" value="4"><label for="star4" title="4 stars">&#9733;</label>
                    <input type="radio" id="star5" name="rating" value="5"><label for="star5" title="5 stars">&#9733;</label>
                </div>
                 <div class="review-section">
                <input type="text" name="review" maxlength='100' placeholder="영화에 대한 100자 리뷰를 남겨보세요! 위의 별을 클릭하여 별점을 입력할 수 있습니다." rows="4" cols="50"></input>
                <button type="submit" class="submit-button">리뷰 입력</button>
                </div>
            </form>
        </section>
        </c:when>
        <c:otherwise>
        <br/>
        </c:otherwise>
    	</c:choose>
        
        <section class="user-rating">
        	<h2>평점 둘러보기</h2>
        	<p><i class='bx bxs-user'></i>승진이가승진했다 ★★★★★</p> <p class="user-comment">뭔가어쩌구저쩌구한평가를남겨봅시다!Lorem ipsum</p>
        	<p><i class='bx bxs-user'></i>유리가부순유리창 ★★★★★</p> <p class="user-comment">뭔가어쩌구저쩌구한평가를남겨봅시다!Lorem ipsum 뭔가어쩌구저쩌구한평가를남겨봅시다!Lorem ipsum</p>
       		<p><i class='bx bxs-user'></i>석희가만든석회암 ★★★★★</p> <p class="user-comment">뭔가어쩌구저쩌구한평가를남겨봅시다!Lorem ipsum 뭔가어쩌구저쩌구렛츠고</p>
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
        	
        	 var selectedCount = 0; //별점 값을 저장할 변수
        	
            $('.rating-stars label').on('click', function() {
                // 현재 클릭된 별의 for속성 값을 가져와서 별의 id값을 저장함
                var clickedStar = $(this).attr('for');

                selectedCount = 0; // 변수 초기화
                
                // 모든 별을 selected 클래스 값을 초기화
                $('.rating-stars label').removeClass('selected');

                // 클릭된 별의 값보다 작거나 같은 별들에 'selected' 클래스를 추가
                $('.rating-stars label').each(function() {
                    if ($(this).attr('for') <= clickedStar) {
                        $(this).addClass('selected');
                        selectedCount++; // 선택된 별의 개수만큼 변수 증가 나중에 세션에 저장해서 DB에 넘기거나 radio value값을 DB로 넘겨야 할 듯??
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
