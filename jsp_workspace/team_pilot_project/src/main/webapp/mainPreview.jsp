<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="s"%>


<s:query var="result" dataSource="java/MySQLDB">
	SELECT * FROM freewrite ORDER BY num DESC 
	LIMIT 5
</s:query>

<s:query var="result2" dataSource="java/MySQLDB">
	SELECT * FROM place_lounge ORDER BY num DESC 
	LIMIT 5
</s:query>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
.latest-posts {
    display: flex;
    justify-content: space-around;
    padding: 50px;
    background-color: #fff;
}

.latest-posts div {
   width: 30%;
   box-shadow: 0px 0px 7px lightgray;
   padding : 20px;
}

.latest-posts h2 {
    color: #FFCC00;
    border-bottom: 2px solid #FFCC00;
    padding-bottom: 10px;
    margin-bottom: 20px;
}

.latest-posts table {
    list-style: none;
    padding: 0;
}

.latest-posts li {
    font-size: 16px;
    margin-bottom: 10px;
    border-bottom: 1px solid lightgray;
    color: #555;
}

a{
	text-decoration-line: none;
	color: #555;
}

.previewtitle{
	color: #FFCC00;
}
</style>

</head>
<body>
<br/> <br/>
<h1 class="previewtitle" style="text-align:left;">· 최신 소식 빠르게 확인하기</h1>

  <div class="latest-posts"  style="text-align:left;">

        <div>
            <h2><a href="free.jsp">자유게시판</a></h2>
            <c:forEach var="free" items="${result.rows}">
			<ul>
				<li><a href="freeDetail.jsp?num=${free.num}">${free.title}</a></li>
			</ul>
			</c:forEach>
        </div>
        <div>
            <h2><a href="mungPlaceIndex.jsp">멍플레이스</a></h2>
            <c:forEach var="place" items="${result2.rows}">
			<ul>
				<li>${place.title}</li>
			</ul>
			</c:forEach>
        </div>
    </div>
    <br/> <br/> <br/>
</body>
</html>