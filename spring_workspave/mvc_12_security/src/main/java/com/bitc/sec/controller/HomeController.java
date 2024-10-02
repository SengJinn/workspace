package com.bitc.sec.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bitc.sec.service.MemberService;
import com.bitc.sec.vo.SecurityMemberVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class HomeController {
	
	private final MemberService ms;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "home";
	}
	
	@GetMapping("login")
	public String login() {
		return "user/login";
	}
	
	@GetMapping("logout")
	public String logout() {
		return "user/logout";
	}
	
	@GetMapping("/logoff")
	public String logff() {
		return "user/logoff";
	}
	
	@GetMapping("join")
	public String join() {
		return "user/join";
	}
	
	@PostMapping("join")
	public String join(SecurityMemberVO vo) throws Exception{
		ms.join(vo); // 회원 가입 요청 처리
		return "redirect:/login";
	}
}















