<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ include file="header.jsp"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입</title>

<script>
    function checkId() {
        var id = document.getElementById("id").value;
        if (id === "") {
            alert("아이디를 입력해주세요.");
            return;
        }
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "checkId.jsp", true);
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4 && xhr.status === 200) {
                alert(xhr.responseText);
            }
        };
        xhr.send("id=" + encodeURIComponent(id));
    }

    function validateForm() {
        var pass = document.getElementsByName("pass")[0].value;
        var passA = document.getElementsByName("passA")[0].value;
        if (pass !== passA) {
            alert("비밀번호가 일치하지 않습니다. 다시 입력해 주세요.");
            document.getElementsByName("passA")[0].focus();
            return false;
        }
        return true;
    }
    
    
    let msg = '${msg}';
    if(msg != ''){
    	alert(msg);
    }
</script>



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
        	color: 3A2400;
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
            cursor: pointer;
        }
        
        #btn:active {
        	transform: scale(0.95);
		    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
		    background-color: FFCC00;
        }
        
        #submitButton{
        	margin-left: 53px;
        	background-color: rgb(245,212,46);
            color: white;
            border-radius: 5px;
            border: none;
            cursor: pointer;
        }
        
       #submitButton:active {
        	transform: scale(0.95);
		    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
		    background-color: FFCC00;
        }
        
        .text {
            text-decoration: none;
            color: #9B9B9B;
            font-size: 12px;
        }   
        
        .text:hover{
        	text-decoration: underline;
        }

    </style>
    
    
    
</head>

 <body class="body">
	<br/>
	<br/>
	<h1 class="joinTitle">♥JOIN US♥</h1>
	<br/>
    <div class="div">
        <form action="joinSubmit.jsp">
            <input type="text" placeholder="아이디" class="in" name="id">
            <input type="button" name="uidCheck" id="idCheckButton" value="아이디중복체크" onclick="checkId()">
            <input type="password" placeholder="비밀번호" class="in" name="pass">
            <input type="password" placeholder="비밀번호 확인" class="in" name="passA">
            <input type="text" placeholder="이름" class="in" name="name">
            <input type="email" placeholder="이메일" class="in" name="email">
            <input type="button" id="submitButton" value="확인 코드 전송">
            <input type="text" placeholder="확인 코드 입력" class="in" name="verification_code">
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