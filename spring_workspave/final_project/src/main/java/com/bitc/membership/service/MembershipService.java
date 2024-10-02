package com.bitc.membership.service;

import com.bitc.member.model.MemberVO;

public interface MembershipService {

	// 멤버십 업데이트
	public boolean membershipUpdate(MemberVO member);

	// 포인트 결제
	public boolean pointPay(MemberVO vo);
	
	// 이메일로 회원 정보 조회
	public MemberVO getMemberByEmail(String email);
	
}
