package com.bitc.contents.movies.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.bitc.contents.movies.model.MovieRatingVO;
import com.bitc.contents.movies.model.MovieVO;

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

	@Select("SELECT * FROM movie ORDER BY mv_num DESC")
	List<MovieVO> listAllMovies() throws Exception;

	@Select("SELECT * FROM movie WHERE mv_num  = #{mv_num}")
	MovieVO getMovie(int mv_num) throws Exception;
	
	@Select("SELECT * FROM movie_rating WHERE mv_num  = #{mv_num} ORDER BY mr_num DESC")
	List<MovieRatingVO> getRatingListByMvnum(int mv_num) throws Exception;
	
	
    @Insert("INSERT INTO movie_likes(mv_num, num) VALUES(#{mv_num}, #{num})")
    boolean insertLike(@Param("mv_num") int mv_num, @Param("num") int num);

    @Delete("DELETE FROM movie_likes WHERE mv_num = #{mv_num} AND num = #{num}")
    boolean deleteLike(@Param("mv_num") int mv_num, @Param("num") int num);

    @Select("SELECT COUNT(*) > 0 FROM movie_likes WHERE mv_num = #{mv_num} AND num = #{num}")
    boolean isLiked(@Param("mv_num") int mv_num, @Param("num") int num);

    @Select("SELECT * FROM movie WHERE title LIKE CONCAT('%', #{keyword}, '%') OR actor LIKE CONCAT('%', #{keyword}, '%') OR director LIKE CONCAT('%', #{keyword}, '%')")
    List<MovieVO> searchMovies(String keyword);
    
}





