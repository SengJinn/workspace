package com.bitc.board.provider;

import org.apache.ibatis.jdbc.SQL;

import com.bitc.common.util.SearchCriteria;

public class BoardQueryProvider {

	/*
	  	SELECT B.*, P.name AS `name` 
		FROM board AS B JOIN `profile` AS P ON B.name = P.name
		ORDER BY b_num DESC limit #{startRow} , #{perPageNum}
		// limit 10 OFFSET 0;
	  
	 */
	
	public String searchSelectSql(SearchCriteria cri) {
		SQL sql = new SQL();
		sql.SELECT(" B.*, P.name AS name ");
		sql.FROM(" board AS B NATURAL JOIN profile AS P ");
		
		getSearchWhere(cri, sql);
		
		sql.ORDER_BY(" b_num DESC ");
		sql.LIMIT(cri.getPerPageNum());		// 개수
		sql.OFFSET(cri.getStartRow());		// 시작 인덱스 번호
		String query = sql.toString();
		System.out.println("searchSelectSql : "+query);
		return query;
	}
	
	
	// 검색된 전체 게시물 개수를 반환하는 Query
	public String searchSelectCount(SearchCriteria cri) {
		SQL sql = new SQL();
		sql.SELECT(" COUNT(*) ");
		sql.FROM(" board AS B NATURAL JOIN profile AS P ");
		getSearchWhere(cri, sql);
		return sql.toString();
	}
	
	
	// Where 조건절 동적으로 생성해서  할당
	private void getSearchWhere(SearchCriteria cri, SQL sql) {
		// b_title  name
		String titleQuery = " b_title LIKE CONCAT('%',#{keyword},'%') ";
		String nameQuery = " P.name LIKE CONCAT('%',#{keyword},'%') ";
		
		if(cri.getSearchType() != null 
			&& !cri.getSearchType().trim().equals("")
			&& !cri.getSearchType().trim().equals("n")
			) {
					
			if(cri.getSearchType().contains("b_title")) {
				sql.OR().WHERE(titleQuery);
			}
				
			if(cri.getSearchType().contains("name")) {
				sql.OR().WHERE(nameQuery);
			}

					
		}
	}
	
	
} // end BoardQueryProvider class
