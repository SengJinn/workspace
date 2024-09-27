package com.bitc.board.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectProvider;
import org.apache.ibatis.annotations.Update;

import com.bitc.board.provider.BoardQueryProvider;
import com.bitc.board.vo.BoardVO;
import com.bitc.common.utils.SearchCriteria;

public interface BoardDAO {
	
	@Insert("INSERT INTO board_tbl(title,content,u_no) "
			+ "VALUES(#{title},#{content},#{u_no})")
	int regist(BoardVO vo) throws Exception;

	/*
	@Select("SELECT B.*, U.u_name AS writer FROM "
		 +" board_tbl AS B JOIN spring_user AS U "
		 +" ON B.u_no = U.u_no "
		 +" ORDER BY bno DESC limit #{startRow} , #{perPageNum}")
	*/
	@SelectProvider(type = BoardQueryProvider.class, method="searchSelectSql")
	List<BoardVO> list(SearchCriteria cri) throws Exception;

// 	@Select("SELECT count(*) FROM board_tbl")
	@SelectProvider(type = BoardQueryProvider.class, method="searchSelectCount")
	int totalCount(SearchCriteria cri) throws Exception;

	@Update("UPDATE board_tbl SET viewcnt = viewcnt + 1 WHERE bno = #{bno}")
	void updateViewCnt(int bno) throws Exception;

	@Select("SELECT B.*, U.u_name AS writer FROM board_tbl AS B NATURAL JOIN spring_user AS U WHERE bno = #{bno}")
	BoardVO read(int bno) throws Exception;

	@Update("UPDATE board_tbl SET "
			+ " title = #{title}, "
			+ " content = #{content} "
			+ " WHERE bno = #{bno} AND u_no = #{u_no}")
	int modify(BoardVO board) throws Exception;

	// showboard 'y' == 'n' update
	@Update("UPDATE board_tbl SET showboard = 'n' WHERE bno = #{bno}")
	int remove(int bno) throws Exception;
	
}











