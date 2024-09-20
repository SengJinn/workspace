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
<!-- section(비밀번호 확인) CSS -->
<link rel="stylesheet" href="${path}/resources/css/member/before.css">

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

    <!-- 회원탈퇴 진행 전 비밀번호 확인 -->
	<form action="withdraw.sh" method="POST">
		<div class="wrapper">
			<div class="upperBox">
				<p class="title">회원 탈퇴</p>
				<p class="caution">탈퇴 시에 주의사항을 꼭 확인해 주시기 바랍니다.</p>
			</div>
			<hr/>
			<div class="lowerBox">
				<div class="inner1">
					<p>고객님의 개인정보 보호를 위해 본인 확인을 진행합니다.</p>
					<p><span>비밀번호</span>를 입력해 주세요.</p>
				</div>
				<div class="inner2">
					<p>비밀번호 확인</p>
					<input type="password" name="pass" required>
					<input type="submit" id="" value="확인">
				</div>
			</div>
		</div>
	</form>
</section>

</body>
</html>
<%@ include file="../common/footer.jsp" %>