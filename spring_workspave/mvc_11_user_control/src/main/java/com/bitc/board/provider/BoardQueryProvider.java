package com.bitc.board.provider;

import org.apache.ibatis.jdbc.SQL;

import com.bitc.common.utils.SearchCriteria;

public class BoardQueryProvider {
	
	/*
	 "SELECT B.*, U.u_name AS writer FROM "
		 +" board_tbl AS B JOIN spring_user AS U "
		 +" ON B.u_no = U.u_no "
		 +" ORDER BY bno DESC limit #{startRow} , #{perPageNum}"
		 // limit 10 OFFSET 0;
	 */
	public String searchSelectSql(SearchCriteria cri) {
		SQL sql = new SQL();
		sql.SELECT("B.*, U.u_name AS writer");
		sql.FROM("board_tbl AS B NATURAL JOIN spring_user AS U");
		
		getSearchWhere(cri, sql);
		
		sql.ORDER_BY("bno DESC");
		sql.LIMIT(cri.getPerPageNum());		// 개수
		sql.OFFSET(cri.getStartRow());		// 시작 인덱스 번호
		String query = sql.toString();
		System.out.println("searchSelectSql : "+query);
		return query;
	}
	
	
	// 검색된 전체 게시물 개수를 반환하는 Query
	public String searchSelectCount(SearchCriteria cri) {
		SQL sql = new SQL();
		sql.SELECT("count(*)");
		sql.FROM("board_tbl AS B NATURAL JOIN spring_user AS U");
		getSearchWhere(cri, sql);
		return sql.toString();
	}
	
	
	
	
	// Where 조건절 동적으로 생성해서  할당
	private void getSearchWhere(SearchCriteria cri, SQL sql) {
		// t c w tc tw tcw
		String titleQuery = "title LIKE CONCAT('%',#{keyword},'%')";
		String contentQuery = "content LIKE CONCAT('%',#{keyword},'%')";
		String writerQuery = "U.u_name LIKE CONCAT('%',#{keyword},'%')";
		
		if(cri.getSearchType() != null 
			&& !cri.getSearchType().trim().equals("")
			&& !cri.getSearchType().trim().equals("n")) {
			
			if(cri.getSearchType().contains("t")) {
				sql.OR().WHERE(titleQuery);
			}
			
			if(cri.getSearchType().contains("c")) {
				sql.OR().WHERE(contentQuery);
			}
			
			if(cri.getSearchType().contains("w")) {
				sql.OR().WHERE(writerQuery);
			}
			
		}
	}

}















