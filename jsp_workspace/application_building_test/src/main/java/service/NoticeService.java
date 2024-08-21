package service;

import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.http.HttpServletRequest;
import VO.NoticeVO;

public interface NoticeService {
	
	ArrayList<NoticeVO> noticeAllList();

	boolean noticeWrite(HttpServletRequest request);

	List<NoticeVO> noticeList(HttpServletRequest request);

	NoticeVO noticeDetail(HttpServletRequest request);

	boolean noticeUpdate(HttpServletRequest request);

	boolean noticeDelete(HttpServletRequest request);
	
	List<NoticeVO> search(HttpServletRequest request);
	
}


