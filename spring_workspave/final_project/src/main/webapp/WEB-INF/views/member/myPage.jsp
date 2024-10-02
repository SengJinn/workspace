<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../common/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>VIVIVIEW MYPAGE</title>

<!-- 네비게이션 바 CSS -->
<link rel="stylesheet" href="${path}/resources/css/member/sideMenu.css">

<link rel="stylesheet" href="${path}/resources/css/member/myPage.css">
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
    
    <form action="myPage" method="POST">
    	<div class="wrapper">
			<div class="upperBox">
				<p class="title">개인정보 수정</p>
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
					<td>이메일</td>
					<td>
						<input type="email" name="email" id="email" value="${sessionScope.member.email}" readonly />
					</td>
				</tr>
				<tr>
					<td>나이</td>
					<td>
						<input type="number" name="age" id="age" value="${sessionScope.member.age}" min="14" required />
					</td>
				</tr>
				<tr>
					<td>휴대폰</td>
					<td>
						<input type="text" name="phone" id="phone" value="${sessionScope.member.phone}" maxlength="11" required />
					</td>
				</tr>
			</table>
			
			<!-- 버튼 박스 -->
			<div class="btnBox">
				<input type="submit" id="check" value="확인">
			</div>
		</div>
    </form>
</section>

<!-- jQuery -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- sweetalert2 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<script>
        $(document).ready(function() {
            var mypageMsg = "${mypageMsg}"; // Controller에서 전달한 메시지
            if (msg) {
                Swal.fire({
                    icon: msg.includes("성공") ? 'success' : 'error',
                    title: '알림',
                    text: mypageMsg,
                    confirmButtonColor: '#FFA200'
                });
            }
        });
    </script>

</body>
</html>
<%@ include file="../common/footer.jsp" %>