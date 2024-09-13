package com.bitc.FP.contents.movies.controller;

import java.util.List;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bitc.FP.contents.movies.dao.MovieDAO;
import com.bitc.FP.contents.movies.model.MovieRatingVO;
import com.bitc.FP.contents.movies.service.MovieService;
import com.bitc.FP.member.model.MemberVO;
import com.bitc.FP.member.service.MemberService;


import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("contents/movies/")
@RequiredArgsConstructor
public class MoviesController {

		private final MovieService mv; 
	

	@GetMapping("movies")
	public void movies(Model model) throws Exception  {
		
		List<MovieRatingVO> ratingList = mv.listAll();
		model.addAttribute("ratingList", ratingList);
		
	}
	
	@GetMapping("movies_detail")
	public void moviesDetail() throws Exception  {
		
	}
	
	
	@PostMapping("movies_rating")
	public String movies_rating(MovieRatingVO rating, RedirectAttributes rttr) {
		
		boolean isRating = mv.movieRating(rating);
		String ratingSuccess = "";
		
		if(isRating) {
			ratingSuccess = "평점이 등록되었습니다.";
	    	rttr.addFlashAttribute("ratingSuccesss", ratingSuccess);
	    	return "redirect:/contents/movies/movies_detail";
    	} else {
    		ratingSuccess = "평점 등록에 실패했습니다.";
    		rttr.addFlashAttribute("ratingSuccesss", ratingSuccess);
	    	return "redirect:/contents/movies/movies_detail";
    	}
		
		
	}
	
	
} // end MoviesController class
