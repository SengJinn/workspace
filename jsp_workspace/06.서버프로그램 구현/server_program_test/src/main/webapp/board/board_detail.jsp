<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.sql.*, util.JDBCUtil"%>
<jsp:useBean id="board" class="vo.TestBoardVO" />

<%
String paramNum = request.getParameter("board_num");

//게시글 조회 수 증가 처리
if (paramNum != null && !paramNum.isEmpty()) {
 
Connection conn = JDBCUtil.getConnection();
PreparedStatement pstmt = null;

try {
	
	int board_num = Integer.parseInt(paramNum);
	
    // 조회수 증가 시키기(되나?)
    String updateSql = "UPDATE test_board SET board_readcount = board_readcount + 1 WHERE board_num = ?";
    pstmt = conn.prepareStatement(updateSql);
    pstmt.setInt(1, board_num);
    
    pstmt.executeUpdate();
    
    
	String sql = "SELECT * FROM test_board WHERE board_num = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1, board_num);

	ResultSet rs = pstmt.executeQuery();

	if (rs.next()) {
		board.setBoard_num(rs.getInt(1));
		board.setBoard_name(rs.getString(2));
		board.setBoard_pass(rs.getString(3));
		board.setBoard_title(rs.getString(4));
		board.setBoard_content(rs.getString(5));
		board.setBoard_readcount(rs.getInt(6));
		board.setBoard_date(rs.getTimestamp(6));
		/*
		board_num INT PRIMARY KEY auto_increment,	-- 게시글 번호
		board_name VARCHAR(20) NOT NULL, 			-- 게시글 작성자
		board_pass VARCHAR(50) NOT NULL, 			-- 게시글 비밀번호
		board_title VARCHAR(50) NOT NULL, 			-- 게시글 제목
		board_content TEXT NOT NULL, 				-- 게시글 내용
		board_readcount INT default 0,				-- 게시글 조회수
		board_date TIMESTAMP default now()
		
		UPDATE test_board SET board_readcount = board_readcount + 1 
		WHERE board_num = 1;
		*/
	}

} catch (Exception e) {

} finally {
	JDBCUtil.close(pstmt, conn);
	}
}
%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>게시물 상세내용</h1>
	<table>
		<tr>
			<td>작성자</td>
			<td> <jsp:getProperty name="board" property="board_name"/> </td>
		</tr>
		<tr>
			<td>제목</td>
			<td> <jsp:getProperty name="board" property="board_title"/> </td>
		</tr>
		<tr>
			<td>내용</td>
			<td>
				<textarea readonly cols=40 rows=10> <%=board.getBoard_content()%> </textarea>
			</td>
		</tr>
		<tr>
			<td colspan=2>
				<a href="board_update.jsp?board_num=<%=paramNum%>">[수정]</a>
				<a href="board_delete.jsp?board_num=<%=paramNum%>">[삭제]</a>
				<a href="board_list.jsp">[목록]</a>
			</td>
		</tr>
	</table>
</body>
</html>