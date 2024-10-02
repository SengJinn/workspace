package com.bitc.membership.dao;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.bitc.member.model.MemberVO;

public interface MembershipDAO {

	// 멤버십 업데이트 (포인트 적립을 교체해야 함)
	@Update("UPDATE member SET point = point + #{point}, membershipType = #{membershipType}, "
			+ " membershipStatus = '갱신', paymentDate = #{paymentDate}, expiryDate = #{expiryDate} "
			+ " WHERE email = #{email}")
	int membershipUpdate(MemberVO vo);

	// 포인트 결제 (포인트 차감)
	@Update("UPDATE member SET point = point - #{point}, membershipType = #{membershipType}, "
			+ " membershipStatus = '갱신', paymentDate = #{paymentDate}, expiryDate = #{expiryDate} "
			+ " WHERE email = #{email}")
	int pointPay(MemberVO vo);

	// 이메일로 조회
	@Select("SELECT * FROM member WHERE email = #{email}")
	MemberVO getMemberByEmail(String email);
	
	// 트리거 작동을 위한 업데이트문 
	@Update("UPDATE member SET membershipStatus = '만료' WHERE email = #{email}")
	MemberVO expiration(String email);
}
