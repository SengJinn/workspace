<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="s" %>

<title>회원님의 비밀번호입니다.</title>

<style>
	.ypw{
		color:white;
	}
</style>

<c:catch var="e">
	<s:query var="rs" dataSource="java/MySQLDB">
		SELECT pass FROM mung_member WHERE id = ? AND email = ?
		<s:param>${param.id}</s:param>
		<s:param>${param.email}</s:param>
	</s:query>
	
	<c:choose>
		<c:when test="${rs.rowCount > 0}">
			<%-- <!-- ID 와 Email 이 일치하는 회원이 *있을 때* 비밀번호 출력--> --%>
			<h3>회원님의 비밀번호 - 아랫줄을 마우스로 드래그하세요 </h3>
			<h2 class="ypw"><c:out value="${rs.rows[0].pass}" /></h2>
		</c:when>
		<c:otherwise>
			<%-- <!-- ID 와 Email 이 일치하는 회원이 *없을 때* --> --%>
			<c:out value="회원정보를 찾지 못하였습니다. 다시 입력해주세요" />
		</c:otherwise>
	</c:choose>
</c:catch>

<c:if test="${!empty e}">
	${e.printStackTrace()}
</c:if>