package com.bitc.common.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

public class CheckTokenInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		if(request.getMethod().equalsIgnoreCase("POST")) {
			HttpSession session  = request.getSession();
			System.out.println("sessionToken");
			
			String requestToken = request.getParameter("csrf_token");
			String sessionToken = (String)session.getAttribute("csrf_token");
			
			if(requestToken == null || requestToken.equals("") || !requestToken.equals(sessionToken)) {
				response.setContentType("text/html;charset=utf-8");
				PrintWriter pw = response.getWriter();
				pw.print("<script>");
				pw.print("alert('잘못된 접근입니다. 이자시가!');");
				pw.print("history.go(-1);");
				pw.print("</script>");
				return false;
			}
		}
		return true;
	}
	
}










