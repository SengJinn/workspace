package com.bitc.member.service;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;

import com.bitc.member.dao.LoginDTO;
import com.bitc.member.model.MemberVO;

public interface MemberService {

	/**
	 * @implNote - 회원가입 요청 처리
	 * @param 회원가입에 필요한 데이터를 MemberVO 타입으로 전달 id - 회원아이디 pass - 비밀번호 name - 회원 이름
	 *
	 * @return boolean - 회원 가입 성공 여부 true : 회원가입 성공 false : 회원가입 실패
	 */
	boolean memberJoin(MemberVO member);

	/**
	 * @implNote - 로그인 요청 처리
	 * @param request  - 로그인 요청 처리에 필요한 parameter 정보, id : 로그인 요청 사용자 아이디 pass : 로그인
	 *                 요청 사용자 비밀번호 check : 로그인정보 저장 체크박스
	 * 
	 * @param response - 로그인 요청 처리에 필요한 응답 정보 - 쿠키 처리
	 * 
	 * @return boolean - 로그인 성공 여부 : true = 로그인 성공 , false 로그인 실패
	 */
	MemberVO memberLogin(LoginDTO dto);

	/**
	 * @param request  - 로그아웃 요청 처리에 필요한 Session 정보
	 * @param response - 쿠키 정보 삭제를 위한 정보
	 */
	void logOut(HttpServletRequest request, HttpServletResponse response);

	/**
	 * @param email - 회원 탈퇴를 위헤 세션에서 가져온 이메일 정보
	 */
	void withdraw(String email);

	/**
	 * @implNote - 변경할 비밀번호
	 */
	boolean changePW(String pass, String email);
	
	/**
	 * @implNote - 존재하는 회원이면 비밀번호 재설정
	 * @param member - 존재하는 회원 email 
	 * @return - 존재 여부 : true = 존재 , false = 없음
	 */
	boolean find(MemberVO member);

	/**
	 * @implNote - 비밀번호 재설정
	 * @param member - 존재하는 회원 email의 pass 변경
	 * @return - 변경된 행 여부 : true = 존재 , false = 없음
	 */
	boolean resetPW(MemberVO member);

	boolean myPage(MemberVO member);

}
