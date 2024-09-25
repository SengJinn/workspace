package com.bitc.profile.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitc.member.model.MemberVO;
import com.bitc.profile.service.ProfileService;
import com.bitc.profile.vo.ProfileVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("profile/")
@RequiredArgsConstructor
public class ProfileController {

	private final ProfileService ps;

	// 프로필 목록 페이지
	@GetMapping("profile")
	public String profile(Model model, HttpSession session) {

		// 세션에 로그인 된 사용자 정보 가져오기
		MemberVO member = (MemberVO) session.getAttribute("member");

		// 프로필 목록 가져오기
		List<ProfileVO> profiles = ps.profileList(member.getEmail());

		// 프로필 목록을 모델에 추가
		model.addAttribute("profiles", profiles);

		// session.setAttribute("profiles", profiles);

		return "profile/profile";
	}

	// 사용할 프로필 선택
	@PostMapping("profile")
	@ResponseBody
	public ProfileVO selectProfile(int num, HttpSession session) {

		ProfileVO selectProfile = ps.selectProfile(num);

		// 선택된 프로필을 세션에 저장
		session.setAttribute("currentProfile", selectProfile);

		return selectProfile;
	}

	// 프로필 생성
	@PostMapping("create")
	@ResponseBody
	public ResponseEntity<List<ProfileVO>> createProfile(ProfileVO profile, HttpSession session) {
		// 세션에 로그인 된 사용자 정보 가져오기
		MemberVO member = (MemberVO) session.getAttribute("member");

		// 프로필 정보에 사용자 Email 추가
		profile.setEmail(member.getEmail());

		// 서비스 호출하여 프로필 생성
		ps.createProfile(profile);

		// 생성된 프로필 목록을 가져오기
		List<ProfileVO> profiles = ps.profileList(member.getEmail());

		System.out.println("createProfile Method ProfileController : " + profiles);

		// 프로필 목록을 포함하여 응답 반환
		return ResponseEntity.ok(profiles);
	}

	@GetMapping("profileEdit")
	public void profileEdit() {
	}

	// 프로필 삭제
	@PostMapping("profileDelete")
	@ResponseBody
	public String deleteProfile(@RequestParam int num, @RequestParam String email, HttpSession session) {

		boolean result = ps.deleteProfile(num, email);

		if (result) {
			ProfileVO currentProfile = (ProfileVO) session.getAttribute("currentProfile");
			if (currentProfile != null && currentProfile.getNum() == num && currentProfile.getEmail().equals(email)) {
				// 현재 사용 중인 프로필 정보 세션 삭제
				session.removeAttribute("currentProfile");
			}
			return "redirect:/profile/profile";

		}
		return "profile/profileEdit";
	}

	// 프로필 수정
	@PostMapping("updateProfile")
	@ResponseBody
	public boolean updateProfile(ProfileVO profile, HttpSession session) {

		// 현재 세션의 프로필 정보 가져오기
		ProfileVO currentProfile = (ProfileVO) session.getAttribute("currentProfile");

		System.out.println("ProfileController before update session : " + currentProfile);

		// 이미지를 선택하지 않았다면 기존 이미지를 사용
		if (profile.getImage() == null || profile.getImage().isEmpty()) {
			profile.setImage(currentProfile.getImage());
		}

		boolean result = ps.updateProfile(profile);

		if (result) {
			// 수정된 프로필 불러오기
			ProfileVO updateProfile = ps.selectProfile(profile.getNum());

			// 세션에 저장된 프로필과 일치하면 세션 업뎃
			if (currentProfile != null && currentProfile.getNum() == updateProfile.getNum()) {
				session.setAttribute("currentProfile", updateProfile);

				System.out.println("ProfileController after update session : " + currentProfile);
			}
		}
		return result;
	}

}