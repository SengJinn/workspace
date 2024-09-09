package com.bitc.rest;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitc.rest.vo.sampleVO;

@Controller
public class SampleController {
	
	@GetMapping("sampleTest")
	@ResponseBody
	public sampleVO sampleTest(sampleVO vo) {
		System.out.println("sampleTest vo : " + vo);
		return vo;
	}
	
	@GetMapping("getSampleList")
	@ResponseBody
	public List<sampleVO> getSampleList(sampleVO vo){	
		List<sampleVO> list = new ArrayList<>();
		for(int i = 1; i <= 10; i++) {
			sampleVO sample = new sampleVO();
			sample.setName("KDH-"+i);
			sample.setAge(50+i);
			list.add(sample);
		}
		list.add(vo);
		return list;
	}
	
}
