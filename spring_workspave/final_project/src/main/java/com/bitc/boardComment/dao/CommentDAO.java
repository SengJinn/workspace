package com.bitc.boardComment.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.bitc.boardComment.vo.CommentVO;

public interface CommentDAO {

	@Insert("INSERT INTO b_comment(b_num, email, name, c_content, p_num) " 
			+ "VALUES(#{b_num}, #{email}, #{name}, #{c_content}, #{p_num})")
	int add(CommentVO vo) throws Exception;

	@Select("SELECT * FROM b_comment WHERE b_num = #{b_num} ORDER BY bc_num DESC")
	List<CommentVO> commentList(int b_num) throws Exception;

	@Update("UPDATE b_comment SET c_content = #{c_content}, c_updatedate = now() "
			+ "WHERE bc_num = #{bc_num}")
	int update(CommentVO vo) throws Exception;

	@Delete("DELETE FROM b_comment WHERE bc_num = #{bc_num}")
	int delete(int bc_num) throws Exception;

	@Select("SELECT * FROM b_comment WHERE b_num = #{b_num} limit #{cri.startRow}, #{cri.perPageNum}")
	List<CommentVO> listPage(Map<String, Object> map) throws Exception;

	@Select("SELECT count(*) FROM b_comment WHERE b_num = #{b_num}")
	int totalCount(int bno) throws Exception;

} // end CommentDAO interface
