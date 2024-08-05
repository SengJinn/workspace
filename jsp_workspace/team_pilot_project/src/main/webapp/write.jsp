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

	@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap');

.writeBody{
	 background-color: rgb(255, 246, 189);
	 font-family: "Noto Sans KR", sans-serif;
}

.writeDiv{
		margin:auto;
        width: 650px;
        background-color: white;
        border-radius: 20px;
        padding: 30px;
}


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
    border-radius: 5px;
    padding-left: 10px;
    background-color: rgb(245, 212, 46);
    color: white;
}

input[type="submit"]:hover {
    background-color: ffdc72;
    cursor: pointer;
}

input[type="submit"]:active {
    transform: scale(0.95);
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    background-color: FFCC00;
    transition: 0.2s;
}
</style>
</head>
<body class="writeBody">
<br/><br/>
<div class="writeDiv">
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
    <tr><td> <br/> <input type="submit" value="등록"></td></tr>
</table>
</form>
</div>
<br/>
<br/>

</body>
</html>

<%@ include file="footer.jsp" %>