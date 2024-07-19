<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!-- sqlDelete.jsp -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="s" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 삭제</title>
</head>
<body>

	<s:update var="result" dataSource="java/MySQLDB">
		DELETE FROM test_board WHERE board_num = ? AND board_pass = ?
		<s:param>${param.board_num}</s:param>
		<s:param>${param.board_pass}</s:param>
	</s:update>

	<c:if test="${result == 1}">
		<script>
			alert('삭제가 완료되었습니다.');
			location.href='board_list.jsp';
		</script>
	</c:if>
	
	<c:if test="${result != 1}">
		<script>
			alert('삭제에 실패하였습니다. 비밀번호를 다시 확인해주세요.');
			location.href='board_delete.jsp';
		</script>
	</c:if>
</body>
</html>
