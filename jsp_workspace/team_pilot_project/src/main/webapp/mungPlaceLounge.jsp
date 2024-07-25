<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="s"%>

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
<title></title>
<style>

table {
	margin: auto;
	width: 800px;
	border-radius: 5px;
	border-collapse: collapse;
	border-top: none;
}

.mungPlaceheader {
	background-color: rgb(255, 246, 189);
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

.btg {
	width: 100px;
	height: 40px;
	font-size: 15px;
	border: 0;
	outline: 1.5px rgb(255, 187, 0) solid;
	border-radius: 5px;
 	padding-left: 10px;
	background-color: rgb(245, 212, 46);
}

.btg:active {
	width: 100px;
	height: 40px;
	font-size: 15px;
	border: 0;
	border-radius: 5px;
	outline: 1.5px rgb(27, 76, 155) solid;
	padding-left: 10px;
	background-color: rgb(68, 136, 244);
}

.move1, .move2{
	color:black;
	width: 100px;
	height: 40px;
	font-size: 15px;
	border: 0;
	outline: 1.5px rgb(255, 187, 0) solid;
	border-radius: 5px;
	padding: 7px;
	background-color: rgb(255, 246, 189);
}

.move1:active, .move2:active{
	color:white;
	width: 100px;
	height: 40px;
	font-size: 15px;
	border: 0;
	border-radius: 5px;
	outline: 1.5px rgb(255, 187, 0) solid;
	padding: 7px;
	background-color: rgb(245, 212, 46);
}

</style>
</head>
<body>
	<table class="table">
		<tr>
			<td colspan="2"><h2>멍플레이스</h2></td>
		</tr>
		<tr class="mungPlaceheader">
			<td class="num">번호</td>
			<td class="title">제목</td>
			<td>작성자</td>
			<td>작성날짜</td>
		</tr>
		<c:forEach var="free" items="${result.rows}">
			<tr class="body">
				<td>${free.num}</td>
				<td class="title"><a href="freeDetail.jsp?num=${free.num}"
					style="text-decoration: none; color: black;"> ${free.title} </a></td>
				<td>${free.guestName}</td>
				<td>${free.writeDate}</td>
			</tr>
		</c:forEach>
	</table>
	<br />
	<table>
		<tr>
			<td style="padding-left: 300px;">
			<button class="btg" onclick="location.href='write.jsp'">글쓰기</button>
			</td>
		</tr>
	</table>

	<!-- 페이징 블럭 작성  -->
	<s:query var="rs" dataSource="java/MySQLDB"
		sql="SELECT count(*) as count FROM freewrite" />

	<jsp:useBean id="pm" class="util.PageMaker" />
	<!-- 페이징처리를 위해 필수 정보 3가지  
		cri, displayPageNum, totalCount 
		나머지는 PageMaker가 알아서 해줌 -->
	<jsp:setProperty property="cri" name="pm" value="${cri}" />
	<jsp:setProperty property="displayPageNum" name="pm" value="5" />
	<jsp:setProperty property="totalCount" name="pm"
		value="${rs.rows[0].count}" />

	<%-- ${pm} --%>
	<br />
<div style="text-align:center;">
	<c:if test="${cri.page > 1}">
		<a href="free.jsp?page=1" class="move1">처음</a>
		&nbsp;
		<c:if test="${pm.prev}">
			<a href="free.jsp?page=${pm.startPage - 1}" class="move1">이전</a>
			&nbsp;
		</c:if>
	</c:if>

	<c:forEach var="i" begin="${pm.startPage}" end="${pm.endPage}" step="1">
		<a href="free.jsp?page=${i}" class="move2">&nbsp;${i}&nbsp;</a>
	</c:forEach>
	<c:if test="${cri.page < pm.maxPage}">
		<c:if test="${pm.next}">
			&nbsp;
			<a href="free.jsp?page=${pm.endPage + 1}" class="move1">다음</a>
		</c:if>
		&nbsp;
		<a href="free.jsp?page=${pm.maxPage}" class="move1">마지막</a>
	</c:if>
</div>
	<br />
	<br />
</body>
</html>

<%@ include file="footer.jsp"%>

