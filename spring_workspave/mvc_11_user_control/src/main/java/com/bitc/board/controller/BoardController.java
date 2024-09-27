package com.bitc.board.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bitc.board.service.BoardService;
import com.bitc.board.vo.BoardVO;
import com.bitc.common.utils.SearchCriteria;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/board/*")
@RequiredArgsConstructor
public class BoardController {
	
	private final BoardService bs;
	
	@GetMapping("list")
	public String list(SearchCriteria cri, Model model) throws Exception{
		// Criteria 요청 페이지 번호, 출력 게시물 개수, 검색 시작 인덱스 번호
 		Map<String, Object> map = bs.list(cri);
//  	model.addAttribute("list",map.get("list"));
 		model.addAllAttributes(map);
		return "board/list";
	}
	
	@GetMapping("register")
	public String register() throws Exception{
		return "board/register";
	}
	
	// 게시글 등록 요청 처리
	@PostMapping("register")
	public String register(
				BoardVO vo,
				RedirectAttributes rttr
			) throws Exception{
		
		String msg = bs.regist(vo);
		rttr.addFlashAttribute("msg", msg);
		return "redirect:/board/list";
	}
	
	@GetMapping("readView")
	public String readView(int bno, RedirectAttributes rttr) throws Exception{
		// 파라미터로 전달된 게시글 조회수 증가 후 상세보기 페이지 이동
		bs.updateViewCnt(bno);
		// return "redirect:/board/read?bno="+bno;
		rttr.addAttribute("bno",bno);
		return "redirect:/board/read";
	}
	
	// 상세보기
	@GetMapping("read")
	public String read(int bno, Model model) throws Exception{
		BoardVO board = bs.read(bno);
		model.addAttribute("board",board);
		return "board/read";
	}
	
	@GetMapping("modify")
	public String modify(int bno, Model model) throws Exception{
		model.addAttribute("board", bs.read(bno));
		return "board/modify";
	}
	
	@PostMapping("modify")
	public String modify(
				BoardVO board, // 수정할 게시글 정보
				RedirectAttributes rttr
			) throws Exception{
		String msg = bs.modify(board);
		rttr.addFlashAttribute("msg", msg);
		rttr.addAttribute("bno", board.getBno());
		return "redirect:/board/read";
	}
	
	@PostMapping("remove")
	public String remove(int bno, RedirectAttributes rttr) throws Exception{
		String msg = bs.remove(bno);
		rttr.addFlashAttribute("msg", msg);
		return "redirect:/board/list";
	}
	
}











