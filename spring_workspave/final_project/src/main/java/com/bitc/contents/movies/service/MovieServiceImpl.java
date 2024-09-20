package com.bitc.contents.movies.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.bitc.contents.movies.dao.MovieDAO;
import com.bitc.contents.movies.model.MovieRatingVO;

import lombok.RequiredArgsConstructor;

@Service("mv")
@RequiredArgsConstructor // lombok
public class MovieServiceImpl implements MovieService {

// 	@Autowired
	private final MovieDAO dao;

	@Override
	public boolean movieRating(MovieRatingVO rating) {
		return dao.movieRating(rating);
	}

	@Override
	public List<MovieRatingVO> listAll() throws Exception {
		return dao.listAll();
	}

}
