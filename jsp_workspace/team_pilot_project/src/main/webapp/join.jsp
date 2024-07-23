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
    
     input[type='text'].in2 {
    	width: 60%;
    	margin-right: 55px;
    }
    
    input[type='text'],
    input[type='password'],
    input[type='submit'] {
        width: 100%;
        padding: 10px;
        box-sizing: border-box;
        border-radius: 5px;
        border: none;
    }
    
    input[type='email'] {
        width: 60%;
        padding: 10px;
        box-sizing: border-box;
        border-radius: 5px;
        border: none;
        margin-right: 55px;
    }
    
    
    input[type='text'].in,
    input[type='password'].in,
    input[type='email'].in {
        margin-bottom: 10px;
        border-radius: 5px;
        border: 1px solid lightgray;
    }

    .btn{
            background-color: rgb(245,212,46);
            margin-bottom: 15px;
            color: white;
            cursor: pointer;
            border-radius: 5px;
            border: 0;
        }
        
    .btn:hover{
    	background-color: ffdc72;
    }
        
    .btn:active{
    		background-color: FFCC00;
		    transform: scale(0.95);
		    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
		    border-radius: 5px;
		    border: 0;
		    transition: 0.2s;
        }     
        
     #joinBtn{
     	width: 100%;
     	height: 40px;
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
        <form id="joinForm" action="joinSubmit.jsp" method="post">
            <input type="text" name="id" id="id" placeholder="아이디" class="in" value="<%= request.getParameter("id") != null ? request.getParameter("id") : "" %>" required>
            <input type="password" name="pass" placeholder="비밀번호" class="in" value="<%= request.getParameter("pass") != null ? request.getParameter("pass") : "" %>" required>
            <input type="password" name="passA" placeholder="비밀번호 확인" class="in" value="<%= request.getParameter("passA") != null ? request.getParameter("passA") : "" %>" required>
            <input type="text" name="name" id="name" placeholder="이름" class="in" value="<%= request.getParameter("name") != null ? request.getParameter("name") : "" %>" required>
            <input type="email" id="email" name="email" placeholder="이메일" class="in" value="<%= request.getParameter("email") != null ? request.getParameter("email") : "" %>" required>
            <button type="submit" class="btn" id="acceptEmail">본인인증</button>
            <input type="text" name="verification_code" id="emailCode" placeholder="확인 코드 입력" class="in in2" required>
            <input type="button" class="btn" value="인증확인" id="emailAcceptBtn">

            <br/>
            <input type="button" class="btn" id="joinBtn" value="회원가입">
        </form>
        <a href="login.jsp" class="text">이미 회원이신가요?<br/>이곳을 클릭하여 로그인하세요.</a> 
        <br/>
        <br/>
    </div>
    <br/>
    <br/>
    <br/>
</body>

<script>
//메일발송 이벤트 처리
let emailCode = ''; // 발송된 인증 코드 저장

acceptEmail.onclick = function(){
	
	//메일 발송 요청 시 - 메일 발송 버튼 비활성화
	this.setAttribute("disabled", "disabled");

	let email = document.querySelector("#email");
	fetch("sendVerificationCode.jsp",{ 
		method : "POST",
		// 수신자 이메일 : 인증 받을 이메일 주소를 파라미터로 전달
		body : new URLSearchParams({email : email.value})
	})
	.then(res => res.json())
	.then(result => {
		console.log(result)
		// 발신한 코드 정보 저장
		emailCode = result;
		// 메일 인증 코드 발송 완료
		alert('이메일 인증 코드 발송 완료! 이메일을 확인해주세요!');
		// emailCodeWrap.style.display = "block" ;
	})
	.catch(error => console.log(error));
	
}


// 인증코드 확인 버튼 이벤트 처리
document.querySelector("#emailAcceptBtn").onclick = function(){
	let userCode = document.querySelector("#emailCode").value;
	let message = "";
	if(userCode != "" && emailCode == userCode){
		// 인증코드 일치
		alert("이메일 인증이 완료되었습니다.");
		message = "이메일 인증 완료";
		boolUid = true;
		// 이메일 발송 버튼 disabled 속성 제거
		acceptEmail.removeAttribute("disabled");
		acceptEmail.style.display = "none";
		// emailCodeWrap.style.display = "none";
	}else{
		alert("인증 코드를 다시 확인해 주세요.");
		message = "인증 코드를 다시 확인해 주세요.";
		boolUid = false;
	}
	// 결과 메세지 출력
	// let elP = acceptEmail.parentNode.querySelector(".result");
	// showMessage(elP, message, boolUid);
};// end 인증 코드 확인


// 회원 가입 버튼 클릭 시 각 요소의 입력값 검증 여부 확인
document.querySelector("#joinBtn").onclick = function(){
	if(!boolUid){
		alert("이메일 인증을 확인해주세요.");
		document.querySelector("#email").focus();
	} else{
		// joinForm tag submit 이벤트 실행
		document.querySelector("#joinForm").submit();
	}
};

</script>


</html>
<%@ include file="footer.jsp"%>