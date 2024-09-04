package com.bitc.FP.contents;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("contents/")
public class MapController {

	@GetMapping("map")
	public String map() {
		return "contents/map";
	}
	
	@GetMapping("privacy_policy")
	public String privacy() {
		return "contents/privacy_policy";
	}
	
}
