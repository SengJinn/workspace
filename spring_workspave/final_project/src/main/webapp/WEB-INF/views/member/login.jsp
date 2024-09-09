<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../common/header.jsp" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>viviview Login</title>

<link rel="stylesheet" href="${path}/resources/css/login.css">
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

</head>
<body>

	<div class="wrapper">
		<form action="login" method="post">
			<h1>Login</h1>
			<div class="input-box">
				<input type="text" placeholder="Email or PhoneNumber" name="email" required />
                <i class='bx bxs-user'></i>
			</div>
			<div class="input-box">
				<input type="password" placeholder="Password" name="pass" required />
                <i class='bx bxs-lock-alt' ></i>
			</div>
		

        <div class="remember">
            <label><input type="checkbox" />Remember Me?</label>
            <a href="find">Forgot Password?</a>
        </div>
    
        <button type="submit" class="btn">Login</button>
    	</form>
    	
        <div class="register">
            <p>Don't have an account? <a href="join">Register</a></p>
        </div>
	</div>

    <script>
        window.onload = function() {
            // 메시지가 존재하면 alert 창을 띄우기
            var msg = "${msg}";
            if (msg) {
                alert(msg);
            }
        }
    </script>


</body>


</html>
<%@ include file="../common/footer.jsp" %>