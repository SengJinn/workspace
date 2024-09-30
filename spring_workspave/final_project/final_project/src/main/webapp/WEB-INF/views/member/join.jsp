<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="../common/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>VIVIVIEW JOIN</title>
</head>

<link href="https://fonts.googleapis.com/css2?family=Noto+Sans:wght@400;700&display=swap" rel="stylesheet">

<style>

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

html, body {
    height: 100%; 
    margin: 0;
}

body {
    font-family: 'Arial', sans-serif;
    background-color: #121212;
    color: white;
    display: flex;
    flex-direction: column; 
    justify-content: center;
}

.container {
    background-color: #1e1e1e;
    padding: 30px;
    border-radius: 10px;
    width: 600px; 
    margin: auto;
    margin-top: 550px;
}

h2 {
    text-align: center;
    margin-bottom: 20px;
}

label {
    display: block;
    margin-bottom: 5px;
}

input[type="text"],
input[type="password"],
input[type="email"],
input[type="number"] {
    width: 100%; 
    padding: 12px;
    margin-bottom: 15px;
    border: none;
    border-radius: 5px;
    background-color: #333;
    color: #fff;
}

input::placeholder {
    color: #999;
}

.echeck-section {
    display: flex;
    justify-content: space-between;
}

.echeck-section input[type="text"] {
    flex: 3;
    margin-right: 10px;
}

.email-section {
    display: flex;
    justify-content: space-between;
}

.email-section input[type="email"] {
    flex: 3;
    margin-right: 10px;
}

.verify-button {
    flex: 1;
    padding: 10px;
    background-color: #FFA200;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    height: 42px;
}

.verify-button:hover {
    background-color: #ffbe4d;
}

.agreements {
    margin-top: 20px;
}

.checkbox-item {
    display: flex;
    align-items: center; 
    margin-bottom: 10px;
}

.checkbox-item input[type="checkbox"] {
    margin-right: 10px;
}

.marketing-preference {
    display: flex;
    justify-content: space-around;
    margin-top: 10px;
}

.marketing-preference label {
    margin-right: 10px;
}

.footer-spacer {
    flex-grow: 1; /* 남은 공간을 차지하도록 설정 */
    height: 140px;
}

.submit-button{
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 30px 0px;
}

.join-button{
   padding: 10px;
    background-color: #cbcbcb;
    color: white;
    border: none;
    border-radius: 5px;

    width: 1000px;
	font-size: 1.2em;
}


</style>

<body>


    <div class="container">
        <form class="signup-form" method="POST" action="join">
            <h2>VIVIVIEW<br/>회원가입</h2>
            
            <br/>
            
            <label for="email">이메일</label>
            <div class="email-section">
                <input type="email" id="email" name="email" placeholder="이메일 주소 입력" required>
                <button class="verify-button email-verify">인증번호 전송</button>       
            </div>   
         	
         	<div class="echeck-section">
            <input type="text" class="validEmail" placeholder="인증 번호 입력" required>
            <button class="verify-button code-verify">인증번호 확인</button>
			</div>
			
            <label for="password">비밀번호</label>
            <input type="password" id="password" name="pass" placeholder="영문, 숫자 조합 8~30 자리" minlength='8' maxlength='30' required>

            <label for="password-confirm">비밀번호 확인</label>
            <input type="password" id="password-confirm" placeholder="비밀번호 다시 입력" required>  
            
            <label for="age">나이</label>
            <input type="number" id="age" name="age" placeholder="만 14세 이상만 가입 가능합니다." min="14" required>

            <label for="phone">휴대폰 번호</label>
			<input type="text" id="phone" name="phone" placeholder="휴대폰 번호 입력" required>
	
			
            <div class="agreements">
                <div class="checkbox-item">
                    <input type="checkbox" id="agree-all" name="agree-check" >
                    <label for="agree-all">필수 및 선택 항목을 모두 포함하여 동의합니다.</label>
                </div>

                <div class="checkbox-item">
                    <input type="checkbox" id="age-confirm" name="agree-check" class="checkbox-check necessarycheck1">
                    <label for="age-confirm">[필수] 만 14세 이상입니다.</label>
                </div>

                <div class="checkbox-item">
                    <input type="checkbox" id="terms" name="agree-check" class="checkbox-check necessarycheck2">
                    <label for="terms">[필수] 서비스 이용약관 동의</label>
                </div>

                <div class="checkbox-item">
                    <input type="checkbox" id="privacy" name="agree-check" class="checkbox-check necessarycheck3">
                    <label for="privacy">[필수] 개인정보 수집 및 이용 동의</label>
                </div>

                <div class="checkbox-item">
                    <input type="checkbox" id="optional-privacy" name="agree-check" class="checkbox-check">
                    <label for="optional-privacy">[선택] 개인정보 수집 및 이용 동의</label>
                </div>

                <div class="checkbox-item">
                    <input type="checkbox" id="marketing" name="agree-check" class="checkbox-check">
                    <label for="marketing">[선택] 마케팅 정보 수신 동의</label>
                </div>
            </div>
                
            <div class="submit-button">
            <input type="submit" value="회원가입" class="join-button" disabled /> 
            </div>
            
        <!-- sweetalert2 -->    
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert2/11.7.2/sweetalert2.all.min.js"></script>
        <!-- jquery -->
        <script src="http://code.jquery.com/jquery-latest.min.js"></script>
        
        <script>
