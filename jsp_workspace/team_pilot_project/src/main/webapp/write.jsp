<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ include file="header.jsp" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>글쓰기</title>
<style>
    table {
        margin: auto;
    }
    input[type="text"] {
        border: 1.5px rgb(245,212,46) solid;
        width: 500px;
        height: 30px;
        border-radius: 5px;
        padding-left: 10px;
    }
    textarea {
        border: 1.5px rgb(245,212,46) solid;
        width: 500px;
        height: 400px;
        border-radius: 5px;
        padding-left: 10px;
        padding-top: 10px;
        resize: none;
    }
    .header {
        height: 30px;
    }
    input[type="submit"] {
        width: 100px;
        height: 40px;
        font-size: 15px;
        border: 0;
        outline: 1.5px rgb(255,187,0) solid;
        border-radius: 5px;
        padding-left: 10px;
        background-color: rgb(245,212,46);
    }
    input[type="submit"]:active {
        width: 100px;
        height: 40px;
        font-size: 15px;
        border: 0;
        border-radius: 5px;
        outline: 1.5px rgb(27, 76, 155) solid;
        padding-left: 10px;
        background-color: rgb(68, 136, 244);
    }
</style>
</head>
<body>
<form action="free_write_board.jsp" method="post">
<table> 
    <tr><td><h2>글쓰기</h2></td></tr>
    <tr><td class="header">제목</td></tr>
    <tr><td><input type="text" placeholder="제목을 입력하세요" name="title"></td></tr>
    <tr><td class="header">작성자</td></tr>
    <tr><td><input type="text" placeholder="닉네임을 입력하세요" name="guestName"></td></tr>
    <tr><td class="header">확인 번호</td></tr>
    <tr><td><input type="text" placeholder="확인용 번호를 입력하세요" name="checkNumber"></td></tr>
    <tr><td class="header">내용</td></tr>
    <tr><td><textarea placeholder="내용을 입력하세요" name="message"></textarea></td></tr>
    <tr><td><input type="submit" value="등록"></td></tr>
</table>
</form>


</body>
</html>

<%@ include file="footer.jsp" %>