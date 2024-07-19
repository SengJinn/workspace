<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!-- 구글 메일 발송 테스트 -->
 <%@ page import="jakarta.mail.*" %>
 <%@ page import="jakarta.mail.internet.*" %>
 <%@ page import="java.util.*" %>
 <%@ page import="api.*" %>
 <%
 	try{
 		
 		// SMTP - (Simple Mail Transfer Protocol - 간이 우편 전송 규약)
 		/*
 		Properties p = new Properties();
 		p.put("mail.smtp.host","smtp.gmail.com");
 		p.put("mail.smtp.auth", "true");
 		p.put("mail.smtp.port", "587");
 		p.put("mail.smtp.starttls.enable", "true");
 		*/
 		
 		// SSL 보안 소켓 계층 - Secure Sockets Layer - 456 port 사용
 		// TLS 전송 계층 보안 - (Transport Layer Security)
 		// SSL 보안 강화 -> TLS => 587 port 사용 
 		
 		// 구글 메일 인증 계정 정보
 		GoogleAuthenticator auth =  new GoogleAuthenticator();
 		
 		// 지정된 메일 서버와 통신할 정볼를 저장할 객체 
 		Session ses = Session.getDefaultInstance(auth.getProp(), auth);
 		
 		// 메일발송에 필요한 정보를 저장하는 객체 
 		MimeMessage msg = new MimeMessage(ses);
 		
 		// 발송시간 
 		msg.setSentDate(new Date());
 		
 		// 전송되는 메일 데이터 타입 설정
 		msg.setHeader("Content-Type","text/html;charset=utf-8");
 		
 		// 수신자 지정
 		InternetAddress to = new InternetAddress("jiyeonkim0528@gmail.com");
 		// Message.setRecipienType.TO : 받는사람
 		// Message.setRecipienType.CC : 참조
 		// Message.setRecipienType.BCC : 숨은참조
 		msg.setRecipient(Message.RecipientType.TO, to);
 		// 발신자 지정
 		msg.setFrom(new InternetAddress("master@btc.ac.kr","MASTER"));
 		// msg.setSubject("TEST MASTER!");
 		// 제목지정
 		msg.setSubject("TEST MASTER!", "UTF-8");
 		// 내용지정
 		msg.setContent("<h3>하하핳</h3>", "text/html;chrset=utf-8");
 		
 		// 메일발송
 		Transport.send(msg); // 메일 발송 결과가 전달될때 까지 Blocking
 		out.println("<script>");
 		out.println("alert('메일 발송 성공. 메일을 확인해 주세요.');");
 		out.println("location.href='"+request.getContextPath()+"';");
 		out.println("</script>");
 	}catch(Exception e) {
 		out.println("<script>");
 		out.println("alert('메일 발송 실패');");
 		out.println("history.go(-1);");
 		out.println("</script>");
 	}
 %>