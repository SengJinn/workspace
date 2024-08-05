<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ include file="header.jsp" %>
<section>
	<form name="joinForm" action="join" method="post">
		<table class="join">
			<tr>
				<th colspan="2"><h1>회원가입</h1></th>
			</tr>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="id" alt="아이디"/></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pass" alt="비밀번호"/></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" alt="이름"/></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" name="addr" alt="주소" /></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input type="text" name="phone" alt="전화번호" /></td>
			</tr>
			<tr>
				<td colspan=2><input type="button" id="acceptBtn" value="회원가입" /></td>
			</tr>
		</table>
	</form>
</section>
<%@ include file="footer.jsp" %>

<script>
document.querySelector("#acceptBtn").onclick = function(){
	
var id = document.getElementsByName("id")[0].value;
var pass = document.getElementsByName("pass")[0].value;
var name = document.getElementsByName("name")[0].value;
var addr = document.getElementsByName("addr")[0].value;
var phone = document.getElementsByName("phone")[0].value;

	if(id == "" || id == null){
		alert("id를 확인해주세요.");
		document.getElementsByName("id")[0].focus();
	}else if (pass =="" || pass == null){
		alert("비밀번호를 확인해주세요.");
		document.getElementsByName("pass")[0].focus();
	}else if(name =="" || name == null){
		alert("이름을 확인해주세요.");
		document.getElementsByName("name")[0].focus();
	}else if(addr =="" || addr == null){
		alert("주소를 확인해주세요.");
		document.getElementsByName("addr")[0].focus();
	}else if(phone =="" || phone == null){
		alert("전화번호를 확인해주세요.");
		document.getElementsByName("phone")[0].focus();
	}else {
		document.joinForm.submit();
	}
};
</script>


