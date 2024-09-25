package com.bitc.membership.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitc.member.model.MemberVO;
import com.bitc.membership.service.MembershipService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("membership/")
@RequiredArgsConstructor
public class MembershipController {

	private final MembershipService mss;
	
	@GetMapping("membership")
	public void membership() {}
	
	// 포인트 적립
	@PostMapping("pointUpdate")
	@ResponseBody
	public void pointUpdate(@RequestParam int point, HttpSession session) {
		MemberVO member = (MemberVO) session.getAttribute("member");
		
		if(member != null) {
			boolean isUpdate = mss.pointUpdate(member.getEmail(), point);
			
			if (isUpdate) {
				member.setPoint(member.getPoint() + point);
				System.out.println(member);
				
				session.setAttribute("member", member);
			}
		}
	}
	
	/*
	 * @PostMapping("paymentInfo")
	 * 
	 * @ResponseBody
	 */
	
}
