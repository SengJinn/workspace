package com.bitc.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bitc.member.dao.LoginDTO;
import com.bitc.member.model.MemberVO;
import com.bitc.member.service.MemberService;

/* import com.bitc.FP.service.MemberService;
import com.bitc.FP.service.MemberServiceImpl; */
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("member/")
@RequiredArgsConstructor
public class MemberController {

	private final MemberService ms; // = new MemberServiceImpl(); */
	
	@GetMapping("login")
	public void login() {

	}

	@GetMapping("join")
	public void join() {
	}

	@GetMapping("find")
	public void find() {

	}


	@GetMapping("logout")
	public void logout(HttpServletRequest request, HttpServletResponse response, RedirectAttributes rttr)
			throws IOException {

		String path = request.getContextPath();

		System.out.println(" 로그아웃 요청 처리 ");
		ms.logOut(request, response);

		response.sendRedirect(path + "/home");

	}

	@PostMapping("join")
	public String join(MemberVO member, RedirectAttributes rttr) {

		boolean isJoin = ms.memberJoin(member);
		// isJoin에 member가 존재할 때
		if (isJoin) {

			String joinSuccess = "회원가입에 성공했습니다. 로그인 페이지로 이동합니다.";
			rttr.addFlashAttribute("joinSuccess", joinSuccess);
			return "redirect:/member/login";

		} else {

			String joinFail = "이메일 혹은 전화번호가 이미 등록되어 있습니다. 다시 확인해주세요.";
			rttr.addFlashAttribute("joinFail", joinFail);
			return "redirect:/member/join";

		}

	}

	@PostMapping("login")
	public String login(LoginDTO dto, HttpSession session, RedirectAttributes rttr, HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		MemberVO member = ms.memberLogin(dto);

		if (member != null) {
			// 로그인 성공 시 세션에 사용자 정보를 저장
			session.setAttribute("member", member);

			// 자동로그인 - 로그인 정보 저장 요청 처리
			String rememberMe = request.getParameter("rememberMe");
			if (rememberMe != null) { // 자동로그인 체크박스 체크
				String email = request.getParameter("email");
				byte[] bytes = email.getBytes(); // 문자열을 byte[]로 반환
				// byte[]로 변환된 문자열을 64바이트의 새로운 방식의 byte[]로 반환
				byte[] encodedUid = java.util.Base64.getEncoder().encode(bytes);
				// byte[]에 저장된 data를 이용하여 문자열 생성
				email = new String(encodedUid);

				// 인증완료된 사용자의 uid값을 사용자 PC브라우저 Cookie로 저장
				Cookie cookie = new Cookie("uemail", email);
				cookie.setMaxAge(60 * 60 * 24 * 15); // 초단위
				cookie.setPath("/");
				response.addCookie(cookie);
			}

			// 메인 페이지로 리다이렉트
			return "redirect:/profile/profile";

		} else {

			String msg = "이메일 혹은 비밀번호가 일치하지 않습니다.";
			rttr.addFlashAttribute("msg", msg);

			return "redirect:/member/login"; // 로그인 페이지로 돌아감

		}
	}


	@GetMapping("membership")
	public void membership() {
	}

	@GetMapping("changePW")
	public void changePW() {
	}

	@GetMapping("resetPW")
	public void resetPW() {
	}

	@GetMapping("beforeMyPage")
	public void beforeMyPage() {
	}

	@GetMapping("myPage")
	public void myPage() {
	}

	@GetMapping("beforeWithdraw")
	public void beforeWithdraw() {
	}

	@GetMapping("withdraw")
	public void withdraw() {
	}
	
}
