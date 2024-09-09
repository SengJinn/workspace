package com.bitc.FP.member.model;

import java.util.Date;

import lombok.Data;

@Data
public class MemberVO {
	private int num;
	private String email;
	private String pass;
	private String age;
	private int point;
	private String phone;
	private Date join_date;
}
