<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- modify.jsp -->
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<style>
	.container{
		width:800px;
		margin:0 auto;
	}
</style>
<div class="container">
	<h1>MODIFY BOARD</h1>
	<form action="${path}/board/modify" method="POST">
		<input type="hidden" name="u_no" value="${userInfo.u_no}"/>
		<input type="hidden" name="bno" value="${board.bno}"/>
		<table>
			<tr>
				<th>제목</th>
				<td><input type="text" name="title" value="${board.title}" required/></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${userInfo.u_name}</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<textarea name="content" rows="30" cols="50" required>${board.content}</textarea>
				</td>
			</tr>
			<tr><th colspan="2"><button>수정 등록</button></th></tr>
		</table>
	</form>
</div>
</body>
</html>