package com.bitc.contents.movies.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.bitc.contents.movies.model.MovieRatingVO;

public interface MovieDAO {

	/**
	 * @implNote -
	 * @param rating -
	 * @return boolean -
	 */
	@Insert("INSERT INTO movie_rating(mr_num, email, mv_num, mr_comment, mr_stars, name) VALUES(null,#{email},#{mv_num},#{mr_comment},#{mr_stars}, #{name})")
	boolean movieRating(MovieRatingVO rating);

	/**
	 * 전체 게시글 목록
	 * 
	 * @return - 조회된 전체 게시글 목록
	 */
	@Select("SELECT * FROM movie_rating ORDER BY mr_num DESC")
	List<MovieRatingVO> listAll() throws Exception;

}
