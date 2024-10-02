<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>VIVIVIEW - 비밀번호 재설정</title>

<link rel="stylesheet" href="${path}/resources/css/member/resetPW.css">
</head>
<body>
<section>
	<form action="resetPW" method="POST">
		<input type="hidden" name="email" value="${email}" />
		<div class="wrapper">
			<div class="upperBox">
				<p class="title">비밀번호 재설정</p>
				<p class="caution">새로운 비밀번호를 설정합니다.</p>
			</div>
			<hr/>
			
			<table style="width: 100%">
				<!-- 테이블 크기 설정 -->
				<colgroup>
					<col style="width: 30%">
					<col style="width: 70%">
				</colgroup>
				
				<!-- 비밀번호 재설정 -->
				<tr>
					<td>새 비밀번호</td>
					<td>
						<input type="password" id="newPW" id="newPW" required />
						<p class="msgBoxFirst"></p>
					</td>
				</tr>
				<tr>
					<td>새 비밀번호 확인</td>
					<td>
						<input type="password" id="checkPW" name="pass" id="checkPW" required />
						<p class="msgBoxSecond"></p>
					</td>
				</tr>
			</table>
			
			<!-- 버튼 박스 -->
			<div class="buttonBox">
				<input type="submit" id="check" value="확인" />
				<input type="button" id="remove" value="새로 입력" />
			</div>
		</div>
	</form>
</section>

<!-- jQuery -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script>
	$(document).ready(function () {
		var newPW = $("#newPW");		// 새 비밀번호
		var checkPW = $("#checkPW");	// 새 비밀번호 확인
		var msgBoxFirst = $(".msgBoxFirst");	// 첫 번째 칸 메세지 박스
		var msgBoxSecond = $(".msgBoxSecond");	// 두 번째 칸 메세지 박스
		
		/* 새로 입력 버튼 (작성 내용 초기화) */
		$("#remove").click(function () {
	        newPW.val("");
	        checkPW.val("");
	        msgBoxFirst.text("");
	        msgBoxFirst.css("color", "");
	        msgBoxSecond.text("");
	        msgBoxSecond.css("color", "");
	    });
		
		/* 새 비밀번호 유효성 검사 (정규식 일치 여부) */
		newPW.on("input", function () {
			/* 비밀번호 길이 검사 (8~30자) */
			const length = /^.{8,30}$/;
			/* 영문, 숫자 조합 8~30자 */
	        const criteria = /^(?=.*[a-zA-Z])(?=.*[0-9]).{8,30}$/;
			
	        if (!length.test(newPW)) {
	        	/* 문자열 길이 확인 */
	        	msgBoxFirst.text("비밀번호는 8~30자까지 입력 가능합니다.");
	        	msgBoxFirst.css("color", "#F58");
	        } else if (!criteria.test(newPW.val())) {
	        	/* 정규식 확인 */
	        	msgBoxFirst.text("영문, 숫자를 조합하여 입력하셔야 합니다.");
                msgBoxFirst.css("color", "#F58");
	        } else {
	        	/* 문자열 길이 O, 정규식 일치 O */
	        	msgBoxFirst.text("사용 가능한 비밀번호입니다.");
                msgBoxFirst.css("color", "#FFA200");
	        }
		});
		
		/* 비밀번호 일치 여부 확인 (newPW === checkPW) */
		checkPW.on("input", function() {
			const newPass = newPW.val();
			const checkPass = checkPW.val();
			
			if (newPass === checkPass) {
				msgBoxSecond.text("입력한 비밀번호가 일치합니다.");
				msgBoxSecond.css("color", "#FFA200");
			} else {
				msgBoxSecond.text("입력한 비밀번호가 서로 일치하지 않습니다.");
				msgBoxSecond.css("color", "#F58");
			}
		});
	});
</script>

</body>
</html>
<%@ include file="../common/footer.jsp" %>