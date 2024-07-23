<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="s" %>

<c:catch var="e">
	<s:update var="rs" dataSource="java/MySQLDB">
		DELETE FROM freewrite
		WHERE num = ${param.num} AND checkNumber = ?
		<s:param>${param.checkNumber}</s:param>
	</s:update>

	<c:choose>
		<c:when test="${rs > 0}">
			<script>
				alert('삭제 완료!');
				location.href='free.jsp';
			</script>
		</c:when>
		<c:otherwise>
			<script>
				alert('삭제 실패. 다시 시도 하세요');
				history.back();
			</script>
		</c:otherwise>
	</c:choose>
</c:catch>
    
<c:if test="${!empty e}">
	<c:out value="${e.printStackTrace()}" />
</c:if>