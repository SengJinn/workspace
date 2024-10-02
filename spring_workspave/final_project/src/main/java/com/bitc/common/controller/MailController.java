package com.bitc.common.controller;

import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("member/")
@RequiredArgsConstructor
public class MailController {
	
	private final JavaMailSender mailSender;
	
	@PostMapping("checkEmail")
	@ResponseBody
	public String sendMail(String email) throws Exception{
		
		int emailCode = (int)(Math.random() * 9000) + 1000; // 1000 ~ 9999
		
		MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message, "UTF-8");
		helper.setFrom("jjiiccsj12@gmail.com", "VIVIVIEW");  // 발신자
		helper.setTo(email);      // 수신자	// String[] == 다중 발송
		helper.setSubject("VIVIVEW 가입 인증 메일입니다.");
		helper.setText("아래의 인증 코드를 입력해주세요 : " + emailCode);
		mailSender.send(message);	// 메일 발송 요청
		System.out.println("발신 완료");
		return String.valueOf(emailCode);
	}
	
}
