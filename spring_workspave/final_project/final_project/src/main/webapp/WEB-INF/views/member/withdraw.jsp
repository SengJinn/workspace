<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>VIVIVIEW - 회원 탈퇴</title>

<!-- 네비게이션 바 CSS -->
<link rel="stylesheet" href="${path}/resources/css/member/sideMenu.css">
<!-- section(회원 탈퇴) CSS -->
<link rel="stylesheet" href="${path}/resources/css/member/withdraw.css">

</head>
<body>
<section>
	<!-- 네비게이션 바 -->
	<nav class="sideMenu">
		<ul>
			<li><a href="${path}/home">VIVIVIEW로 돌아가기</a></li>
			<li><a href="${path}/member/membership?email=${sessionScope.member.email}">멤버십</a></li>
			<li><a href="${path}/member/beforeMyPage?email=${sessionScope.member.email}">개인정보 수정</a></li>
			<li><a href="${path}/member/changePW?email=${sessionScope.member.email}">비밀번호 변경</a></li>
			<li><a href="${path}/member/beforeWithdraw?email=${sessionScope.member.email}">회원 탈퇴</a></li>
		</ul>
	</nav>
	
	<!-- 회원 탈퇴 -->
	<form action="" method="POST">
		<div class="wrapper">
			<div class="upperBox">
				<p class="title">회원 탈퇴</p>
				<p class="caution">탈퇴 시에 주의사항을 꼭 확인해 주시기 바랍니다.</p>
			</div>
			<hr/>
			<div class="lowerBox">
				<div class="inner1">
					<p>회원 탈퇴를 진행하기 위해 아래의 글자를 정확하게 입력해 주세요.</p>
					<p><span id="word">회원탈퇴</span>를 바르게 입력해주세요.</p>
				</div>
				<div class="inner2">
					<input type="text" name="withdrawWord" id="withdrawWord" required oninput="withdrawWord()">
					<input type="submit" id="submit" value="확인" disabled>
				</div>
			</div>
		</div>
	</form>
</section>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script>
	// "회원탈퇴" 문구 똑바로 기입 안하면 버튼 작동 X
	$(document).ready(function() {
		$("#withdrawWord").on("input", function() {
			var input = $(this).val().trim();
			var word = $("#word").text().trim();
			
			if (input === word) {
				$("#submit").prop("disabled", false);
				$("#submit").css("background", "gray");
			} else {
				$("#submit").prop("disabled", true);
				$("#submit").css("background", "#ffa200");
			}
		});
	});
</script>

</body>
</html>

<%@ include file="../common/footer.jsp" %>