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
 		// 키, 벨류 함께 저장 가능한 Properties 사용
 		/*
 		Properties p = new Properties(); // 제네릭타입 따로 안해도됨
 		p.put("mail.smtp.host", "smtp.gmail.com");
 		p.put("mail.smtp.auth", "true");
 		p.put("mail.smtp.port", "587");
 		p.put("mail.smtp.starttls.enable", "true");
 		*/
 		
 		
 		// 보안 사용
 		// SSL 보안 소켓 계층 - Secure Sockets Layer - 465 port 사용
 		// TLS 전송 계층 보안 - Transport Layer Security
 		// SSL 보안 강화 -> TLS => 587 port 사용
 		
 		// 구글 메일 인증 계정 정보
 		GoogleAuthenticator auth = new GoogleAuthenticator();
 		
 		// 영역객체 아님. 구글 메일과 우리 웹 서버간의 세션임.
 		// 지정된 메일 서버와 통신할 정보를 저장할 객체 
 		Session ses = Session.getDefaultInstance(auth.getProp(), auth);
 		
 		// 데이터 형식 지정 : Mime 타입 
 		// 메일 발송에 필요한 정보를 저장하는 객체 
 		MimeMessage msg = new MimeMessage(ses);
 		
 		// 발송 시간
 		msg.setSentDate(new Date());
 		
 		// 전송 되는 메일 데이터 타입 설정
 		msg.setHeader("Content-Type", "text/html;charset=utf-8");
 		
 		// 수신자 지정
 		InternetAddress to = new InternetAddress("jjiiccsj@naver.com");
 		// Message.RecipientType.TO : 받는 사람
 		// Message.RecipientType.CC : 참조
 		// Message.RecipientType.BCC : 숨은 참조
 		msg.setRecipient(Message.RecipientType.TO, to);
 		
 		// 보내는 사람
 		msg.setFrom(new InternetAddress("master@btc.ac.kr", "MASTER"));
 		/* msg.setSubject("TEST MASTER!"); */
 		// 제목 지정
 		msg.setSubject("TEST MASTER!", "UTF-8");
 		
 		// 내용 지정
 		// text = text만, Content = html 형식
 		msg.setContent("<h3>오늘은 무사히...</h3>", "text/html;chrset=utf-8");
 		
 		// 메일 발송
 		Transport.send(msg); // 메일 발송 결과가 전달될때 까지 Blocking
 		
 		out.println("<script>");
 		out.println("alert('메일 발송 성공. 메일을 확인해주세요');");
 		out.println("location.href='"+request.getContextPath()+"';");
 		out.println("</script>");
 		
 	}catch(Exception e){
 		
 		e.printStackTrace();
 		out.println("<script>");
 		out.println("alert('메일 발송 실패');");
 		out.println("history.go(-1);");
 		out.println("</script>");
 	}
 
 
 %>