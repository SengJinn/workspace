package com.bitc.FP.contents.movies;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("contents/movies/")
public class MoviesController {

	@GetMapping("movies_detail")
	public void moviesDetail() throws Exception  {
		
	}
} // end MoviesController class
