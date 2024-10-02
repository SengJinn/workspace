package com.bitc.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.bitc.board.dao.BoardDAO;
import com.bitc.board.vo.BoardVO;
import com.bitc.common.util.Criteria;
import com.bitc.common.util.PageMaker;
import com.bitc.common.util.SearchCriteria;
import com.bitc.common.util.SearchPageMaker;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BoardServiceImpl implements BoardService {

	private final BoardDAO dao;

	@Override
	public Map<String, Object> list(SearchCriteria cri) throws Exception {
		List<BoardVO> list = dao.list(cri);
		int totalCount = dao.totalCount(cri);
		PageMaker pm = new SearchPageMaker();
		pm.setCri(cri);
		pm.setTotalCount(totalCount);
		
		System.out.println(pm);
		
		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
		map.put("pm", pm);
		return map;
	}
	
	@Override
	public String regist(BoardVO board) throws Exception {
		int result = dao.create(board);
		String message = (result == 1) ? "작성 완료" : "작성 실패";
		return message;
	}

	@Override
	public void updateCnt(int b_num) throws Exception {
		dao.updateCnt(b_num);

	}

	@Override
	public BoardVO read(int b_num) throws Exception {
		return dao.read(b_num);
	}

	@Override
	public String modify(BoardVO board) throws Exception {
		int result = dao.update(board);
		return (result == 1) ? "수정 완료" : "수정 실패";
	}

	@Override
	public String remove(int b_num) throws Exception {
		return dao.delete(b_num) == 1 ? "삭제 완료" : "삭제 실패";
	}

} // end BoardServiceImpl class
