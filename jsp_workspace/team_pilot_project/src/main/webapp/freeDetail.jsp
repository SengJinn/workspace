<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*, utils.*"%>
<%@ include file="header.jsp"%>
<%@ page import="java.sql.*, utils.JDBCUtil"%>
<jsp:useBean id="free" class="vo.FreeWriteVO" />
<%
String paramNum = request.getParameter("num");

Connection conn = JDBCUtil.getConnection();
PreparedStatement pstmt = null;

try {
	int num = Integer.parseInt(paramNum);
	String sql = "SELECT * FROM freewrite WHERE num = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1, num);

	ResultSet rs = pstmt.executeQuery();

	if (rs.next()) {
		System.out.println("있음");
		free.setNum(rs.getInt(1));
		free.setTitle(rs.getString(2));
		free.setGuestName(rs.getString(3));
		free.setCheckNumber(rs.getString(4));
		free.setMessage(rs.getString(5));
		free.setWriteDate(rs.getTimestamp(6));
		/*
		num INT PRIMARY KEY AUTO_INCREMENT COMMENT '게시글 번호',
		title VARCHAR(20) NOT NULL COMMENT '게시글 제목',
		guestName VARCHAR(20) NOT NULL COMMENT '게시글 작성자',
		checkNumber VARCHAR(30) NOT NULL COMMENT '게시글 확인용 번호',
		message TEXT COMMENT '게시글 내용 메시지',
		writeDate DATE NOT NULL COMMENT '게시글 작성 날짜'
		*/
	}

} catch (Exception e) {

} finally {
	JDBCUtil.close(pstmt, conn);
}
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${param.num}번째 게시물</title>
<style>
table {
	margin: auto;
}


.message {
	border: 1.5px rgb(245, 212, 46) solid;
	width: 500px;
	height: 400px;
	border-radius: 5px;
	padding-left: 10px;
	padding-top: 10px;
	resize: none;
}

.header {
	height: 30px;
}

input[type="submit"] {
	width: 100px;
	height: 40px;
	font-size: 15px;
	border: 0;
	outline: 1.5px rgb(255, 187, 0) solid;
	border-radius: 5px;
	padding-left: 10px;
	background-color: rgb(245, 212, 46);
}

.bt2{
	text-align:center;
}


</style>
</head>
<body>
	<table>
		<tr>
			<td><h2>게시글</h2></td>
		</tr>
		<tr>
			<td class="header">제목</td>
			<td>
				<jsp:getProperty name="free" property="title"/>
			</td>
		</tr>
		<tr>
			<td class="header">작성자</td>
			<td>
				<jsp:getProperty name="free" property="guestName"/>
			</td>
		</tr>
		<tr>
			<td class="header">작성일</td>
			<td>
				<jsp:getProperty name="free" property="writeDate"/>
			</td>
		</tr>
		<tr>
			<td class="header">내용</td>
			<td class="message">
				<pre><%=free.getMessage()%></pre>
			</td>
		</tr>
		<tr>
			<td class="bt2" colspan="2">
				<a href="free.jsp">[목록]</a>
				&nbsp;|&nbsp;
				<a href="freeDetail_update.jsp?num=${free.num}">[수정]</a>
				&nbsp;|&nbsp;
				<a href="freeDetail_delete.jsp?num=${free.num}">[삭제]</a>
			</td>
		</tr>
	</table>
</body>
</html>

<%@ include file="footer.jsp"%>