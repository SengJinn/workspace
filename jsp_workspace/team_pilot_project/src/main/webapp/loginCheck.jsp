<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!-- loginCheck.jsp -->
<%@ include file="connection.jsp" %>
<%
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	// 사용할 쿼리 질의 객체 선택
	String statement = request.getParameter("stmt");
	// stmt, pstmt, cstmt
	
	Statement stmt = null;
	PreparedStatement pstmt = null;
	CallableStatement cstmt = null;
	ResultSet rs = null;

	// SELECT * FROM member WHERE id = 'id001' AND pass = 'pw001';
	
	if(statement.equals("stmt")){
		out.println("Statement <br/>");
		stmt = conn.createStatement();
		String sql = "SELECT * FROM mung_member WHERE id = '"+id+"' AND pass = '"+pass+"'";
		System.out.println(sql);
		rs = stmt.executeQuery(sql);
		
	}else if(statement.equals("pstmt")){
		out.println("PreparedStatement <br/>");
		
		String sql = "SELECT * FROM mung_member WHERE id = ? AND pass = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, pass);
		rs = pstmt.executeQuery();
		
	}else if(statement.equals("cstmt")){
		out.println("CallableStatement <br/>");
		String sql = "call loginCheck(?, ?)";
		cstmt = conn.prepareCall(sql);
		cstmt.setString(1, id);
		cstmt.setString(2, pass);
		rs = cstmt.executeQuery();
	}
	
	// ResultSet 객체가 정상적으로 생성이 됐고 검색된 행이 존재 할때
	if(rs != null && rs.next()){
		int num = rs.getInt("num");
		String rsId = rs.getString(2);
		String rsPass = rs.getString(3);
		String rsName = rs.getString("name");
		String rsEmail = rs.getString(5);
		String rsJoinDate = rs.getString(6);
		
		out.println("num : " + num + "<br/>");
		out.println("rsId : " + rsId + "<br/>");
		out.println("rsPass : " + rsPass + "<br/>");
		out.println("rsName : " + rsName + "<br/>");
		out.println("rsAddr : " + rsEmail + "<br/>");
		
	}else{ 
%>
		alert("등록된 회원정보가 없습니다. 회원가입하세요.");
		location.href="join.jsp";
<%
	}

	if(rs != null) rs.close();
	if(stmt != null) stmt.close();
	if(conn != null) conn.close();
%>
<h4><a href="login.jsp">로그인 페이지</a></h4>
