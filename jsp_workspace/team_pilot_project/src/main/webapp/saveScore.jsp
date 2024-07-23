<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    String username = request.getParameter("username");
    int score = Integer.parseInt(request.getParameter("score"));

    String url = "jdbc:mysql://10.100.205.157:3306/mung_project";
    String dbUser = "mung_admin";
    String dbPassword = "1234";

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url, dbUser, dbPassword);
        String sql = "INSERT INTO scores (username, score) VALUES (?, ?)";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, username);
        pstmt.setInt(2, score);
        pstmt.executeUpdate();
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
    }
%>
<html>
<head>
    <title>Score Saved</title>
</head>
<body>
    <h1>Score Saved Successfully!</h1>
</body>
</html>