<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>		
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="s" %>

<c:catch var="e">
	<s:update var="result" dataSource="java/MySQLDB">
		UPDATE freewrite SET 
		title = ?, 
		message = ?
		WHERE num = ${param.num} AND checkNumber = ?
			<s:param>${param.title}</s:param>
			<s:param>${param.message}</s:param>
			<s:param>${param.checkNumber}</s:param>
	</s:update>
	
	<c:choose>
			<c:when test="${result > 0}">
				<script>
					alert('수정완료!');
					location.href='freeDetail.jsp?num=${param.num}';
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
	<%-- <script>
	alert('정상적인 요청 처리를 할 수 없습니다.');
		history.go(-1);
	</script> --%>
	${e.printStackTrace()}
</c:if>