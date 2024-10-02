package com.bitc.board.service;

import java.util.List;
import java.util.Map;

import com.bitc.board.vo.BoardVO;
import com.bitc.common.util.Criteria;
import com.bitc.common.util.PageMaker;
import com.bitc.common.util.SearchCriteria;

public interface BoardService {

	/**
	 * 게시글 목록, 페이징처리 & 키워드 검색 후 목록, 페이징처리
	 * @param cri
	 * @return 
	 */
	Map<String, Object> list(SearchCriteria cri) throws Exception;
	
	/**
	 * 게시글 작성 - 성공 유무에 따라 메세지 전달
	 * 
	 * @param 게시글 등록 정보
	 * @return 성공 유무 메세지
	 */
	String regist(BoardVO board) throws Exception;

	/**
	 * 조회수 증가
	 * 
	 * @param bno 조회수 증가 시킬 게시글 번호
	 */
	void updateCnt(int bno) throws Exception;

	/**
	 * 게시글 상세보기
	 * 
	 * @param bno - 상세보기 게시글 번호
	 * @return 조회된 게시글 정보
	 */
	BoardVO read(int bno) throws Exception;

	/**
	 * 게시글 수정 - 성공 유무에 따라 메세지 전달
	 * 
	 * @param board - 수정할 게시글 정보
	 * @return - 수정 작업 완료 여부를 메시지로 반환
	 */
	String modify(BoardVO board) throws Exception;

	/**
	 * 게시글 삭제 - 성공 유무에 따라 메세지 전달
	 * 
	 * @param bno - 삭제할 게시글 번호
	 * @return - 삭제 완료 여부를 메세지로 반환
	 */
	String remove(int bno) throws Exception;

} // end BoardService interface
