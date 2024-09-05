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
    margin-top: 430px;
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
input[type="email"] {
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
    /* background-color: #FFA200; */
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
        <form class="signup-form" method="POST">
            <h2>VIVIVIEW<br/>회원가입</h2>
            
            <br/>
            
            <label for="email">이메일</label>
            <input type="email" id="email" placeholder="이메일 주소 입력">

            <label for="password">비밀번호</label>
            <input type="password" id="password" placeholder="영문, 숫자, 특수문자 조합 8~15 자리">

            <label for="password-confirm">비밀번호 확인</label>
            <input type="password" id="password-confirm" placeholder="비밀번호 다시 입력">  

            <label for="phone">휴대폰 번호</label>
            <div class="phone-section">
                <input type="text" id="phone" placeholder="휴대폰 번호 입력">
                <button type="button" class="verify-button">인증번호 전송</button>
            </div>
	
			<input type="text" id="phone" placeholder="인증 번호 입력">
			
            <div class="agreements">
                <div class="checkbox-item">
                    <input type="checkbox" id="agree-all" name="agree-check" >
                    <label for="agree-all">필수 및 선택 항목을 모두 포함하여 동의합니다.</label>
                </div>

                <div class="checkbox-item">
                    <input type="checkbox" id="age-confirm" name="agree-check" class="checkbox-check">
                    <label for="age-confirm">만 14세 이상입니다.</label>
                </div>

                <div class="checkbox-item">
                    <input type="checkbox" id="terms" name="agree-check" class="checkbox-check">
                    <label for="terms">[필수] 서비스 이용약관 동의</label>
                </div>

                <div class="checkbox-item">
                    <input type="checkbox" id="privacy" name="agree-check" class="checkbox-check">
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
            	        $(".join-button").css({"backgroundColor":"#cbcbcb","cursor":"auto","color":"#303033"}).prop("disabled",true);
            	    }
            	});
/* 
            	// 모든 체크박스를 클릭하면 버튼 활성화시키기
            	$('.checkbox-item').click(function(){
            	    var tmpp = $(this).prop('checked'); 
            	    //자식 체크 전체 체크시, 부모 체크박스 체크 됨
            	    var tt = $(".checkbox-item").length;
            	    var ss = $(".checkbox-item:checked").length;
            	    
            	    //선택한 체크박스 값이 true 이거나 체크박스 1개 이상 체크시 버튼 활성화시키기
            	    if(tmpp==true || ss>0){
            	    $(".join-button").css({"backgroundColor":"#FFA200","cursor":"pointer","color":"#fff"}).prop("disabled",false);
            	    }
            	    else{
            	    $(".join-button").css({"backgroundColor":"#cbcbcb","cursor":"auto","color":"#303033"}).prop("disabled",true);
            	    }
            	    
            	    
            	    // 체크박스가 모두 선택되었을 때 상위 체크박스 선택되도록 설정
            	    if(tt == ss){
            	    	$("#agree-all").prop("checked",true);
            	    }else{
            	    	$("#agree-all").prop("checked",false);
            	    }
            	    
            		}); 
            	 */
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
