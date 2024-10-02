package com.bitc.membership.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
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
	public void membership() {
	}

	// 카카오페이 멤버십 결제 (포인트까지 같이)
	@PostMapping("membershipUpdate")
	@ResponseBody
	public void membershipUpdate(MemberVO vo, HttpSession session) {

		System.out.println("Controller : " + vo);
		
		boolean isUpdate = mss.membershipUpdate(vo);
		
		MemberVO member = (MemberVO) session.getAttribute("member");
		if (isUpdate) {
			if (member != null) {
				member.setMembershipType(vo.getMembershipType());
				member.setPaymentDate(vo.getPaymentDate());
				member.setExpiryDate(vo.getExpiryDate());
				member.setPoint(member.getPoint()+vo.getPoint());
				member.setMembershipStatus("갱신");
				
				session.setAttribute("member", member);
			}			
		}
	}
	
	// 포인트 결제
	@PostMapping("pointPay")
	@ResponseBody
	public void pointPay(MemberVO vo, HttpSession session) {
		
		System.out.println("Controller Point : " + vo);
		
		boolean isUpdate = mss.pointPay(vo);
		
		MemberVO member = (MemberVO) session.getAttribute("member");
		if (isUpdate) {
			if (member != null) {
				member.setMembershipType(vo.getMembershipType());
				member.setPaymentDate(vo.getPaymentDate());
				member.setExpiryDate(vo.getExpiryDate());
				member.setPoint(member.getPoint()-vo.getPoint());
				member.setMembershipStatus("갱신");
				
				session.setAttribute("member", member);
			}
		}
		
	}

}
