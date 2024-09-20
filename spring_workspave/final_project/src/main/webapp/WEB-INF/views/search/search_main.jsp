<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}" scope="session"/>

<%@ include file="../common/header.jsp" %>

<!DOCTYPE html>
<html>
<head>    

<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>검색창 예제</title>
<link rel="stylesheet" href="${path}/resources/css/search_main_style.css">

<meta charset="UTF-8">
<title>Insert title here</title>

    <!-- iconbox 설정 -->
   <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans:wght@400;700&display=swap" rel="stylesheet">

<style>

body {
    background-color: #121212;
    color: #fff;
    font-family: 'Noto Sans KR', sans-serif;
    margin: 0;
    padding: 0;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}

.search-container {
    display: flex;
    flex-direction: column;
    align-items: center;
    width: 80%;
}

.search-box-container {
    width: 100%;
    margin-bottom: 20px;
}

.search-box {
    display: flex; 
    align-items: center; 
    width: 100%;
}

.search-input {
    width: 100%;
    padding: 10px;
    background-color: #333;
    border: none;
    border-bottom: 2px solid #444;
    color: #fff;
    font-size: 18px;
    box-sizing: border-box;
}

.search-input::placeholder {
    color: #888;
}

.search-button {
    color: white;
    background-color: #121212;
    font-size: 30px;
    border: none;
    margin-left: 10px;
    cursor: pointer;
}

.recent-trending-container {
    display: flex;
    justify-content: space-between;
    width: 100%;
    margin-top: 20px;
    
}

.recent-search {
    color: #888;
    flex: 1;
    margin-right: 20px;
    border-right: 1px solid #484848;
    
}

.recent-search h2 {
    color: white;
}

.recent-search .search-history {
    margin-top: 10px;
    display: flex;
    flex-wrap: wrap;

}

.recent-search .search-term {
    background-color: #444;
    padding: 5px 10px;
    border-radius: 20px;
    margin-right: 10px;
    margin-bottom: 10px;
}

.trending-searches {
    color: #888;
    flex: 1;
    padding-left: 40px;
}

.trending-searches h2 {
    margin: 0;
    padding: 0 0 10px 0;
    font-size: 20px;
    color: #fff;
}

.trending-searches ol {
    margin: 0;
    padding: 0;
    list-style: none;
    counter-reset: item;
}

.trending-searches li {
    margin: 5px 0;
    font-size: 16px;
    color: #fff;
}

.trending-searches li::before {
    counter-increment: item;
    content: counter(item) ".";
    margin-right: 10px;
    color:#FFA200;
}

.trending-searches p {
    font-size: 12px;
    margin-top: 10px;
    color: #666;
}



</style>
</head>

<body>
    <div class="search-container">
        <!-- 검색창과 버튼을 포함하는 박스 -->
        <div class="search-box-container">
            <form>
            <div class="search-box">
                <input type="text" placeholder="제목, 인물명을 입력해보세요." class="search-input">
                <button type=submit class="search-button"><i class='bx bx-search'></i></button>
            </div>
            </form>
        </div>

        <!-- 최근 검색어와 인기 검색어를 포함하는 박스 -->
        <div class="recent-trending-container">
            <div class="recent-search">
                <h2>최근 검색어</h2>
                <span class="clear-all">모두 지우기</span>
                <div class="search-history">
                    <span class="search-term">나는 솔로</span>
                    <span class="search-term">이혼숙려캠프</span>
                </div>
            </div>
            <div class="trending-searches">
            <br/>
                <h2>실시간 인기 검색어</h2>
                <ol>
                    <li>이혼숙려캠프</li>
                    <li>이혼숙려캠프:새로고침</li>
                    <li>나는 SOLO</li>
                    <li>우씨왕후</li>
                    <li>끝사랑</li>
                    <li>짱구는못말려 24</li>
                    <li>엠카운트다운</li>
                    <li>나는 SOLO, 그 후 사랑은 계속된다</li>
                    <li>명탐정코난2024(자막)</li>
                    <li>유 퀴즈 온 더 블럭</li>
                </ol>
                <p>2024.08.30 오전 00:00 기준</p>
            </div>
        </div>
    </div>
</body>

</html>

