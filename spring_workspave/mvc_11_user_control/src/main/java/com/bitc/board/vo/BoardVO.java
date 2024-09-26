package com.bitc.board.vo;

import java.util.Date;

import lombok.Data;

@Data
public class BoardVO {
	
	private int bno;				// 게시글 번호
	private String title;			// 제목
	private String content;			// 내용
	private String writer;			// 작성 이름 필드 추가
	private Date regdate;			// 작성 시간
	private int viewcnt;			// 조회수
	private String showboard;		// 게시글 삭제 여부
	private int u_no;				// 게시글 작성자 회원 번호

}




