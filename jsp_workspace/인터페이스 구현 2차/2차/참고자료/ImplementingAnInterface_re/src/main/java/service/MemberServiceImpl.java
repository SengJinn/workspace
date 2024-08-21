package service;

import java.util.Base64;

import dao.MemberDAO;
import dao.MemberDAOImpl;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vo.MemberVO;

public class MemberServiceImpl implements MemberService {
	
	MemberDAO dao = new MemberDAOImpl();
	
    @Override
    public boolean memberJoin(HttpServletRequest request) {
    	
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		String name = request.getParameter("name");
    	

		
		MemberVO member = new MemberVO(id,pass,name);
		
		boolean isSuccess = dao.memberJoin(member);
		return isSuccess;
    }

    
    
    @Override
    public boolean memberLogin(HttpServletRequest request, HttpServletResponse response) {
    	
    	boolean isLogin = false;
    	
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		String login = request.getParameter("login");
		
		MemberVO member = dao.memberLogin(id, pass);
		
		if(member != null) {
			
			isLogin = true;
			HttpSession session = request.getSession();
			session.setAttribute("member", member);
			
			}
		
		if(login != null) {
			byte[] bytes = Base64.getEncoder().encode(id.getBytes());
			System.out.println("원본 아이디 : " + id);
			id = new String(bytes);
			System.out.println("encoding id : " + id);
			Cookie cookie = new Cookie("id", id);
			cookie.setMaxAge(60 * 60 * 24 * 7); 
			cookie.setPath("/"); 
			response.addCookie(cookie);
		}
		return isLogin; 

	}
    
    

    @Override
    public void logOut(HttpServletRequest request, HttpServletResponse response) {
    	
		HttpSession session = request.getSession();
		session.invalidate();
		
		Cookie cookie = new Cookie("id" , "");
		cookie.setMaxAge(0);
		cookie.setPath("/");
		response.addCookie(cookie);
	
    }
}
