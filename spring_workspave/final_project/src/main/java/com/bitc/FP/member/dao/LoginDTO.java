package com.bitc.FP.member.dao;

import lombok.Data;

@Data
public class LoginDTO {

	private String email;
	private String pass;
	private boolean check;

}
