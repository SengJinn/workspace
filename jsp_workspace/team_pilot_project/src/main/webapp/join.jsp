<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ include file="header.jsp"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입</title>
<style>
        @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');
		@import url('https://fonts.googleapis.com/css2?family=Jua&display=swap');
		      
        * {
            font-family: 'Noto Sans KR', sans-serif;
        }
        
		.joinTitle{
        	font-family: "Jua", sans-serif;
        	text-align: center;
        	font-size: 40px;
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
        
         input[type='email'] {
            width: 50%;
            padding: 10px;
            box-sizing: border-box;
            border-radius: 5px;
            border: none;
        }
        
        input[type='text'].in ,
        input[type='password'].in,
        input[type='email'].in {
            margin-bottom: 10px;
            border-radius: 5px;
            border: 1px solid lightgray;
        }
        

        #btn {
            background-color: rgb(245,212,46);
            color: white;
        }
        
        #submitButton{
        	margin-left: 53px;
        	background-color: rgb(245,212,46);
            color: white;
            border-radius: 5px;
            border: none;
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
	<h1 class="joinTitle">♥JOIN US♥</h1>
	<br/>
    <div class="div">
        <form action="">
            <input type="text" placeholder="아이디" class="in">
            <input type="password" placeholder="비밀번호" class="in">
            <input type="password" placeholder="비밀번호 확인" class="in">
            <input type="text" placeholder="이름" class="in">
            <input type="email" placeholder="이메일" class="in">
            <input type="button" id="submitButton" value="확인 코드 전송">
            <input type="text" placeholder="확인 코드 입력" class="in">
            <br/>
            <input type="submit" id="btn" value="회원가입">
        </form>
        <br/>
        <a href="" class="text">확인 코드를 받지 못 하셨나요?<br/>이곳을 클릭하여 재전송 받으세요.</a> 
        <br/>
        <br/>
    </div>
    <br/>
    <br/>
    <br/>
</body>

</html>
<%@ include file="footer.jsp"%>