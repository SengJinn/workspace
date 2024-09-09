package com.bitc.FP.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bitc.FP.member.dao.LoginDTO;
import com.bitc.FP.member.model.MemberVO;
import com.bitc.FP.member.service.MemberService;

/* import com.bitc.FP.service.MemberService;
import com.bitc.FP.service.MemberServiceImpl; */
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("member/")
@RequiredArgsConstructor
public class MemberController {

	@GetMapping("login")
	public void login() {
		
	}
	
	@GetMapping("join")
	public void join() {
	}
	
	@GetMapping("find")
	public void find() {
		
	}
	
	private final MemberService ms; // = new MemberServiceImpl(); */

	@PostMapping("join")
	public String join(MemberVO member) {
		boolean isJoin = ms.memberJoin(member);
		if (isJoin) {
			return "redirect:/member/login";
		}
		return "member/join";
	}
	
	@PostMapping("login")
	public String login(LoginDTO dto, HttpSession session, RedirectAttributes rttr) throws IOException {
	    MemberVO member = ms.memberLogin(dto);

	    if (member != null) {
	        // 로그인 성공 시 세션에 사용자 정보를 저장
	        session.setAttribute("member", member);
	        // 메인 페이지로 리다이렉트
	        return "redirect:/home";
	        
	    } else {
	        // 로그인 실패 시 세션에 에러 메시지를 저장하고 로그인 페이지로 리다이렉트
	        // request.getSession().setAttribute("error", "Invalid username or password");
	    	
	    	String msg = "이메일 혹은 비밀번호가 일치하지 않습니다.";
	    	rttr.addFlashAttribute("msg", msg);
	        
	        return "redirect:/member/login";  // 로그인 페이지로 돌아감
	        
	    }
	}
	
}








