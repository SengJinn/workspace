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
		<form action="" method="post">
			<h1>Login</h1>
			<div class="input-box">
				<input type="text" placeholder="Email or PhoneNumber" required />
                <i class='bx bxs-user'></i>
			</div>
			<div class="input-box">
				<input type="password" placeholder="Password" required />
                <i class='bx bxs-lock-alt' ></i>
			</div>
		</form>

        <div class="remember">
            <label><input type="checkbox" />Remember Me?</label>
            <a href="find">Forgot Password?</a>
        </div>
    
        <button type="submit" class="btn">Login</button>
    
        <div class="register">
            <p>Don't have an account? <a href="join">Register</a></p>
        </div>
	</div>

</body>


</html>
<%@ include file="../common/footer.jsp" %>