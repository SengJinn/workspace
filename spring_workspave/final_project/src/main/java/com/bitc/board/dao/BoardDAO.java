package com.bitc.board.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.bitc.board.vo.BoardVO;
import com.bitc.common.util.Criteria;

public interface BoardDAO {

	/**
	 * 게시글 작성
	 * 
	 * @param BoardVO db에 등록할 게시글 정보
	 * @return 등록된 게시글 개수를 수로 반환
	 */
	@Insert("INSERT INTO board(b_title,b_content,email,name) VALUES(#{b_title}, #{b_content}, #{email}, #{name})")
	int create(BoardVO vo) throws Exception;

	/**
	 * 게시글 상세보기
	 * 
	 * @param b_num - 상세보기할 게시글 번호
	 * @return - 조회된 게시글 정보를 BoardVO 타입으로 반환
	 */
	@Select("SELECT * FROM board WHERE b_num = #{b_num}")
	BoardVO read(int b_num) throws Exception;

	/**
	 * 게시글 수정
	 * 
	 * @param BoardVO 수정할 게시글 정보
	 * @return - 수정된 게시글 개수를 정수로 반환
	 */
	@Update("UPDATE board SET b_title = #{b_title}, b_content = #{b_content} " + " WHERE b_num = #{b_num}")
	int update(BoardVO vo) throws Exception;

	/**
	 * 게시글 삭제
	 * 
	 * @param b_num - 삭제할 게시글 번호
	 * @return - 삭제된 게시글 개수를 정수로 반환
	 */
	@Delete("DELETE FROM board WHERE b_num = #{b_num}")
	int delete(int b_num) throws Exception;

	/**
	 * 조회수 증가
	 * 
	 * @param b_num - 조회수 증가 시킬 게시글 번호
	 */
	@Update("UPDATE board SET b_viewcnt = b_viewcnt + 1 WHERE b_num = #{b_num}")
	void updateCnt(int b_num) throws Exception;

	/**
	 * 전체 게시글 목록
	 * 
	 * @return - 조회된 전체 게시글 목록
	 */
	@Select("SELECT * FROM board ORDER BY b_num DESC")
	List<BoardVO> listAll() throws Exception;

	/**
	 * 전체 게시물 개수
	 * 
	 * @return - 전체 게시글 개수
	 */
	@Select("SELECT count(*) FROM board")
	int totalCount() throws Exception;

	/**
	 * 페이징 처리된 게시물 목록
	 * 
	 * @param cri - 페이징 된 게시글 목록을 조회할 정보
	 * @return - 조회된 게시글 목록
	 */
	@Select("SELECT * FROM board ORDER BY b_num DESC limit #{startRow}, #{perPageNum}")
	List<BoardVO> listCriteria(Criteria cri) throws Exception;

	/**
	 * 검색 결과 게시물 개수
	 * 
	 * @return - 검색 결과 게시물 개수
	 * @throws Exception
	 */
	/*
	 * @Select() int SearchListCount(String searchName, String searchValue) throws
	 * Exception;
	 */

	/**
	 * 페이징 처리된 검색 결과 게시물 목록
	 * 
	 * @param cri
	 * @return -
	 * @throws Exception
	 */
	/*
	 * @Select("SELECT COUNT(*) FROM board" +
	 * " WHERE (searchName = #{b_title} AND b_title LIKE CONCAT('%', #{searchValue}, '%'))"
	 * +
	 * " OR (searchName <> #{b_title} AND `email` LIKE CONCAT('%', #{searchValue}, '%'))"
	 * ) List<BoardVO> SearchBoardList(PageMaker pageMaker) throws Exception;
	 */

} // end BoardDAO interface
