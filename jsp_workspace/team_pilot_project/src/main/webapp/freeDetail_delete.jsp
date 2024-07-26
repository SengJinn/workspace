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
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap');
	.deleteDetail{
		background-color: rgb(255, 246, 189);
		 font-family: "Noto Sans KR", sans-serif;
	}
	
	.div1{
		text-align:center;
		margin : 300px auto;
        width: 600px;
        background-color: white;
        border-radius: 20px;
        padding: 30px;
	}

	input[type="password"]{
        border: 1.5px rgb(245,212,46) solid;
        width: 200px;
        height: 30px;
        border-radius: 5px;
        padding-left: 10px;
    }

    input[type="submit"] {
    width: 70px;
    height: 30px;
    font-size: 15px;
    border: 0;
    border-radius: 5px;
    padding-left: 10px;
    background-color: rgb(245, 212, 46);
    color: white;
    }
    
    input[type="submit"]:active {
	    transform: scale(0.95);
	    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
	    background-color: FFCC00;
	    transition: 0.2s;
    }
    
    input[type="submit"]:hover {
    background-color: ffdc72;
    cursor: pointer;
}
    
    
</style>

</head>
<body class= "deleteDetail" >
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