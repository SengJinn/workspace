package com.bitc.test.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bitc.test.model.MemberVO;
import com.bitc.test.service.MemberService;
import com.bitc.test.service.MemberServiceImpl;

import lombok.RequiredArgsConstructor;

/**
 * 회원 관련 요청 처리
 */
@Controller
@RequestMapping("member/*")
@RequiredArgsConstructor
public class MemberController {
	
	private final MemberService ms; //  = new MemberServiceImpl();
	
	// member/join
	@GetMapping("join")
	public void join() {
		// /WEB-INF/views/
		// .jsp
		// /WEB-INF/views/member/join.jsp
		// return "member/join";
		System.out.println("join() 호출");
	}
	
	@GetMapping("login")
	public void login() {}
	
	@PostMapping("join")
	public String join(MemberVO member) {
		boolean isJoin = ms.memberJoin(member);
		if(isJoin) {
			return "redirect:/member/login";
		}
		return "member/join";
	}
	
}









