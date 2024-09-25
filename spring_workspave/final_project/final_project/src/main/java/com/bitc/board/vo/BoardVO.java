package com.bitc.board.vo;

import java.util.Date;

import lombok.Data;

@Data
public class BoardVO {

	private int b_num;
	private String b_title;
	private String b_content;
	private String email;
	private String name;
	private Date b_regdate;
	private int b_viewcnt;
	private int p_num;

} // end BoardVO class
