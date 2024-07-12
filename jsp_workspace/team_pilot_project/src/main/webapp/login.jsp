<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ include file="header.jsp"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>로그인2</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');
		@import url('https://fonts.googleapis.com/css2?family=Jua&display=swap');
		
        * {
            font-family: 'Noto Sans KR', sans-serif;
        }
        
        .loginTitle{
        	font-family: "Jua", sans-serif;
        	text-align: center;
        	font-size: 50px;
        	color: black;
        }
        
        .body {
            background-color: rgb(255,246,189);
        }

        .div {
            margin: auto;
            width: 300px;
            background-color: white;
            border-radius: 5px;
            text-align: center;
            padding: 20px;
        }
        
        input[type='text'] ,
        input[type='password'] ,
        input[type='submit'] {
            width: 100%;
            padding: 10px;
            box-sizing: border-box;
            border-radius: 5px;
            border: none;
        }
        
        input[type='text'].in ,
        input[type='password'].in {
            margin-bottom: 10px;
            border-radius: 5px;
            border: 1px solid lightgray;
        }
        

        #btn {
            background-color: rgb(245,212,46);
            margin-bottom: 15px;
            color: white;
        }

        .text {
            text-decoration: none;
            color: #9B9B9B;
            font-size: 12px;
        }
        

    </style>
</head>

<body class="body">
	<br/>
	<br/>
	<h1 class="loginTitle">♥LOGIN♥</h1>
	<br/>
    <div class="div">
        <form action="">
            <input type="text" placeholder="아이디" class="in">
            <input type="password" placeholder="비밀번호" class="in">
            <input type="submit" id="btn" value="로그인"><br>
        </form>
        <label>
        	<input type="checkbox" class="ftitle" /><span>로그인 정보 기억</span>
        </label>
        <br/>
         <br/>
        <a href="" class="text">비밀번호를 잊어버리셨나요?</a> <br/>
        <a href="join.jsp" class="text">회원가입</a>
    </div>
    <br/>
    <br/>
    <br/>
</body>

</html>
<%@ include file="footer.jsp"%>