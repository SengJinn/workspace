package com.bitc.membership.service;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.bitc.member.model.MemberVO;
import com.bitc.membership.dao.MembershipDAO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MembershipServiceImpl implements MembershipService {

	private final MembershipDAO dao;
	private final HttpSession session;

	// 멤버십 업데이트 (
	@Override
	public boolean membershipUpdate(MemberVO vo) {
		System.out.println("ServiceImpl : " + vo);

		return dao.membershipUpdate(vo) > 0;
	}

	// 포인트 결제
	@Override
	public boolean pointPay(MemberVO vo) {
		System.out.println("ServiceImpl Point : " + vo);
		
		return dao.pointPay(vo) > 0;
	}

	// 이메일로 회원 조회
	@Override
	public MemberVO getMemberByEmail(String email) {
		
		return dao.getMemberByEmail(email);
	}
	
}
