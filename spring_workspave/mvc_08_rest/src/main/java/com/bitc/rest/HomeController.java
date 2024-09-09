package com.bitc.rest;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bitc.rest.vo.sampleVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	// @RequestMapping(value = "/", method = RequestMethod.GET)
	@GetMapping("/")
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	@GetMapping("methodTest")
	public void methodTest() {}
	
	// 식별자가 같아도 매개변수 다르게 해서 구분 가능하게 해주는 거 = 오버로딩
	// 모델 객체 = 리퀘스트와 같음. 전달해야 하는 객체 그자체
	@PostMapping("methodTest")
	public void methodTest(String name, int age, Model model) {
		System.out.println("methodTest POST 호출");
		System.out.println("name : " + name);
		System.out.println("age : " + age);
		model.addAttribute("name", name);
		model.addAttribute("age", age);
	}
	
	@RequestMapping(value="methodTest", method=RequestMethod.PUT)
	public void methodTest(sampleVO vo, Model model) {
		System.out.println("PUT : " + vo);
		model.addAttribute("sample", vo);
	}
	
	@GetMapping("javascript")
	public void javascript() {
		
	}
	
	
	
	
	
	
	
	
	
	
}
