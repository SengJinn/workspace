<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- read.jsp -->
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<style>
	.container{
		width:800px;
		margin:0 auto;
	}
</style>
<div class="container">
<!-- board -->
	<h3>READ PAGE - ${board.bno}</h3>
	<table border="1">
		<tr>
			<td>제목</td>
			<td>${board.title}</td>
		</tr>
		<tr>
			<td>작성자</td>
			<td>${board.writer}</td>
		</tr>
		<tr>
			<td>내용</td>
			<td><c:out value="${board.content}"/></td>
		</tr>
		<tr>
			<td>작성시간</td>
			<td>${board.regdate}</td>
		</tr>
		<!-- 로그인된 사용자가 게시글 작성자 일 시 수정 삭제 버튼 출력 -->
		<c:if test="${!empty userInfo && userInfo.u_no eq board.u_no}">
			<input type="button" id="modifyBtn" value="MODIFY"/>
			<input type="button" id="removeBtn" value="REMOVE"/>  
		</c:if>
	</table>
	
	<form id="readForm">
		<input type="hidden" name="bno" value="${board.bno}" />
		<input type="hidden" name="csrf_token" value="${csrf_token}" />
	</form>
	
	<script>
		let obj = $("#readForm");
		
		$("#modifyBtn").click(function(){
			obj.attr("action","modify").submit();
		});
		
		$("#removeBtn").click(function(){
			obj.attr("action","remove");
			obj.attr("method","POST");
			obj.submit();
		});
	</script>
</div>
</body>
</html>










