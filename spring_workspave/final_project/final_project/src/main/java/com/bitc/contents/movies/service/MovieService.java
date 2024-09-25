package com.bitc.contents.movies.service;

import java.util.List;

import com.bitc.contents.movies.dao.MovieDAO;
import com.bitc.contents.movies.model.MovieRatingVO;
import com.bitc.contents.movies.model.MovieVO;

public interface MovieService {

	/**
	 * @implNote -
	 * @param
	 * @return
	 */
	boolean movieRating(MovieRatingVO rating);
	
	List<MovieRatingVO> listAll() throws Exception;
	
	List<MovieVO> getAllMovies() throws Exception;

	MovieVO getMovie(int mv_num) throws Exception;
	
	List<MovieRatingVO> getRatingListByMvnum(int mv_num) throws Exception;
	

}
