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
    margin-top: 570px;
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

.phone-section {
    display: flex;
    justify-content: space-between;
}

.phone-section input[type="text"] {
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
    height: 100px;
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
    cursor: pointer;
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
                <button type="button" class="verify-button email-verify">인증번호 전송</button>
            </div>   
            
            <input type="text"  placeholder="인증 번호 입력">

            <label for="password">비밀번호</label>
            <input type="password" id="password" name="pass" placeholder="영문, 숫자 조합 8~30 자리" minlength='8' maxlength='30' required>

            <label for="password-confirm">비밀번호 확인</label>
            <input type="password" id="password-confirm" placeholder="비밀번호 다시 입력" required>  
            
            <label for="age">나이</label>
            <input type="number" id="age" name="age" placeholder="만 14세 이상만 가입 가능합니다." min="14" required>

            <label for="phone">휴대폰 번호</label>
            <div class="phone-section">
                <input type="text" id="phone" name="phone" placeholder="휴대폰 번호 입력" required>
                <button type="button" class="verify-button phone-verify">인증번호 전송</button>
            </div>
	
			<input type="text" placeholder="인증 번호 입력" required>
			
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
            
            
            <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert2/11.7.2/sweetalert2.all.min.js"></script>
            <script>
    	    window.onload = function() {

    	        var joinFail = "${joinFail}";
    	        // joinFail 메시지가 존재하면 SweetAlert 창 띄우기
    	        if (joinFail) {
    	            Swal.fire({
    	                title: '알림',
    	                text: joinFail,
    	                icon: 'warning',
    	                confirmButtonColor: '#FFA200',
    	            });
    	        }
    	        
    	    }
    	    
            </script>
            
            
            <script src="http://code.jquery.com/jquery-latest.min.js"></script>
            <script>
            $(document).ready(function(){
            	//전체 체크 클릭 시, 나머지 체크 
            	$("#agree-all").click(function(){
            	var agree_all = $("#agree-all").prop("checked");
					
            	    if(agree_all){
            	        $(".checkbox-check").prop("checked",true);
            	        $(".join-button").css({"backgroundColor":"#FFA200","cursor":"pointer","color":"#fff"}).prop("disabled",false);
            	    }
            	    else{
            	        $(".checkbox-check").prop("checked",false);
            	        $(".join-button").css({"backgroundColor":"#cbcbcb","cursor":"auto","color":"#fff"}).prop("disabled",true);
            	    }
            	    
            	    // agree-all이 비활성화 될 경우 나머지 목록도 체크 해제
            	    if(!agree_all){
            	    	$(".checkbox-check").prop("checked",false);
            	    }
   
            	    
            	});

            	// 모든 체크박스를 클릭하면 버튼 활성화시키기
            	$('.checkbox-check').click(function(){
            		
            	    var necessarycheck1 = $(".necessarycheck1").prop('checked'); 
            	    var necessarycheck2 = $(".necessarycheck2").prop('checked'); 
            	    var necessarycheck3 = $(".necessarycheck3").prop('checked'); 
            	    
            	    var somecheck = $(".checkbox-check").length;
            	    var checkedbox = $(".checkbox-check:checked").length;
            	    
            	    //선택한 체크박스 값이 true면 버튼 활성화
            	    if(necessarycheck1==true && necessarycheck2==true && necessarycheck3==true){
            	    $(".join-button").css({"backgroundColor":"#FFA200","cursor":"pointer","color":"#fff"}).prop("disabled",false);
            	    }
            	    else{
            	    $(".join-button").css({"backgroundColor":"#cbcbcb","cursor":"auto","color":"#fff"}).prop("disabled",true);
            	    }
            	    
            	    // 체크박스가 모두 선택되었을 때 모두 동의 체크박스가 선택되도록 설정
            	    if(somecheck == checkedbox){
            	    	$("#agree-all").prop("checked",true);
            	    }else{
            	    	$("#agree-all").prop("checked",false);
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
