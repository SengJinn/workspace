<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!-- connection.jsp -->
<%@ page import="java.sql.*" %>
<%
	Connection conn = null;

	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection(
			"jdbc:mysql://10.100.205.157:3306/mung_project",
			"mung_admin",
			"1234"
		);
	}catch(Exception e){
%>
	<script>
		alert('DB 연결에 문제가 있습니다.');
		history.back();
	</script>
<%		
		if(conn != null){
			conn.close();
		}
		return;
	}
%>
</html>