<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>VIVIVIEW - 비밀번호 변경</title>

<!-- 네비게이션 바 CSS -->
<link rel="stylesheet" href="${path}/resources/css/member/sideMenu.css">
<!-- section(비밀번호 확인) CSS -->
<link rel="stylesheet" href="${path}/resources/css/member/changePW.css">

</head>
<body>
<section>
    <!-- 네비게이션 바 -->
    <nav class="sideMenu">
        <ul>
            <li><a href="${path}/home">VIVIVIEW로 돌아가기</a></li>
            <li><a href="${path}/membership/membership?email=${sessionScope.member.email}">멤버십</a></li>
            <li><a href="${path}/member/beforeMyPage?email=${sessionScope.member.email}">개인정보 수정</a></li>
            <li><a href="${path}/member/changePW?email=${sessionScope.member.email}">비밀번호 변경</a></li>
            <li><a href="${path}/member/beforeWithdraw?email=${sessionScope.member.email}">회원 탈퇴</a></li>
        </ul>
    </nav>
    
    <!-- 이거 table 써서 삐꾸난거 같으니까 내일 table 빼고 다른걸로 수정 -->
	
	<form action="changePW" method="POST">
		<div class="wrapper">
			<div class="upperBox">
				<p class="title">비밀번호 변경</p>
				<p class="caution">비밀번호는 주기적으로 변경해주시기 바랍니다.</p>
			</div>
			<hr/>
			<table style="width: 100%">
				<!-- 테이블 크기 설정 -->
				<colgroup>
					<col style="width: 30%">
					<col style="width: 70%">
				</colgroup>
				
				<!-- 비밀번호 변경 -->
				<tr>
					<td>현재 비밀번호</td>
					<td>
						<input type="password" name="current" id="currentPW" required />
						<input type="hidden" id="sessionPW" value="${sessionScope.member.pass}" />
						<p class="msgBoxFirst"></p>
					</td>
				</tr>
				<tr>
					<td>새 비밀번호</td>
					<td>
						<input type="password" name="newPW" id="newPW" required />
						<p class="msgBoxSecond"></p>
					</td>
				</tr>
				<tr>
					<td>새 비밀번호 확인</td>
					<td>
						<input type="password" name="checkPW" id="checkPW" required />
						<p class="msgBoxThird"></p>
					</td>
				</tr>
			</table>
			
			<!-- 버튼 박스 -->
			<div class="btnBox">
				<input type="submit" id="check" value="확인">
				<input type="button" id="remove" value="새로 입력">
			</div>
			
			<!-- 권고사항 -->
			<div class="recommend">
				<p class="notice">📌 안전하게 비밀번호를 관리하는 법</p>
				<p>1. 이용하시는 사이트들의 아이디/비밀번호를 가급적 다르게 설정해주세요.</p>
				<p>2. 최소 3개월에 한 번씩 주기적으로 비밀번호를 변경한다면 해킹의 위험을 줄일 수 있습니다.</p>
				<p>3. 사용자 이외의 다른 사람들과 아이디 및 비밀번호를 함께 사용하면 안됩니다.</p>
			</div>
		</div>
	</form>
</section>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script>
	
	$(document).ready(function() {
		var sessionPW = $("#sessionPW").val();	// 세션에 저장된 사용자 비밀번호
		var currentPW = $("#currentPW");	// 현재 비밀번호 입력값
		var newPW = $("#newPW");			// 새 비밀번호 입력값
		var checkPW = $("#checkPW");		// 새 비밀번호 확인 입력값
		var msgBoxFirst = $(".msgBoxFirst");	// 첫 번째 칸 메세지 박스
		var msgBoxSecond = $(".msgBoxSecond");	// 두 번째 칸 메세지 박스
		var msgBoxThird = $(".msgBoxThird");	// 세 번째 칸 메세지 박스
		
		/* 새로 입력 버튼 (작성 내용 초기화) */
		$("#remove").click(function () {
	        currentPW.val("");
	        newPW.val("");
	        checkPW.val("");
	        msgBoxFirst.text("");
	        msgBoxFirst.css("color", "");
	        msgBoxSecond.text("");
	        msgBoxSecond.css("color", "");
	        msgBoxThird.text("");
	        msgBoxThird.css("color", "");
	    });
		
		/* 현재 비밀번호 확인 (currentPW === sessionPW) */
		currentPW.on("input", function () {
			if (currentPW.val() === sessionPW) {
				msgBoxFirst.text("비밀번호가 일치합니다.");
				msgBoxFirst.css("color", "#FFA200");
			} else {
				msgBoxFirst.text("비밀번호가 일치하지 않습니다.");
				msgBoxFirst.css("color", "#F58");
			}
		});
	
	 	/* 새 비밀번호 유효성 검사 (정규식 일치 여부) */
        newPW.on("input", function () {
            /* 비밀번호 길이 검사 (8~30자) */
            var length = /^.{8,30}$/;
            /* 영문, 숫자 조합 8~30자 */
	        var criteria = /^(?=.*[a-zA-Z])(?=.*[0-9]).{8,30}$/;
	        
	        var newPassword = newPW.val();
	        var currentPassword = currentPW.val();

            if (!length.test(newPW)) {
            	// 문자열 길이 확인
                msgBoxSecond.text("비밀번호는 8~30자까지 입력 가능합니다.");
                msgBoxSecond.css("color", "#F58");
            } else if (!criteria.test(newPW.val())) {
            	// 정규식 확인
                msgBoxSecond.text("영문, 숫자를 조합하여 입력하셔야 합니다.");
                msgBoxSecond.css("color", "#F58");
            } else if (newPassword === currentPassword) {
            	// 현재 비밀번호와 일치 여부 확인
                msgBoxSecond.text("현재 사용 중인 비밀번호로 변경할 수 없습니다.");
                msgBoxSecond.css("color", "#F58");
            } else {
            	// 현재 비밀번호와 일치 X, 정규식 일치 O
                msgBoxSecond.text("사용 가능한 비밀번호입니다.");
                msgBoxSecond.css("color", "#FFA200");
            }
        });
	
		/* 새 비밀번호 확인 (newPW == checkPW) */
		checkPW.on("input", function() {
			
			var newPassword = newPW.val();
	        var checkPassword = checkPW.val();
			
	        if (newPassword === checkPassword) {
	        	msgBoxThird.text("입력한 비밀번호가 일치합니다.");
	        	msgBoxThird.css("color", "#FFA200");
	        } else {
	        	msgBoxThird.text("입력한 비밀번호가 서로 일치하지 않습니다.");
	        	msgBoxThird.css("color", "#F58");
	        }
	    });
	});
</script>
	
</body>
</html>
<%@ include file="../common/footer.jsp" %>