$(document).ready(function() {
	
	var sendCode = "";
    
    // joinFail이 있을 경우 알림창 표시
    var joinFail = "${joinFail}";
    if (joinFail) {
        Swal.fire({
            title: '알림',
            text: joinFail,
            icon: 'warning',
            confirmButtonColor: '#FFA200',
        });
    }
    
    // 전체 체크 클릭 시 나머지 체크박스들도 같이 선택되도록 설정
    $("#agree-all").click(function(){
        var agree_all = $("#agree-all").prop("checked");

        if(agree_all){
            $(".checkbox-check").prop("checked", true);
            $(".join-button").css({"backgroundColor":"#FFA200","cursor":"pointer","color":"#fff"}).prop("disabled", false);
        } else {
            $(".checkbox-check").prop("checked", false);
            $(".join-button").css({"backgroundColor":"#cbcbcb","cursor":"auto","color":"#fff"}).prop("disabled", true);
        }
        console.log("a");

    });

    // 개별 체크박스 클릭 시 버튼 활성화
    $('.checkbox-check').click(function(){
        var necessarycheck1 = $(".necessarycheck1").prop('checked'); 
        var necessarycheck2 = $(".necessarycheck2").prop('checked'); 
        var necessarycheck3 = $(".necessarycheck3").prop('checked'); 
        
        if(necessarycheck1 && necessarycheck2 && necessarycheck3){
            $(".join-button").css({"backgroundColor":"#FFA200","cursor":"pointer","color":"#fff"}).prop("disabled", false);
        } else {
            $(".join-button").css({"backgroundColor":"#cbcbcb","cursor":"auto","color":"#fff"}).prop("disabled", true);
        }
		console.log("a");

    });

    // 이메일 인증 코드 전송
    $(".email-verify").on("click", function(e) {
        e.preventDefault();
        
        const email = $("#email").val();
        console.log(email);
        
        $.ajax({
            url: "${path}/member/checkEmail",
            type: "POST",
            data: {
                email: email
            },
            dataType : "text",
            success: function(response) {
            	console.log(response);
            	sendCode = response;
                Swal.fire({
                    title: '알림',
                    text: "인증 메일을 발송했습니다.",
                    icon: 'success',
                    confirmButtonColor: '#FFA200',
                });
            },
            error: function(xhr, status, error) {
                Swal.fire({
                    title: '알림',
                    text: "메일 발송에 실패했습니다.",
                    icon: 'warning',
                    confirmButtonColor: '#FFA200',
                });
            }
        });
    });

    // 비밀번호 확인 로직
    $(".join-button").click(function(p) {
        const password = $("#password").val();
        const confirmPassword = $("#password-confirm").val();
        const validEmail = $(".validEmail").val();
        
        if (password !== confirmPassword) {
            p.preventDefault();  // 폼 제출 방지
            Swal.fire({
                title: '알림',
                text: "비밀번호가 일치하지 않습니다. 다시 확인해주세요.",
                icon: 'warning',
                confirmButtonColor: '#FFA200',
            });
        } if (validEmail !== sendCode) {
        	p.preventDefault();  // 폼 제출 방지
            Swal.fire({
                title: '알림',
                text: "인증 번호가 일치하지 않습니다. 다시 한 번 확인해주세요.",
                icon: 'warning',
                confirmButtonColor: '#FFA200',
            });
        }
        
    });
    
    // 이메일 인증 코드 확인 함수
    $(".code-verify").click(function (validCheck) {
     	const validEmail = $(".validEmail").val();

        console.log(sendCode);
        if(validEmail != null && validEmail == sendCode){
            // $(".join-button").attr("type", "submit");
            Swal.fire({
                title: '알림',
                text: "인증 번호가 확인되었습니다.",
                icon: 'success',
                confirmButtonColor: '#FFA200',
            });
        } else {
            Swal.fire({
                title: '알림',
                text: "인증 번호가 일치하지 않습니다. 다시 한 번 확인해주세요.",
                icon: 'warning',
                confirmButtonColor: '#FFA200',
            });
        }
    });
    
});
</script>
            
            
        </form>
    </div>

    <!-- 남은 공간을 차지하게 하는 요소 -->
    <div class="footer-spacer"></div>
    
	<br/><br/><br/>
	
    <%@ include file="../common/footer.jsp" %>

</body>
	
</body>
</html>
