package com.bitc.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;

import com.bitc.board.service.BoardService;
import com.bitc.board.vo.BoardVO;
import com.bitc.user.vo.UserVO;

/**
 * Authorization : 권한
 * Authentication : 인증
 */
public class AuthorizationInterceptor implements HandlerInterceptor {
	
	@Autowired
	private BoardService bs;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("AuthorizationInterceptor preHandle START");
		
		HttpSession session = request.getSession();
		Object user = session.getAttribute("userInfo");
		
		String contextPath = request.getContextPath();
		
		if(user == null) {
			response.sendRedirect(contextPath+"/user/login");
			return false;
		}else {
			// 로그인이 되어 있더라도 요청한 사용자가 게시글 소유자 인지 확인
			String num = request.getParameter("bno");
			
			if(num != null && !num.trim().equals("")) {
				int bno = Integer.parseInt(num);
				BoardVO board = bs.read(bno);
				UserVO userVO = (UserVO)user;
				if(board.getU_no() == userVO.getU_no()) {
					return true;
				}else {
					response.sendError(403,"권한 불충분");
					return false;
				}
			}
		}
		
		System.out.println("AuthorizationInterceptor preHandle END");
		return true;
	}
	
	
	
}





