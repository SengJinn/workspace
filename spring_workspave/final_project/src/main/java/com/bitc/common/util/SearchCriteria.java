package com.bitc.common.util;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor // 기본 생성자 추가
@Getter
@Setter
@ToString(callSuper = true) // 부모의 ToString 메소드도 호출되도록 함
public class SearchCriteria extends Criteria {

	private String searchType;	// 검색 타입
	private String keyword;		// 검색 키워드
	
	// alt + s + a
	public SearchCriteria(int page, int perPageNum, String searchType, String keyword) {
		super(page, perPageNum);
		this.searchType = searchType;
		this.keyword = keyword;
	}
	

	
	
	
	
}
