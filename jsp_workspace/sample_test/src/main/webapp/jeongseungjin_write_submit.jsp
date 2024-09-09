<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Write Submit</title>

<%@ page import="java.sql.*, javax.naming.*, javax.sql.*" %>
</head>

<body>

<%
	String name = request.getParameter("name");
	String password = request.getParameter("password");
	String title = request.getParameter("title");
	String message = request.getParameter("message");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	int result = 0;
	
	try{

		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/MySQLDB");
		conn = ds.getConnection();

		String sql = "INSERT INTO board VALUES(null,?,?,?,?,now())";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setString(2, password);
		pstmt.setString(3, title);
		pstmt.setString(4, message);
		
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

<%
	if(result == 1){
%>
	<script>
		location.href='jeongseungjin_main.jsp';
	</script>
<%		
	}else{
%>
	<script>
		history.go(-1);
	</script>
<%		
	}
%>




</body>

