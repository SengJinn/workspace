package com.bitc.membership.service;

import com.bitc.member.model.MemberVO;

public interface MembershipService {

	// 포인트 적립
	public boolean pointUpdate(String email, int point);
}
