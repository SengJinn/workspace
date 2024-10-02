package com.bitc.contents.movies.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
        
        List<MovieVO> randomMovies = mv.listRandomMovies();
        model.addAttribute("randomMovies", randomMovies);
        
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
		
		
	    @PostMapping("likeMovie")
	    @ResponseBody
	    public ResponseEntity<Map<String, Object>> likeMovie(@RequestBody Map<String, String> params) throws Exception {
	    	int mv_num = Integer.parseInt(params.get("mv_num"));  
	        int num = Integer.parseInt(params.get("num"));
	        boolean success = mv.likeMovie(mv_num, num);
	        
	        Map<String, Object> response = new HashMap<>();
	        response.put("success", success);
	        return ResponseEntity.ok(response);
	    }
	    
	    @DeleteMapping("unlikeMovie")
	    @ResponseBody
	    public ResponseEntity<Map<String, Object>> unlikeMovie(@RequestBody Map<String, String> params) throws Exception {
	    	int mv_num = Integer.parseInt(params.get("mv_num"));  
	        int num = Integer.parseInt(params.get("num"));
	        boolean success = mv.unlikeMovie(mv_num, num);
	        
	        Map<String, Object> response = new HashMap<>();
	        response.put("success", success);
	        return ResponseEntity.ok(response);
	    }

	    @GetMapping("getLikeStatus")
	    @ResponseBody
	    public ResponseEntity<Map<String, Object>> getLikeStatus(@RequestParam int mv_num, @RequestParam int num) throws Exception {
	        boolean liked = mv.isMovieLiked(mv_num, num);
	        
	        Map<String, Object> response = new HashMap<>();
	        response.put("liked", liked);
	        return ResponseEntity.ok(response);
	    }

	    
	    @GetMapping("/search_movie")
	    public String searchMovies(@RequestParam("keyword") String keyword, Model model,RedirectAttributes rttr) throws Exception {
	       
	    	List<MovieVO> searchMovies = mv.searchMovies(keyword);
	        model.addAttribute("searchMovies", searchMovies);
	        
	        // 검색 결과가 없는 경우 전체 영화 리스트를 가져옴
	        if (searchMovies.isEmpty()) {
	            List<MovieVO> movies = mv.getAllMovies();
	            rttr.addFlashAttribute("movies", movies);
				String noSearch = "일치하는 검색 결과가 없습니다.";
				rttr.addFlashAttribute("noSearch", noSearch);
				return "redirect:/contents/movies/movies";
	        }
	        
	        return "contents/movies/movies";
	    }
	    
    

} // end MoviesController class
