<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Top Scores</title>
    <style>
        table {
            width: 50%;
            margin: auto;
            border-collapse: collapse;
        }
        th, td {
            padding: 10px;
            text-align: center;
            border: 1px solid #ddd;
        }
        th {
            background-color: #f4f4f4;
        }
    </style>
</head>
<body>
    <h1 style="text-align:center;">Top 3 Scores</h1>
    <table>
        <thead>
            <tr>
                <th>Rank</th>
                <th>Username</th>
                <th>Score</th>
                <th>Timestamp</th>
            </tr>
        </thead>
        <tbody>
            <%
                String url = "jdbc:mysql://10.100.205.157:3306/mung_project";		     	
                String dbUser = "mung_admin";
                String dbPassword = "1234";

                Connection conn = null;
                Statement stmt = null;
                ResultSet rs = null;

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection(url, dbUser, dbPassword);
                    String sql = "SELECT username, score, timestamp FROM scores ORDER BY score DESC, timestamp ASC LIMIT 3";
                    stmt = conn.createStatement();
                    rs = stmt.executeQuery(sql);

                    int rank = 1;
                    while (rs.next()) {
                        String username = rs.getString("username");
                        int score = rs.getInt("score");
                        Timestamp timestamp = rs.getTimestamp("timestamp");
            %>
            <tr>
                <td><%= rank %></td>
                <td><%= username %></td>
                <td><%= score %></td>
                <td><%= timestamp %></td>
            </tr>
            <%
                        rank++;
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                    if (stmt != null) try { stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
                    if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
                }
            %>
        </tbody>
    </table>
    <br/>
    <br/>
</body>
</html>

<%@ include file="footer.jsp" %>