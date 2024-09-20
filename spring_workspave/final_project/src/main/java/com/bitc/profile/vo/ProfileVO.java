package com.bitc.profile.vo;

import lombok.Data;

@Data
public class ProfileVO {

	private int num;
	private String email; // 사용자 이메일 (외래키)
	private String name; // 프로필 이름
	private String image; // 프로필 이미지 경로
	private int bookmark; // 북마크
	private String pass; // 프로필 비밀번호 (선택적)
}