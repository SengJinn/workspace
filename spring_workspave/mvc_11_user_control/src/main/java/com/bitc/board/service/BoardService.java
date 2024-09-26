package com.bitc.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.bitc.board.dao.BoardDAO;
import com.bitc.board.vo.BoardVO;
import com.bitc.common.utils.PageMaker;
import com.bitc.common.utils.SearchCriteria;
import com.bitc.common.utils.SearchPageMaker;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BoardService {
	
	private final BoardDAO dao;

	public String regist(BoardVO vo) throws Exception{
		int result = dao.regist(vo);
		return result == 1 ? "게시글 등록 성공" : "게시글 등록 실패";
	}

	public Map<String, Object> list(SearchCriteria cri) throws Exception{
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
	
}











