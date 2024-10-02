package com.bitc.member.controller;

import java.io.IOException;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	public void login() {}

	@GetMapping("join")
	public void join() {}

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
			
			System.out.println(member.toString());

			// 메인 페이지로 리다이렉트
			return "redirect:/profile/profile";

		} else {

			String msg = "이메일 혹은 비밀번호가 일치하지 않습니다.";
			rttr.addFlashAttribute("msg", msg);

			return "redirect:/member/login"; // 로그인 페이지로 돌아감

		}
	}
	
	@GetMapping("changePW")
	public void changePW() {}
	
	@PostMapping("changePW")
	public String changePW(@RequestParam String current,@RequestParam String newPW,@RequestParam String checkPW, HttpSession session) {
		
		MemberVO member = (MemberVO) session.getAttribute("member");
		
		if (!current.equals(newPW) && newPW.equals(checkPW)) {
			
			// System.err.println("checkPW : " + checkPW + ", sessionEmail : " + member.getEmail());
			// checkPW : b12345678, sessionEmail : apfhd1@naver.com 값 잘 받음
			
			boolean isUpdate = ms.changePW(checkPW, member.getEmail());
			
			if (isUpdate) {
				member.setPass(checkPW);
				session.setAttribute("member", member);
			}
			return "redirect:/home";
		}
		return "redirect:/member/changePW";
	}

	@GetMapping("find")
	public void find() {}
	
	@PostMapping("find")
	public String find(MemberVO member, RedirectAttributes rttr) {
		
		System.out.println("Controller find : " + member.getEmail());
		System.out.println("Controller find : " + member.getPass());
		
		boolean isFind = ms.find(member);
		
		if(isFind) {
			rttr.addFlashAttribute("email", member.getEmail());
			return "redirect:/member/resetPW";
		} else {
			
			return "redirect:/member/find";
		}
	}
	
	@GetMapping("resetPW")
	public void resetPW() {}
	
	@PostMapping("resetPW")
	public String resetPW(MemberVO member) {
		
		System.out.println("Controller resetPW : " + member.getEmail());
		System.out.println("Controller resetPW : " + member.getPass());
		
		boolean isResetPW = ms.resetPW(member);
		
		if (isResetPW) {
			
			return "redirect:/main";
		} else {
			
			return "redirect:/member/resetPW";
		}
		
	}

	@GetMapping("beforeMyPage")
	public void beforeMyPage() {}
	
	@PostMapping("beforeMyPage")
	public String beforeMyPage(String pass, HttpSession session, RedirectAttributes rttr) {
		MemberVO member = (MemberVO) session.getAttribute("member");
				
		if (member != null && member.getPass().equals(pass)) {	
			
			return "redirect:/member/myPage";
		} else {
			// 비밀번호가 일치하지 않을 경우
			rttr.addFlashAttribute("msg", "비밀번호가 일치하지 않습니다.");
			return "redirect:/member/beforeMyPage";
		}		
	}

	@GetMapping("myPage")
	public void myPage() {}

	@PostMapping("myPage")
	public String myPage(MemberVO member, HttpSession session, RedirectAttributes rttr) {
		
		boolean isMyPage = ms.myPage(member);
		
		if (isMyPage) {
			MemberVO currentMember = (MemberVO) session.getAttribute("member");
			currentMember.setAge(member.getAge());
		    currentMember.setPhone(member.getPhone());
		    session.setAttribute("member", currentMember);
		    
		    rttr.addFlashAttribute("mypageMsg", "정보가 성공적으로 업데이트되었습니다.");
			
			return "redirect:/home";
		} else {
			rttr.addFlashAttribute("mypageMsg", "이미 존재하는 전화번호입니다.");
			
			return "redirect:/member/myPage";
		}
		
	}
	
	@GetMapping("beforeWithdraw")
	public void beforeWithdraw() {}
	
	@PostMapping("beforeWithdraw")
	public String beforeWithdraw(String pass, HttpSession session, RedirectAttributes rttr) {
		MemberVO member = (MemberVO) session.getAttribute("member");
		
		if (member != null && member.getPass().equals(pass)) {
			
			return "redirect:/member/withdraw";
		} else {
			// 비밀번호가 일치하지 않을 경우
			rttr.addFlashAttribute("failMessage", "비밀번호가 일치하지 않습니다.");
			return "redirect:/member/beforeWithdraw";
		}		
	}
	
	@GetMapping("withdraw")
	public void withdraw() {}
	
	@PostMapping("withdraw")
	public String withdraw(String withdrawWord, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		
		if ("회원탈퇴".equals(withdrawWord)) {
			
			// 세션에서 이메일 가져오기
			MemberVO member = (MemberVO) session.getAttribute("member");
			String email = member.getEmail();
			
			ms.withdraw(email);
			
			ms.logOut(request, response);
			
			// 탈퇴 후 로그인 페이지로 
			return "redirect:/member/login";
		}
		// 실패 시 해당 페이지로 리다이렉트
		return "redirect:/member/withdraw";
	}

}
