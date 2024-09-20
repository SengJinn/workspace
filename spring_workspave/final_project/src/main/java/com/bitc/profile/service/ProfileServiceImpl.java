package com.bitc.profile.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.bitc.profile.dao.ProfileDAO;
import com.bitc.profile.vo.ProfileVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ProfileServiceImpl implements ProfileService {

	private final ProfileDAO dao;

	// 프로필 생성
	@Override
	public boolean createProfile(ProfileVO profile) {

		System.out.println("createProfile Method() ProfileServiceImpl ProfileVO : " + profile);

		return dao.createProfile(profile);
	}

	// 사용자 프로필 조회
	@Override
	public List<ProfileVO> profileList(String email) {
		return dao.profileList(email);
	}

	// 프로필 선택
	@Override
	public ProfileVO selectProfile(int num) {
		return dao.selectProfile(num);
	}

	// 프로필 삭제
	@Override
	public boolean deleteProfile(int num, String email) {

		return dao.deleteProfile(num, email);
	}

	// 프로필 수정
	@Override
	public boolean updateProfile(ProfileVO profile) {

		System.out.println("ProfileServiceImpl updateProfile ProfileVO" + profile);

		return dao.updateProfile(profile);
	}
}
