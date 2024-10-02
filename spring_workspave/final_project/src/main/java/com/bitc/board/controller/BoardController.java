package com.bitc.board.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bitc.board.service.BoardService;
import com.bitc.board.vo.BoardVO;
import com.bitc.common.util.Criteria;
import com.bitc.common.util.PageMaker;
import com.bitc.common.util.SearchCriteria;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("board/")
@RequiredArgsConstructor
public class BoardController {

	private final BoardService bs;

	// 게시판 목록
	@GetMapping("board_list")
	public String list(SearchCriteria cri, Model model) throws Exception{
		// Criteria 요청 페이지 번호, 출력 게시물 개수, 검색 시작 인덱스 번호
		Map<String, Object> map = bs.list(cri);
		// model.addAttribute("list", map.get("list"));
		model.addAllAttributes(map);
		return "board/board_list";
	}
	
	// 게시판 상세보기
	@GetMapping("board_detail")
	public void board_detail(int b_num, Model model) throws Exception {
		BoardVO vo = bs.read(b_num);
		model.addAttribute("board", vo);
	}

	// 조회수 증가
	@GetMapping("detail")
	public String detail_cnt(int b_num, RedirectAttributes rttr) throws Exception {
		bs.updateCnt(b_num);
		rttr.addAttribute("b_num", b_num);
		return "redirect:/board/board_detail";
	}

	// 게시글 작성 페이지
	@GetMapping("board_write")
	public void board_write() throws Exception {
		// ${path}/board/board_write.jsp
	}

	// 게시글 작성 완료시
	@PostMapping("board_write")
	public String board_write(BoardVO board, HttpSession session) throws Exception {
		String message = bs.regist(board);
		session.setAttribute("msg", message);
		return "redirect:/board/board_list";
	}

	// 게시글 수정 페이지
	@GetMapping("board_modify")
	public void modify(int b_num, Model model) throws Exception {
		BoardVO vo = bs.read(b_num);
		model.addAttribute(vo);
	}

	// 게시글 수정 완료
	@PostMapping("board_modify")
	public String modify(BoardVO vo, RedirectAttributes rttr) throws Exception {
		String result = bs.modify(vo);
		rttr.addAttribute("b_num", vo.getB_num());
		rttr.addFlashAttribute("msg", result);
		return "redirect:/board/board_detail";
	}

	// 게시글 삭제
	@GetMapping("delete")
	public String remove(int b_num, RedirectAttributes rttr) throws Exception {
		String msg = bs.remove(b_num);
		rttr.addFlashAttribute("msg", msg);
		return "redirect:/board/board_list";
	}
	

} // end BoardController class








