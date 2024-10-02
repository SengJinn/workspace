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
<section>
	<form action="find" method="POST">
		<div class="wrapper">
			<div class="upperBox">
				<p class="title">비밀번호 찾기</p>
				<p class="caution">가입하신 이메일로 인증번호를 전송합니다.</p>
			</div>
			<hr/>
			<div class="lowerBox">
				<div class="inner1">
					<p>인증 후 비밀번호 재설정을 시도합니다.</p>
					<p>이메일로 전송된 <span>인증번호</span>를 입력해 주세요.</p>			
				</div>
				<div class="inner2">
					<input type="email" id="email" name="email" placeholder="이메일 주소" />
				</div>
				<div class="inner3">
					<input type="text" class="code" placeholder="인증번호 (4자리)" required/>
					<input type="button" class="send" value="인증번호 전송" />
				</div>
				<div class="buttonBox">
					<input type="submit" class="btn" value="확인" />
				</div>
			</div>
		</div>
	</form>
</section>

<!-- jQuery -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- sweetalert2 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	
<script>
	/* 인증번호 저장할 변수 */
	let sendCode = "";
	
	/* 인증번호 발송 */
	$(document).ready(function() {
		$(".send").on("click", function() {
			const email = $("#email").val();
			
			if (!email) {
				alert("이메일 주소를 입력해 주세요.");
				return;
			}
			
			$.ajax({
				type: "POST",
				url: "${path}/member/checkEmail",
				data: {email: email},
				success : function(response) {
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
		
		/* 인증번호 일치 시 버튼 활성화 */
		$(".code").on("input", function() {
			const inputCode = $(this).val();
			const submitBtn = $(".btn");
			
			if (inputCode === sendCode) {
				submitBtn.prop("disabled", false);
				submitBtn.css("background", "#FFA200");
				submitBtn.css("cursor", "pointer");
			} else {
				submitBtn.prop("disabled", true);
				submitBtn.css("background", "gray");
			}
		});
	});
</script>	
	
</body>
</html>
<%@ include file="../common/footer.jsp" %>