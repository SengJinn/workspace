<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<%
    session.invalidate(); // 세션 무효화
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>로그아웃</title>
    <script type="text/javascript">
        alert("로그아웃 되었습니다.");
        window.location.href = "main.jsp";
    </script>
</head>
<body>
</body>
</html>