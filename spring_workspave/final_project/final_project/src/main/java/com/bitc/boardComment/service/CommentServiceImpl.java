package com.bitc.boardComment.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.bitc.boardComment.dao.CommentDAO;
import com.bitc.boardComment.vo.CommentVO;
import com.bitc.common.util.Criteria;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CommentServiceImpl implements CommentService {

	private final CommentDAO dao;

	@Override
	public String addComment(CommentVO vo) throws Exception {
		int result = dao.add(vo);
		return result == 1 ? "등록성공" : "등록실패";
	}

	@Override
	public List<CommentVO> commentList(int b_num) throws Exception {
		return dao.commentList(b_num);
	}

	@Override
	public String updateComment(CommentVO vo) throws Exception {
		int result = dao.update(vo);
		return result > 0 ? "수정성공" : "수정실패";
	}

	@Override
	public String deleteComment(int bc_num) throws Exception {
		return dao.delete(bc_num) == 1 ? "삭제성공" : "삭제실패";
	}

	@Override
	public Map<String, Object> commentPage(Criteria cri, int bno) throws Exception {
		return null;
	}

}
