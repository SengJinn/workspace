package com.bitc.search;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("search/")
public class SearchController {

	@GetMapping("search_main")
	public void search() {
	}

}
