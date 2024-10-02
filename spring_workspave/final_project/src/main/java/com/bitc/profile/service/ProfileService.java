package com.bitc.profile.service;

import java.util.List;

import com.bitc.profile.vo.ProfileVO;

public interface ProfileService {

	// 프로필 생성 메서드
	public boolean createProfile(ProfileVO profile);

	// 사용자 이메일로 프로필 조회
	public List<ProfileVO> profileList(String email);

	// 프로필 선택
	public ProfileVO selectProfile(int num);

	// 프로필 삭제
	public boolean deleteProfile(int num, String email);

	// 프로필 수정
	public boolean updateProfile(ProfileVO profile);

}
