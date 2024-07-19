<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.sql.*, util.*" %>
<%@ page import="vo.TestBoardVO" %>
<%@ page import="java.util.ArrayList.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>게시글 목록</h1>
	<a href="${path}/board/board_write.jsp">게시글 작성하러 가기</a>
	<table border=1>
		<tr>
			<th>글번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성시간</th>
			<th>조회수</th>
		</tr>
		
		
<%

		int pageCount = 10;
	
		int currentPage = 1; 
		
		String paramPage = request.getParameter("page");
		if(paramPage != null){
			currentPage = Integer.parseInt(paramPage);
		}
		
		int startRow = (currentPage - 1) * pageCount;
		
		String sql = "SELECT * FROM test_board "+ 
				     "ORDER BY board_num DESC limit ? , ?";
		Connection conn = JDBCUtil.getConnection();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, startRow);
		pstmt.setInt(2, pageCount);
		ResultSet rs = pstmt.executeQuery();

	while(rs.next()){
		int board_num = rs.getInt("board_num");
		String board_name = rs.getString("board_name");
		String board_pass = rs.getString("board_pass");
		String board_title = rs.getString("board_title");				
		String board_content = rs.getString("board_content"); 
		int board_readcount = rs.getInt("board_readcount");
		String board_date = rs.getString("board_date");
	
%>		
		<!-- 게시글 목록 -->
		<tr>
			<td><%=board_num%></td>
			<td><a href="board_detail.jsp?board_num=<%=board_num%>"><%=board_title%></a></td>
			<td><%=board_name%></td>
			<td><%=board_date%></td>
			<td><%=board_readcount%></td>
		</tr>

<% 
}  //end while	
JDBCUtil.close(rs, pstmt, conn);
%>		
</table>

	<br/>
	<br/>
	<br/>
	
<!-- 페이징 블럭 작성  -->
	
	<table border="0" cellspacing="0" cellpadding="0" style="width:100%;">
		<!-- 페이지 이동 번호 출력 -->
		<%
			sql = "SELECT count(*) AS cnt FROM test_board";		
			conn = JDBCUtil.getConnection();
			Statement stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			int totalCount = 0;
			if(rs.next()){
				totalCount = rs.getInt(1);
			}
			
			JDBCUtil.close(rs, stmt, conn);
			
			int maxPage = (totalCount - 1) / pageCount + 1;
			maxPage =  (int)(Math.ceil((double)totalCount / pageCount));

			int startPage = 0;
			int endPage = 0;
			int displayPageNum = 5;
			
			startPage = (currentPage - 1) / displayPageNum * displayPageNum + 1;

			endPage = startPage + (displayPageNum - 1);
			
			if(endPage > maxPage){
				endPage = maxPage;
			}
		%>
		
		<tr style="width:100%;">
			<th>
				<!-- 사용자가 요청한 출력된 현재 페이지가 1페이지가 아니면 출력 -->
				<%if(currentPage != 1){ %>
				<a href="board_list.jsp?page=1">[처음]</a>
				<%}%>
				<%if(startPage != 1){ %>
				<a href="board_list.jsp?page=<%=startPage - 1%>">[이전]</a>
				<%}%>
				<!-- 이동가능한 페이지 번호 출력 -->
				<%
					for(int i = startPage; i <= endPage; i++){
				%>
						<a href="board_list.jsp?page=<%=i%>">[<%=i%>]</a>
				<%		
					}
				%>
				<%if(endPage < maxPage) { %>
				<a href="board_list.jsp?page=<%=endPage + 1%>">[다음]</a>
				<%} %>
				<%if(currentPage < maxPage){ %>
				<!-- 마지막 페이지 이동 -->
				<a href="board_list.jsp?page=<%=maxPage%>">[마지막]</a>
				<%} %>
			</th>
		</tr>
	</table>	
</body>
</html>