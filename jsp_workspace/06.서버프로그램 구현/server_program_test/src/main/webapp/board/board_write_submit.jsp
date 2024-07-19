<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!-- 게시글 작성 완료 페이지     -->
<!-- 게시글 작성 요청 처리 -->
<%
		String board_name = request.getParameter("board_name");
		String board_pass = request.getParameter("board_pass");
		String board_title = request.getParameter("board_title");
		String board_content = request.getParameter("board_content");
		
		Connection conn = null;
		PreparedStatement pstmt = null;
%>
<!-- 게시글 작성 결과 처리 -->	
<%
		try{

		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/digital_jsp",	// 
				"digital",
				"1234"
			);
			out.println("DB 연결 완료" + conn);
			
			String sql = "INSERT INTO test_board VALUES(null, ?, ?, ?, ?, 0, now())";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, board_name);
			pstmt.setString(2, board_pass);
			pstmt.setString(3, board_title);
			pstmt.setString(4, board_content);
			
			int result = pstmt.executeUpdate();
		
			out.println("<script>");
			out.println("alert('게시글 등록이 완료되었습니다.')");
			out.println("location.href='board_list.jsp';");
			out.println("</script>");
			
		}catch(ClassNotFoundException e){
			out.println("Driver class를 찾을 수 없음<br/>");
		}catch(SQLException e){
			out.println("DB 연결 정보 오류 <br/>");
		}finally{
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
%>












