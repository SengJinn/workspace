<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../common/header.jsp" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>VIVIVIEW - 비밀번호 찾기</title>

<link rel="stylesheet" href="${path}/resources/css/member/find.css">

</head>
<body>
	<div class="wrapper">
		<div class="subject">비밀번호 찾기</div>
		<div class="innerWrapper">
			<p>비밀번호 찾기 방법을 선택해 주세요.</p>
			<p>선택하신 수단으로 비밀번호 재설정이 진행됩니다.</p>
			
			<form action="" method="POST">
				<div class="selectPhone" onclick="drop()">휴대폰 번호로 찾기</div>
				<div class="infoBox">
					<input type="email" id="phone" name="phone" placeholder="휴대폰 번호 ('-'없이 입력)"
							maxlength="11"/>
					<input type="button" class="send" value="인증번호 발송"/>
					<input type="text" class="code" name="code" placeholder="인증번호 (6자리)" required/>
					<button type="submit" class="btn">확인</button>
				</div>
			</form>
			
			<form action="" method="POST">
				<div class="selectEmail" onclick="drop()">이메일로 찾기</div>
				<div class="infoBox">
					<input type="email" id="email" name="email" placeholder="이메일 주소" />
					<input type="button" class="send" value="인증번호 발송"/>
					<input type="text" class="code" name="code" placeholder="인증번호 (6자리)" required/>
					<button type="submit" class="btn">확인</button>
				</div>
			</form>
			
		</div>
	</div>
	
<script>
function drop() {
	var target = event.target;
	var inputInfoDiv = target.nextElementSibling;
        
        if (inputInfoDiv.style.display === "none" || inputInfoDiv.style.display === "") {
            inputInfoDiv.style.display = "block";
        } else {
            inputInfoDiv.style.display = "none";
        }
}
</script>	
	
</body>
</html>
<%@ include file="../common/footer.jsp" %>