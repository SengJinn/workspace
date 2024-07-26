<%@page import="net.nurigo.sdk.message.service.DefaultMessageService"%>
<%@page import="net.nurigo.sdk.message.model.Balance"%>
<%@page import="net.nurigo.sdk.NurigoApp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!-- getBalance.jsp -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>잔액 확인</title>
</head>
<body>
	
	<%
		DefaultMessageService messageService;
		messageService = NurigoApp.INSTANCE.initialize(
				"NCSQ7T3JDUE0GYIR", // API 키
				"DAVE265874KDOELQVPYEMF5APSCMBXQL", // API Secret Key
				"https://api.coolsms.co.kr");
		
	    Balance balance = messageService.getBalance();
        out.println(balance);
	%>
</body>
</html>