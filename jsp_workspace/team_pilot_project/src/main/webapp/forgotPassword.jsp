<%@ page language="java" contentType="text/html; charset=UTF-8" %>
	
<%@ include file="header.jsp" %>

<title>비밀번호 찾기</title>

<style>
	.swrap {
	min-height: 400px;
	border-bottom: 1px solid #ccc;
	display: flex;
	align-items: center;
	justify-content: center;
	padding:30px;
	}

	.fp_table{
		text-align : center;
	}
</style>

<section class="swrap">
	<form action="forgotPassword_submit.jsp" method="post">
		<table class="fp_table">
		<tr>
			<td colspan="2"><h2>비밀번호 찾기</h2></td>
		</tr>
		<tr>
			<td><input type="text" name="id" required autofocus placeholder="아이디"/></td>
		</tr>
		<tr>
			<td><input type="email" name="email" required placeholder="이메일"/></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="확인" />
			</td>
		</tr>
	</table>
	</form>
</section>

<%@ include file="footer.jsp" %>