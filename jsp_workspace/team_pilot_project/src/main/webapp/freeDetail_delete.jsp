<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${param.num}번째 게시물</title>
<style>
	.div1{
		text-align:center;
		margin : 300px auto;
	}

	input[type="password"]{
        border: 1.5px rgb(245,212,46) solid;
        width: 200px;
        height: 30px;
        border-radius: 5px;
        padding-left: 10px;
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
	<div class="div1">
		<h2>확인용 번호를 입력하면 삭제됩니다.</h2>
		<form action="freeDetail_deleteSubmit.jsp" method="POST">
			<input type="hidden" name="num" value="${param.num}"/>
			<input type="password" name="checkNumber" placeholder="게시글 확인용 번호"/>
			<input type="submit" value="삭제"/>
		</form>
	</div>
</body>
</html>

<%@ include file="footer.jsp"%>