package com.bitc.common.controller;

import java.util.List;
import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bitc.contents.movies.model.MovieVO;
import com.bitc.contents.movies.service.MovieService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/")
@RequiredArgsConstructor
public class MainController {
	
private final MovieService mv;

	@GetMapping("home")
	public String home(Model model) throws Exception {
		
	   List<MovieVO> randomMovies = mv.listRandomMovies();
	   model.addAttribute("randomMovies", randomMovies);
	   
	   List<MovieVO> recentMovies = mv.recentMovies();
	   model.addAttribute("recentMovies", recentMovies);
	   
	   return "home";
		
	}

	@GetMapping("main")
	public String main() {
		return "main";
	}

}
