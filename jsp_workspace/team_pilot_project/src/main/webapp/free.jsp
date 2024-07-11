<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ include file="header.jsp" %>
<%@ page import="vo.FreeWriteVO" %>
<%@ page import="java.util.ArrayList.*" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta .name="viewport" content="width=device-width, initial-scale=1.0">
<title>게시판</title>
<style>
    table {
        margin: auto;
        width: 800px;
        border-radius: 5px;
        border-collapse: collapse;
        border-top: none;
    }
    .header {
        background-color: rgb(255,246,189);
        text-align: center;
        border-top: 1px lightgray solid; 
        margin: 0px;
    }
    .table td, .table th {
        border-bottom: 1px lightgray solid; 
        height: 30px;
        font-size: 14px;
        
    }
    .num {
        width: 50px;
    }
    .title {
        width: 470px;
    }
    .body {
        text-align: center;
    }
    .body .title {
    	padding-left: 30px;
        text-align: left;
    }
    .body .title:hover {
        text-decoration-line: underline;
    }
    button {
        width: 100px;
        height: 40px;
        font-size: 15px;
        border: 0;
        outline: 1.5px rgb(255,187,0) solid;
        border-radius: 5px;
        padding-left: 10px;
        background-color: rgb(245,212,46);
    }
    button:active {
        width: 100px;
        height: 40px;
        font-size: 15px;
        border: 0;
        border-radius: 5px;
        outline: 1.5px rgb(27, 76, 155) solid;
        padding-left: 10px;
        background-color: rgb(68, 136, 244);
    }
</style>
<%@ page import="java.sql.*, utils.*" %>

</head>
<body>
<table class="table">
	<tr><td colspan="2"><h2>자유 게시판</h2></td></tr>
	    <tr class="header">
        <td class="num">번호</td>
        <td class="title">제목</td>
        <td>작성자</td>
        <td>작성날짜</td>
    </tr>
<%
	Connection conn = JDBCUtil.getConnection();
		
	String sql = "SELECT num, title, guestName, writeDate FROM freewrite ORDER BY num DESC";
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
	while(rs.next()){
		int num = rs.getInt("num");
		String title = rs.getString("title");				
		String guestName = rs.getString("guestName");
		String writeDate = rs.getString("writeDate");
%>
			<tr class="body">
				<td><%=num%></td>
				<td class="title"><a href="freeDetail.jsp?num=<%=num%>" style="text-decoration:none;color:black;"> <%=title %> </a></td> 
				<td><%=guestName %></td> 
				<td><%=writeDate %></td> 
			</tr>
<%
			} // end while
				
		JDBCUtil.close(rs, stmt, conn);
%>
</table>
<br>
<table>
    <tr>
        <td><button onclick="location.href='write.jsp'">글쓰기</button></td>
    </tr>
</table>
</body>
</html>
<%@ include file="footer.jsp" %>
