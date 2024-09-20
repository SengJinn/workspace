<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>VIVIVIEW - 비밀번호 설정</title>
</head>
<body>
	<form action="" method="POST">
		<div>
			<div>
				<p>새 비밀번호 설정</p>
			</div>
			
			<!-- 비밀번호 재설정 -->
			<table>
				<tr>
					<td>새 비밀번호</td>
					<td>
						<!-- value에 폰이나 이멜 주소 둘 중 하나 넘겨야 하는데  -->
						<input type="hidden" name="email" value="">
						<input type="hidden" name="phone" value="">
						<input type="password" name="newPW" id="newPW" required onkeyup="checkPW()"/>
						<p>영문/숫자/특수문자를 조합하여 10~16자 이내로 입력해 주세요.</p>
					</td>
				</tr>
				<tr>
					<td>새 비밀번호 확인</td>
					<td>
						<input type="password" name="checkPW" id="checkPW" required onkeyup="pwMatch">
						<p>비밀번호를 다시 한 번 입력해주세요.</p>
					</td>
				</tr>
			</table>
			
			<!-- 버튼 박스 -->
			<div>
				<input type="submit" id="check" value="확인">
				<input type="button" id="remove" value="새로 입력" onclick="clearForm()">
			</div>
		</div>
	</form>
	
</body>
</html>
<%@ include file="../common/footer.jsp" %>