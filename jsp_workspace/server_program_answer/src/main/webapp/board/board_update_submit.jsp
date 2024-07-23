<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="s" %>
<!-- 게시글 수정 처리 -->
<c:catch var="e">
	<s:update var="result" dataSource="jdbc/MySQLDB">
		UPDATE test_board SET 
		board_name = ? ,
		board_title = ? ,
		board_content = ? 
		WHERE board_num = ${param.board_num} AND board_pass = ?
		<s:param>${param.board_name}</s:param>
		<s:param>${param.board_title}</s:param>
		<s:param>${param.board_content}</s:param>
		<s:param>${param.board_pass}</s:param>
	</s:update>
	
	<!-- 게시글 수정 결과 처리 -->
	<c:choose>
		<c:when test="${result > 0}">
			<script>
				alert('수정완료');
				location.href='board_detail.jsp?board_num=${param.board_num}';
			</script>
		</c:when>
		<c:otherwise>
			<script>
				alert('수정실패');
				history.back();
			</script>
		</c:otherwise>
	</c:choose>
</c:catch>
<c:if test="${!empty e}">
	<script>
		alert('정상적인 요청 처리를 할 수 없습니다.');
		history.go(-1); 
	</script>
</c:if>





