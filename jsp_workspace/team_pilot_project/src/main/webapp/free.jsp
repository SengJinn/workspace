<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="s"%>

<%@ include file="header.jsp"%>

<s:query var="result" dataSource="java/MySQLDB">
	SELECT * FROM freewrite ORDER BY num DESC
</s:query>

<jsp:useBean id="cri" class="util.Criteria" scope="page" />
<jsp:setProperty property="*" name="cri" />

<s:query var="result" dataSource="java/MySQLDB">
	SELECT * FROM freewrite ORDER BY num DESC 
	limit ${cri.getStartRow()}, ${cri.getPerPageNum()}
</s:query>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>게시판</title>
<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap');

.freeBody {
    margin: 0;
    padding: 0;
    font-family: "Noto Sans KR", sans-serif;
    background-color: rgb(255, 246, 189);
}

.freeDiv{
		margin:auto;
        width: 900px;
        background-color: white;
        border-radius: 20px;
        padding: 30px;
}


table {
    margin: auto;
    width: 700px;
    border-radius: 5px;
    border-collapse: collapse;
    border-top: none;
}

.freeHeader {
    background-color: rgb(245, 212, 46);
    text-align: center;
    border-top: 1px lightgray solid;
    margin: 0px;
}

.table td, .table th {
    border-bottom: 1px lightgray solid;
    height: 30px;
    font-size: 14px;
}

.num {
    width: 50px;
}

.title {
    width: 470px;
}

.body {
    text-align: center;
}

.body .title {
    padding-left: 30px;
    text-align: left;
}

.body .title:hover {
    text-decoration-line: underline;
}

button {
    width: 100px;
    height: 40px;
    font-size: 15px;
    border: 0;
    border-radius: 5px;
    padding-left: 10px;
    background-color: rgb(245, 212, 46);
    color: white;
}

button:hover {
    background-color: ffdc72;
    cursor: pointer;
}

button:active {
    transform: scale(0.95);
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    background-color: FFCC00;
    transition: 0.2s;
}

.move1, .move2 {
    color: black;
    width: 100px;
    height: 40px;
    font-size: 15px;
    border: 0;
    border-radius: 5px;
    padding: 7px;

}

.move1:active, .move2:active {
    color: white;
    width: 100px;
    height: 40px;
    font-size: 15px;
    border: 0;
    border-radius: 100%;
    padding: 7px;
    background-color: rgb(245, 212, 46);
}

.move1:hover, .move2:hover {
    color: white;
    width: 100px;
    height: 40px;
    font-size: 15px;
    border: 0;
    border-radius: 100%;
    padding: 7px;
    background-color: rgb(245, 212, 46);
}

.move1 {
    color: rgb(245, 212, 46);
}

.activePage {
    color: white;
    background-color: rgb(245, 212, 46);
    border-radius: 100%;
}

</style>
</head>
<body class="freeBody">
	<br/>
    <br />
    <br />

<div class="freeDiv">
    <table class="table">
    <br />    <br />
        <tr>
            <td colspan="2"><h1>자유 게시판</h1></td>
        </tr>
        <tr class="freeHeader">
            <td class="num">번호</td>
            <td class="title">제목</td>
            <td>작성자</td>
            <td>작성날짜</td>
        </tr>
        <c:forEach var="free" items="${result.rows}">
            <tr class="body">
                <td class="whitebox">${free.num}</td>
                <td class="title whitebox">
                    <a href="freeDetail.jsp?num=${free.num}" style="text-decoration: none; color: black;">${free.title}</a>
                </td>
                <td class="whitebox">${free.guestName}</td>
                <td class="whitebox">${free.writeDate}</td>
            </tr>
        </c:forEach>
    </table>
    <br />
    <table>
        <tr>
            <td style="padding-left: 0px;">
                <button class="btg" onclick="location.href='write.jsp'">글쓰기</button>
            </td>
        </tr>
    </table>

    <!-- 페이징 블럭 작성  -->
    <s:query var="rs" dataSource="java/MySQLDB" sql="SELECT count(*) as count FROM freewrite" />

    <jsp:useBean id="pm" class="util.PageMaker" />
    <!-- 페이징처리를 위해 필수 정보 3가지: cri, displayPageNum, totalCount -->
    <jsp:setProperty property="cri" name="pm" value="${cri}" />
    <jsp:setProperty property="displayPageNum" name="pm" value="5" />
    <jsp:setProperty property="totalCount" name="pm" value="${rs.rows[0].count}" />

    <br />
    <div style="text-align:center;">
        <c:if test="${cri.page > 1}">
            <a href="free.jsp?page=1" class="move1">&#60;&#60;</a> <!-- 처음 -->
            &nbsp;
            <c:if test="${pm.prev}">
                <a href="free.jsp?page=${pm.startPage - 1}" class="move1">&#60;</a> <!-- 이전 -->
                &nbsp;
            </c:if>
        </c:if>

        <c:forEach var="i" begin="${pm.startPage}" end="${pm.endPage}" step="1">
            <a href="free.jsp?page=${i}" class="<c:out value='move2${cri.page == i ? " activePage" : ""}' />">&nbsp;${i}&nbsp;</a>
        </c:forEach>

        <c:if test="${cri.page < pm.maxPage}">
            <c:if test="${pm.next}">
                &nbsp;
                <a href="free.jsp?page=${pm.endPage + 1}" class="move1">&#62;</a> <!-- 다음 -->
            </c:if>
            &nbsp;
            <a href="free.jsp?page=${pm.maxPage}" class="move1">&#62;&#62;</a> <!-- 마지막 -->
        </c:if>
        <br />
        <br />
        <br />
    </div>
    </div>
    <br />
    <br />
</body>
</html>

<br/>
<br/>
<br/>

<%@ include file="footer.jsp"%>
