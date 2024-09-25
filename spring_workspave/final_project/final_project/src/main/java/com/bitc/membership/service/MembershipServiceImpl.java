package com.bitc.membership.service;

import org.springframework.stereotype.Service;

import com.bitc.membership.dao.MembershipDAO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MembershipServiceImpl implements MembershipService {

	private final MembershipDAO dao;
	
	// 포인트 적립
	@Override
	public boolean pointUpdate(String email, int point) {
		
		System.out.println("email : " + email +", point : " + point);
		
		return dao.pointUpdate(email, point) > 0;
	}

}
