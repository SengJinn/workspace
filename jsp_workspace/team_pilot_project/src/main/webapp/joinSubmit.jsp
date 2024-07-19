<%@ page import="java.util.*, vo.MungMemberVO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="s" %>

<%
	
	String id = request.getParameter("id");
    String pass = request.getParameter("pass");
    String passA = request.getParameter("passA");
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String verification_code = request.getParameter("verification_code");
    String msg = "";
    
    // 비밀번호 확인 로직
    if (!pass.equals(passA)) {
        request.setAttribute("msg", "비밀번호가 일치하지 않습니다.");
        request.getRequestDispatcher("join.jsp").forward(request, response);
        return;
    }
    
	
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>joinSubmit</title>

</head>
<body>

<c:catch var="e">
    <!-- 변수이름 jr (join_result, 회원가입결과) -->
    <s:query var="existingUser" dataSource="java/MySQLDB">
        SELECT COUNT(*) AS count FROM mung_member WHERE id = ?
        <s:param value="${param.id}" />
    </s:query>
    
      <!-- 이메일 중복 확인 쿼리 -->
    <s:query var="existingUserByEmail" dataSource="java/MySQLDB">
        SELECT COUNT(*) AS count FROM mung_member WHERE email = ?
        <s:param value="${param.email}" />
    </s:query>
    
    <c:choose>
        <c:when test="${existingUser.rows[0].count > 0}">
            <script>
                alert('이미 사용중인 아이디입니다. 다른 아이디를 입력해주세요.');
                location.replace('join.jsp');
            </script>
        </c:when>
        
        <c:when test="${existingUserByEmail.rows[0].count > 0}">
            <script>
                alert('이미 사용중인 이메일입니다. 다른 이메일을 입력해주세요.');
                location.replace('join.jsp');
            </script>
        </c:when>
        
        <c:otherwise>
        
            <s:update var="jr" dataSource="java/MySQLDB">
                INSERT INTO mung_member VALUES(null,?,?,?,?,now());
                <s:param value="${param.id}" />
                <s:param value="${param.pass}" />
                <s:param value="${param.name}" />
                <s:param value="${param.email}" />
            </s:update>
            
        <c:choose>
                <c:when test="${jr == 1}">
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

<!-- e에 저장된 값이 존재하면 예외가 발생 -->
<c:if test="${!empty e}">
    에러메세지 : <c:out value="${e.getMessage()}"/> <br/>
    <c:out value="${e.toString()}"/>
</c:if>
<hr />


</body> 

<script type="text/javascript">
     alert("<%= msg %>");
     window.location.href = "join.jsp";
</script>

</html>
