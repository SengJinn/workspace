package com.bitc.boardComment.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CommentVO {

	/*
	 * CREATE TABLE IF NOT EXISTS b_comment( bc_num INT PRIMARY KEY AUTO_INCREMENT,
	 * -- 댓글 번호 b_num INT NOT NULL, -- 게시글 번호 email VARCHAR(100) NOT NULL, -- 작성자 이름
	 * c_content TEXT NOT NULL, -- 댓글 내용 c_regdate TIMESTAMP NOT NULL DEFAULT NOW(),
	 * -- 작성 시간 c_updatedate TIMESTAMP NOT NULL DEFAULT NOW(), -- 수정 시간 FOREIGN KEY
	 * (email) REFERENCES `member`(email), CONSTRAINT fk_board_b_num FOREIGN KEY
	 * (b_num) REFERENCES board(b_num) ON DELETE CASCADE, INDEX(b_num) );
	 */

	private int bc_num;
	private int b_num;
	private String email;
	private String name;
	private String c_content;
	private Date c_regdate;
	private Date c_updatedate;
	private int p_num;

} // end CommentVO class
