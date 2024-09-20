package com.bitc.member.dao;

import lombok.Data;

@Data
public class LoginDTO {

	private String email;
	private String pass;
	private boolean check;

}
