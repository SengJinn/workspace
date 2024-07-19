<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String verificationCode = request.getParameter("verification_code");
    Integer sessionCode = (Integer) session.getAttribute("verificationCode");

    if (sessionCode != null && verificationCode != null && verificationCode.equals(sessionCode.toString())) {
        out.print("success");
    } else {
        out.print("fail");
    }
%>