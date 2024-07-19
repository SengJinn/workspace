<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="s" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>update</title>
</head>
<body>
	<c:catch var="e">
		<s:update var="result" dataSource="java/MySQLDB">
			UPDATE test_board SET board_content = ?, board_name = ?, board_title = ?
			WHERE board_num = ? AND board_pass = ? 
			<s:param>${param.correctContent}</s:param>
			<s:param>${param.board_name}</s:param>
			<s:param>${param.board_title}</s:param>
			<s:param>${param.board_num}</s:param>
			<s:param>${param.checkPass}</s:param>
		</s:update>
		<c:choose>
			<c:when test="${result == 1}">
				<script>
					alert("게시글 수정이 완료되었습니다.");
					location.replace('board_detail.jsp?board_num=${param.board_num}')
				</script>
			</c:when>
			<c:otherwise>
				<script>
					alert("잘못된 정보입니다. 확인 후 요청해주세요.");
					location.replace('board_update.jsp');
				</script>
			</c:otherwise>
		</c:choose>
	</c:catch>
	<c:if test="${!empty e}">
		<script>
			alert('회원정보 수정 실패');
			history.go(-1);
		</script>
	</c:if>
</body>
</html>





