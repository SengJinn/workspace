package com.bitc.boardComment.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.bitc.boardComment.dao.CommentDAO;
import com.bitc.boardComment.vo.CommentVO;
import com.bitc.common.util.Criteria;
import com.bitc.common.util.PageMaker;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CommentServiceImpl implements CommentService {

	private final CommentDAO dao;

	@Override
	public String addComment(CommentVO vo) throws Exception {
		int result = dao.add(vo);
		return result == 1 ? "댓글 작성 성공" : "댓글 등록 실패";
	}

	@Override
	public List<CommentVO> commentList(int b_num) throws Exception {
		return dao.commentList(b_num);
	}

	@Override
	public String updateComment(CommentVO vo) throws Exception {
		int result = dao.update(vo);
		return result > 0 ? "댓글 수정 성공" : "댓글 수정 실패";
	}

	@Override
	public String deleteComment(int bc_num) throws Exception {
		return dao.delete(bc_num) == 1 ? "댓글 삭제 성공" : "댓글 삭제 실패";
	}

	@Override
	public Map<String, Object> commentPage(Criteria cri, int bno) throws Exception {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("bno", bno);
		paramMap.put("cri", cri);
		List<CommentVO> list = dao.listPage(paramMap);
		
		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
		
		PageMaker pm = new PageMaker();
		pm.setCri(cri);
		int totalCount = dao.totalCount(bno);
		pm.setTotalCount(totalCount);
		map.put("pm", pm);
		
		return map;
	}

}
