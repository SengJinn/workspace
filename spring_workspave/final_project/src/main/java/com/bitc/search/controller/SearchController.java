package com.bitc.search.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bitc.contents.movies.model.MovieVO;
import com.bitc.contents.movies.service.MovieService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("search/")
@RequiredArgsConstructor
public class SearchController {

	private final MovieService mv;
	
	@GetMapping("search_main")
	public void search() {
	}

    @GetMapping("search_result")
    public String searchMovies(@RequestParam("keyword") String keyword, Model model,RedirectAttributes rttr) throws Exception {
       
    	List<MovieVO> searchMovies = mv.searchMovies(keyword);
        model.addAttribute("searchMovies", searchMovies);
        
        if (searchMovies.isEmpty()) {
			String noSearch = "일치하는 검색 결과가 없습니다.";
			rttr.addFlashAttribute("noSearch", noSearch);
			return "redirect:/search/search_main";
        }
        
        return "search/search_main";
    }
	
}
