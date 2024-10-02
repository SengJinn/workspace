package com.bitc.member.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

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
	// 멤버십으로 추가된 필드
	private String membershipType;
	private String membershipStatus;
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	private Date paymentDate;
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	private Date expiryDate;
}
