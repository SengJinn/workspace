package com.bitc.contents.movies.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.bitc.contents.movies.dao.MovieDAO;
import com.bitc.contents.movies.model.MovieRatingVO;
import com.bitc.contents.movies.model.MovieVO;

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

    public List<MovieVO> getAllMovies() throws Exception {
        return dao.listAllMovies();
    }

    public List<MovieVO> listRandomMovies() throws Exception {
    	return dao.listRandomMovies();
    }
    
    public List<MovieVO> recentMovies() throws Exception {
    	return dao.recentMovies();
    }
    
	@Override
	public MovieVO getMovie(int mv_num) throws Exception {
		return dao.getMovie(mv_num);
	}

	@Override
	public List<MovieRatingVO> getRatingListByMvnum(int mv_num) throws Exception {
		return dao.getRatingListByMvnum(mv_num);
	}
	
	@Override
    public boolean likeMovie(int mv_num, int num) {
        return dao.insertLike(mv_num, num);
    }

	@Override
    public boolean unlikeMovie(int mv_num, int num) {
        return dao.deleteLike(mv_num, num);
    }

	@Override
    public boolean isMovieLiked(int mv_num, int num) {
        return dao.isLiked(mv_num, num);
    }

    @Override
    public List<MovieVO> searchMovies(String keyword) {
        return dao.searchMovies(keyword);
    }
}
