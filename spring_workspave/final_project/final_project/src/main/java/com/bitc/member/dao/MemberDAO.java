package com.bitc.member.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.bitc.member.model.MemberVO;

public interface MemberDAO {

	/**
	 * @implNote - 회원 정보 등록 test_mvc
	 * @param member - 회원 등록에 필요한 정보를 저장한 객체
	 * @return boolean - 테이블에 회원정보 삽입 성공 여부, true : 등록 성공, false : 등록 실패
	 */
	@Insert("INSERT INTO member(num, email, pass, age, point, phone, join_date) VALUES(null,#{email},#{pass},#{age},0,#{phone},now())")
	boolean memberJoin(MemberVO member);

	/**
	 * @implNote - 로그인 요청 처리
	 * @param id   - 인증할 사용자 아이디
	 * @param pass - 인증할 사용자 비밀번호
	 * @return MemberVO - 인증이 완료된 사용자 정보를 저장하는 객체,
	 * @return null - 인증된 사용자 정보가 존재하지 않음을 의미
	 */
	@Select("SELECT * FROM member WHERE email = #{email}")
	MemberVO memberLogin(String email);

	/**
	 * @implNote - 이메일 중복 확인
	 * @param email - 확인할 이메일
	 */
	@Select("SELECT COUNT(*) FROM member WHERE email = #{email}")
	int emailExists(String email);

	/**
	 * @implNote - 전화번호 중복 확인
	 * @param phone - 확인할 전화번호
	 */
	@Select("SELECT COUNT(*) FROM member WHERE phone = #{phone}")
	int phoneExists(String phone);

}
