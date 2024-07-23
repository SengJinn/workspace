<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.naming.*, javax.sql.*" %>
<!-- 게시글 작성 완료 페이지     -->
<!-- 게시글 작성 요청 처리 -->
<%
	String board_name = request.getParameter("board_name");
	String board_pass = request.getParameter("board_pass");
	String board_title = request.getParameter("board_title");
	String board_content = request.getParameter("board_content");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	int result = 0;
	
	try{
		// Connection Pool 을 이용해서 Connection 객체 받기
		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/MySQLDB");
		conn = ds.getConnection();
		/*
		// 1. Driver class load
		Class.forName("com.mysql.cj.jdbc.Driver");
		// 2. database 연결 객체 생성
		conn = DriverManager.getConnection(
			"jdbc:mysql://localhost:3306/digital_jsp",
			"digital",
			"1234"
		);
		*/
		// 3. Query 작업 수행을 위한 객체 생성 
		// Statement, PreparedStatement, CallableStatement
		String sql = "INSERT INTO test_board VALUES(null,?,?,?,?,0,now())";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, board_name);
		pstmt.setString(2, board_pass);
		pstmt.setString(3, board_title);
		pstmt.setString(4, board_content);
		
		result = pstmt.executeUpdate();
		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		
		if(pstmt != null){
			pstmt.close();
		}
		
		if(conn != null){
			conn.close();
		}
	}
%>
<!-- 게시글 작성 결과 처리 -->
<%
	if(result == 1){
%>
	<script>
		alert("게시글 등록 성공!");
		location.href='board_list.jsp';
	</script>
<%		
	}else{
%>
	<script>
		alert('게시글 등록 실패');
		history.go(-1);
	</script>
<%		
	}
%>


























