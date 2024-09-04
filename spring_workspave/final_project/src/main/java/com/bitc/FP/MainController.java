package com.bitc.FP;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/")
@RequiredArgsConstructor
public class MainController {


	@GetMapping("home")
	public String home() {
		return "home";
	}
	
	@GetMapping("main")
	public String main() {
		return "main";
	}
	
	
}

