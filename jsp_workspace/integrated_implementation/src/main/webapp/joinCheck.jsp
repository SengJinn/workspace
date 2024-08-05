<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="s" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<%@ page import="java.io.*, java.util.*" %>

<jsp:useBean id="member" class="VO.JoinServlet" />
<jsp:setProperty property="*" name="member" />

<c:catch var="e">

    <s:query var="existingUser" dataSource="java/MySQLDB">
        SELECT COUNT(*) AS count FROM tbl_member WHERE id = ?
        <s:param value="${member.id}" />
    </s:query>

    
    <c:choose>
        <c:when test="${existingUser.rows[0].count > 0}">
            <script>
                alert('이미 사용중인 아이디입니다. 다른 아이디를 입력해주세요.');
                location.replace('join.jsp');
            </script>
        </c:when>
        
        
        <c:otherwise>
			<s:update var="result" dataSource="jdbc/MySQLDB">
				INSERT INTO tbl_memebr
				(num, id, pass, name, addr, phone)
				VALUES(null,?,?,?,?,?); 
				<s:param>${member.id}</s:param>
				<s:param>${member.pass}</s:param>
				<s:param>${member.name}</s:param>
				<s:param>${member.addr}</s:param>
				<s:param>${member.phone}</s:param>
			</s:update>   
			         
        <c:choose>
                <c:when test="${result == 1}">
                    <script>
                        alert('회원가입 완료! 로그인해주세요.');
                        location.replace('login.jsp');
                    </script>
                </c:when>
                <c:otherwise>
                    <script>
                        alert('회원가입 실패. 다시 시도해주세요.');
                        location.replace('join.jsp');
                    </script>
                </c:otherwise>
         </c:choose>
        </c:otherwise>
    </c:choose>
</c:catch>

