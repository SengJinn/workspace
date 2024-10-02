package com.bitc.sec.vo;

import java.util.List;

import lombok.Data;

@Data
public class SecurityMemberVO {
	
	private int u_no;
	private String u_id;
	private String u_pw;
	private String u_name;
	
	// 권한 목록
	private List<String> authList;

}
















