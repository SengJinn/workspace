package com.bitc.contents.movies.service;

import java.util.List;

import com.bitc.contents.movies.model.MovieRatingVO;

public interface MovieService {

	/**
	 * @implNote -
	 * @param
	 * @return
	 */
	boolean movieRating(MovieRatingVO rating);

	List<MovieRatingVO> listAll() throws Exception;

}
