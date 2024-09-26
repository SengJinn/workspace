package com.bitc.contents.movies.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bitc.contents.movies.model.MovieRatingVO;
import com.bitc.contents.movies.model.MovieVO;
import com.bitc.contents.movies.service.MovieService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("contents/movies/")
@RequiredArgsConstructor
public class MoviesController {

	private final MovieService mv;

	@GetMapping("movies")
	public void movies(Model model) throws Exception {
        List<MovieVO> movies = mv.getAllMovies();
        model.addAttribute("movies", movies);
	}

	
	@GetMapping("movies_detail")
	public void moviesDetail(int mv_num, Model model) throws Exception {
		/*
		List<MovieRatingVO> ratingList = mv.listAll();
		model.addAttribute("ratingList", ratingList);
		
        List<MovieVO> movies = mv.getAllMovies();
        model.addAttribute("movies", movies);
        */
        MovieVO movie = mv.getMovie(mv_num);
        model.addAttribute("movie", movie);
        
        List<MovieRatingVO> ratingList = mv.getRatingListByMvnum(mv_num);
        model.addAttribute("ratingList", ratingList);
        
	}

	@PostMapping("movies_rating")
	public String movies_rating(MovieRatingVO rating, RedirectAttributes rttr) {
		System.out.println(rating);
		
		boolean isRating = mv.movieRating(rating);
		
		String ratingSuccess = "";
		
		rttr.addAttribute("mv_num",rating.getMv_num());
		
		if (isRating) {
			ratingSuccess = "평점이 등록되었습니다.";
			rttr.addFlashAttribute("ratingSuccesss", ratingSuccess);
			return "redirect:/contents/movies/movies_detail";
		} else {
			ratingSuccess = "평점 등록에 실패했습니다.";
			rttr.addFlashAttribute("ratingSuccesss", ratingSuccess);
			return "redirect:/contents/movies/movies_detail";
		}

	}
		
		@GetMapping("movies_video")
		public void movies_video() throws Exception {
		}


} // end MoviesController class
