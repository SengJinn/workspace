<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="path" value="${pageContext.request.contextPath}" scope="session"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>VIVIVIEW MAIN</title>

<link href="https://fonts.googleapis.com/css2?family=Noto+Sans:wght@400;700&display=swap" rel="stylesheet">

<style>

body, html {
    margin: 0;
    padding: 0;
    font-family: 'Noto Sans KR', sans-serif;
    background-color: #000;
    color: #fff;
}

.background {
    background-image: url('${path}/resources/images/main_background.jpg'); /* 배경 이미지 경로 */
    background-size: cover;
    background-position: center;
    height: 100vh;
    position: relative;
}

.overlay {
    background-color: rgba(0, 0, 0, 0.5); /* 검은색 반투명 오버레이 */
    height: 100%;
    width: 100%;
    position: absolute;
    top: 0;
    left: 0;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
  
}

nav {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-top: 30px;
}

.logo {
	width: 70px;
	margin-left: 160px;
}

.join-btn {
    background: #FFA200;
    border: none;
    color: #fff;
    font-size: 16px;
    cursor: pointer;
    padding: 10px 15px;
    border-radius: 5px;
}

.main-ment{
	font-size: 3.5em;
}

.content {
    text-align: center;
    margin-bottom: 220px;
}

h1 {
    font-size: 3em;
    margin-bottom: 10px;
    font-weight: bold;
}

h2 {
    font-size: 1.5em;
    margin-bottom: 20px;
}

/* p {
    font-size: 1.2em;
    margin-bottom: 30px;
} */

.input-box {
    display: flex;
    justify-content: center;
    align-items: center;
}

.start-btn {
    padding: 15px 20px;
    font-size: 1em;
    background-color: #FFA200;
    color: #fff;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

.start-btn:hover {
    background-color: #ffbe4d;
}

.login-btn {
    background: #888;
    border: none;
    color: #fff;
    font-size: 16px;
    cursor: pointer;
    padding: 10px 15px;
    border-radius: 5px;
    margin-right: 160px;
}

.button-wrapper {
	display: flex;
    gap: 20px; /* 버튼 사이의 간격을 설정 */
}



      .card-container {
            display: flex;
            justify-content: space-around;
            padding: 50px 20px;
        }

        .card {
            background-color: #222;
            padding: 20px;
            border-radius: 10px;
            width: 22%;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
            text-align: center;
        }

        .card img {
            width: 100px;
            margin-bottom: 20px;
            margin-top: 20px;
        }
        
        .card .heart-icon {
        	width: 75px;
        }

		.card .profile-icon {
        	width: 85px;
        }
		
        .card h3 {
            font-size: 1.5em;
            margin-bottom: 10px;
        }

        .card p {
            font-size: 1em;
            line-height: 1.5em;
        }

        /* 자주 묻는 질문 스타일 */
        .faq-section {
            padding: 20px;
            margin: 0 auto;
            max-width: 800px;
        }

        .faq-title {
            font-size: 2em;
            margin-bottom: 20px;
            text-align: center;
        }

        .faq-item {
            background-color: #333;
            padding: 15px;
            margin-bottom: 10px;
            border-radius: 5px;
            cursor: pointer;
            display: flex;
            justify-content: space-between;
            align-items: center;
            
        }

        .faq-item h4 {
            font-size: 1.2em;
            margin-left: 10px;
        }

        .faq-item .plus-icon {
            font-size: 1em;
            font-weight: bold;
            margin-right: 10px;
        }
        
       .start-viviview {
            align-items: center;
            text-align : center;
        }
         
        .start-viviview button {
            background-color: #FFA200;
		    color: #fff;
		    border: none;
		    border-radius: 4px;
		    cursor: pointer;
		    width: 300px;
        }

		.logo2{
			align-items: center;
			width: 180px;
		}
		
		hr {
		    background: #444;
		    height: 1px;
		    border:solid 0;
		}
		
</style>

</head>

<body>
    <div class="background">
        <div class="overlay">
            <nav>
            	<a href="${path}/home"><img src="${path}/resources/images/logo.png" alt="Logo" class="logo"></a>
            	<div class="button-wrapper">
            	<button class="join-btn">회원가입</button>
                <button class="login-btn">로그인</button>
                
                </div>
            </nav>
            <div class="content">
           		<h1 style="color:#FFA200" class="main-ment">WHAT A VIVID WORLD : VIVIVIEW</h1>
                <h1>세상을 보는 해상도를 높이다</h1>
                <h2>VIVIVIEW와 함께 더욱 선명해지는 당신의 세상</h2>
                <h2>멤버십 가입을 통해 지금 바로 시작해보세요!</h2>
                <div class="input-box">
                    <button class="start-btn">시작하기</button>
                </div>
            </div>
        </div>
    </div>
    
    <br/>  <br/> 
 
      <div class="card-container">
	 
        <div class="card">
            <img src="${path}/resources/images/content_icon.png" alt="디바이스 아이콘" class="content-icon">
            <h3>고화질 컨텐츠를 감상</h3>
            <p>컴퓨터, 모바일, TV 등 여러 기기에서 좋아하는<br/>영화와 드라마를 만끽하세요.</p>
        </div>
        <div class="card">
            <img src="${path}/resources/images/heart_icon.png" alt="하트 아이콘" class="heart-icon">
            <h3>마음에 드는 컨텐츠를 다운로드</h3>
            <p>버튼 하나로 간단하게 저장하고<br/>오프라인에서 감상해보세요.</p>
        </div>
        <div class="card">
            <img src="${path}/resources/images/film_icon.png" alt="TV 아이콘" class="film-icon">
            <h3>많은 컨텐츠를 골라보는 재미</h3>
            <p>영화, 드라마, 해외 시리즈, 다큐멘터리 등<br/>VIVIVIEW만의 컨텐츠를 누리세요.</p>
        </div>
        <div class="card">
            <img src="${path}/resources/images/profile_icon.png" alt="프로필 아이콘" class="profile-icon">
            <h3>자신만의 프로필로 컨텐츠를 즐겨찾기</h3>
            <p>요금제에 따라 ID당 최대 4개의 프로필을 제공합니다.<br/>나만의 프로필로 시청해보세요.</p>
        </div>
    </div>

    <!-- 자주 묻는 질문 섹션 -->
    <div class="faq-section">
        <h2 class="faq-title">자주 묻는 질문</h2>
        <div class="faq-item">
            <h4>VIVIVIEW에서 시청할 수 있는 콘텐츠는 무엇이 있나요?</h4>
            <div class="plus-icon">▶</div>
        </div>
        <div class="faq-item">
            <h4>VIVIVIEW가 제공하는 서비스가 무엇이 있는지 알고 싶습니다.</h4>
            <div class="plus-icon">▶</div>
        </div>
        <div class="faq-item">
            <h4>VIVIVIEW의 요금은 얼마 정도인지 궁금합니다.</h4>
            <div class="plus-icon">▶</div>
        </div>
        <div class="faq-item">
            <h4>VIVIVIEW는 모바일 시청이 가능한가요?</h4>
            <div class="plus-icon">▶</div>
        </div>
        
        <br/><br/><br/><br/><br/><br/><br/>
        
        <div class="start-viviview">
        <img src="${path}/resources/images/logo.png" alt="Logo" class="logo2">
        <h1 >지금 바로 시작하세요!</h1>
        <br/>
        <button><h2>비비뷰 로그인 →</h2></button>
        </div>
        <br/><br/><br/><br/><br/>
    </div>
    
<hr/>    
  
</body>
</html>

<%@ include file="common/footer.jsp" %>