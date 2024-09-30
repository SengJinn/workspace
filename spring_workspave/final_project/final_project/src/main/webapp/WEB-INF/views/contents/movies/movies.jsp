<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="path" value="${pageContext.request.contextPath}" scope="session"/>

<%@ include file="../../common/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>VIVIVIEW MOVIES</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans:wght@400;700&display=swap" rel="stylesheet">

    <style>
        body {
            margin: 0;
            font-family:'Noto Sans KR', sans-serif;
            background-color: #141414;
            color: white;
        }

        .movie-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
            gap: 20px;
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

        .label {
            position: absolute;
            top: 10px;
            left: 10px;
            background-color: red;
            padding: 5px 10px;
            border-radius: 5px;
            font-size: 12px;
            font-weight: bold;
        }

        .blank {
            height: 100px;
        }

        .search-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            width: 80%;
            justify-content: center;
            margin: 0 auto;
        }

        .search-box-container {
            padding-top: 10px;
            width: 80%;
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
    </style>
</head>
<body>

<div class="blank"></div>

<div class="search-container">
    <div class="search-box-container">
        <form action="${path}/contents/movies/search_movie" method="get">
            <div class="search-box">
                <input type="text" name="keyword" placeholder="제목, 인물명을 입력해보세요." class="search-input" required>
                <button type="submit" class="search-button"><i class='bx bx-search'></i></button>
            </div>
        </form>
    </div>
</div>

<div class="movie-grid">
    <c:choose>
            <c:forEach var="movie" items="${allMovies}"> <!-- 전체 영화 리스트를 출력 -->
                <div class="movie-item">
                    <a href="${path}/contents/movies/movies_detail?mv_num=${movie.mv_num}">
                        <img src="${movie.poster_url}" alt="${movie.title}"/>
                        <!--<div class="label">${movie.title}</div>  영화 제목을 라벨로 추가 -->
                    </a>
                </div>
            </c:forEach> 
    </c:choose>
</div>

<%@ include file="../../common/footer.jsp" %>
</body>
</html>
