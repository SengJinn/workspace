<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>게시글 등록 페이지</h1>
	<%
		String title = request.getParameter("title");
		String guestName = request.getParameter("guestName");
		String checkNumber = request.getParameter("checkNumber");
		String message = request.getParameter("message");
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		// 처리 결과를 저장할 변수
		
		
		try{

		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/digital_jsp",	// 
				"digital",
				"1234"
			);
			out.println("DB 연결 완료" + conn);
			
			String sql = "INSERT INTO freewrite VALUES(null, ?, ?, ?, ?, now())";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setString(2, guestName);
			pstmt.setString(3, checkNumber);
			pstmt.setString(4, message);
			
			int result = pstmt.executeUpdate();
			
		
			
			out.println("<script>");
			out.println("alert('게시글 등록이 완료되었습니다.')");
			out.println("history.go(-2);");
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
	

</body>
</html>