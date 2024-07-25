<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>		
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="s" %>

<%@ include file="header.jsp"%>

<s:query var="rs" dataSource="java/MySQLDB">
	SELECT * FROM freewrite WHERE num = ${param.num}
</s:query>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>${param.num}번째 게시물</title>
<style>
    table {
        margin: auto;
    }
    input[type="text"], input[type="password"] {
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
    
    .bts{
    	text-align:center;
    }
    	
</style>
</head>
<body>
<form action="freeDetail_updateSubmit.jsp" method="POST">
  <input type="hidden" name="num" value="${param.num}" />
   <table> 
    <tr><td><h2>게시글 수정</h2></td></tr>
    <tr><td class="header">제목</td></tr>
    <tr><td><input type="text" name="title" value="${rs.rows[0].title}"></td></tr>
    <tr><td class="header">작성자</td></tr>
    <tr><td><input type="text" name="guestName" value="${rs.rows[0].guestName}" 
    			readonly style="font-weight:bold;color:gray;background-color:lightgray;"></td></tr>
    <tr><td class="header">확인 번호</td></tr>
    <tr><td><input type="password" name="checkNumber"></td></tr>
    <tr><td class="header">내용</td></tr>
    <tr><td><textarea name="message">${rs.rows[0].message}</textarea></td></tr>
    <tr><td class="bts"><input type="submit" value="수정완료"></td></tr>
   </table>
</form>
</body>
</html>

<%@ include file="footer.jsp"%>