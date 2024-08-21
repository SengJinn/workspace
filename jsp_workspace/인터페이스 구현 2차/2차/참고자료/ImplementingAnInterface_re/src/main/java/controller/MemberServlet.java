package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("*.mc")
public class MemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String requestURI = request.getRequestURI();		// 전체 요청 경로
		String contextPath = request.getContextPath();		// 프로젝트(context) 경로
		String command = requestURI.substring(contextPath.length());
		
		String nextPage = null;
		if(command.equals("/login.mc")) {
			nextPage = "/member/login.jsp";
		}
		if(command.equals("/join.mc")) {
			nextPage = "/member/join.jsp";
		}
		
		if(nextPage != null) {
			RequestDispatcher rd = request.getRequestDispatcher(nextPage);
			rd.forward(request, response);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

