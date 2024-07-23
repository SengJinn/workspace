<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jakarta.mail.*" %>
<%@ page import="jakarta.mail.internet.*" %>
<%@ page import="java.util.*" %>
<%@ page import="api.*" %>
<%
    String email = request.getParameter("email");
    String id = request.getParameter("id");
    String pass = request.getParameter("pass");
    String passA = request.getParameter("passA");
    String name = request.getParameter("name");
    try {
        // 4자리 랜덤 숫자 생성
        int verificationCode = (int)(Math.random() * 9000) + 1000; // 1000 ~ 9999
        // 세션에 저장
        session.setAttribute("verificationCode", verificationCode);
        // 구글 메일 인증 계정 정보
        GoogleAuthenticator auth = new GoogleAuthenticator();
        
        // 지정된 메일 서버와 통신할 정보를 저장할 객체
        Session ses = Session.getDefaultInstance(auth.getProp(), auth);
        
        // 메일 발송에 필요한 정보를 저장하는 객체
        MimeMessage msg = new MimeMessage(ses);
        
        // 발송시간
        msg.setSentDate(new Date());
        
        // 전송되는 메일 데이터 타입 설정
        msg.setHeader("Content-Type", "text/html;charset=utf-8");
        
        // 수신자 지정
        InternetAddress to = new InternetAddress(email); // 사용자가 입력한 이메일로 변경
        msg.setRecipient(Message.RecipientType.TO, to);
        // 발신자 지정
        msg.setFrom(new InternetAddress("gaepyunhae@gmail.com", "개편한부산"));
        // 제목 지정
        msg.setSubject("[개편한 부산] 인증 코드", "UTF-8");
        // 내용 지정
        msg.setContent("<h3>인증 코드: " + verificationCode + "</h3>", "text/html;charset=utf-8");
        
        // 메일 발송
        Transport.send(msg); // 메일 발송 결과가 전달될 때까지 Blocking
		out.print(verificationCode);
    } catch (Exception e) {

        e.printStackTrace(); // 예외 출력 추가
        out.print("");
    }
%>