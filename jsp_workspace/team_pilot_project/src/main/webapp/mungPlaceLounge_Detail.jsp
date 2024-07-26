<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*, utils.*"%>

<jsp:useBean id="lounge" class="vo.mungPlaceLoungeVO" />

<%
String paramNum = request.getParameter("num");

Connection conn = JDBCUtil.getConnection();
PreparedStatement pstmt = null;

try {
	int num = Integer.parseInt(paramNum);
	String sql = "SELECT * FROM place_lounge WHERE num = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1, num);

	ResultSet rs = pstmt.executeQuery();

	if (rs.next()) {
		System.out.println("있음");
		lounge.setNum(rs.getInt(1));
		lounge.setTitle(rs.getString(2));
		lounge.setGuestName(rs.getString(3));
		lounge.setCheckNumber(rs.getString(4));
		lounge.setMessage(rs.getString(5));
		lounge.setWriteDate(rs.getDate(6));
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
/* table {
	margin: auto;
} */

.placeDetailBody{
	 background-color: rgb(255, 246, 189);
	  font-family: "Noto Sans KR", sans-serif;
}

.placeDetailDiv{
		margin:auto;
        width: 700px;
        background-color: white;
        border-radius: 20px;
        padding: 30px;
}


table {
	margin: auto;
}

.underbar{
	border-bottom: 1px solid lightgray;
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

.btg {
    width: 100px;
    height: 40px;
    font-size: 15px;
    border: 0;
    border-radius: 5px;
    padding-left: 10px;
    background-color: rgb(245, 212, 46);
    color: white;
}

.btg:hover {
    background-color: ffdc72;
    cursor: pointer;
}

.btg:active {
    transform: scale(0.95);
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    background-color: FFCC00;
    transition: 0.2s;
}


	/* mungPlaceIndex.jsp 공통 style */
	.mungPlace{
        margin: 0;
        padding: 0;
        display: flex;
        flex-direction: column;
        height: 100vh;
    }
    .content {
        display: flex;
        flex: 1;
    }
    .board-container {
        width: 50%;
        overflow-y: auto;
        background-color: rgb(255,246,189);
        padding: 20px;
    }
    .map-container {
        width: 50%;
        height: 100%;
        position: relative;
    }


</style>
</head>
<body class="placeDetailBody mungPlace">
 <br/><br/>
<div class="placeDetailDiv">
    	<table>
		<tr>
			<td><h2>게시글</h2></td>
		</tr>
		<tr>
			<td class="header underbar">제목</td>
			<td colspan="2" class="underbar">
				<jsp:getProperty name="lounge" property="title"/>
			</td>
		</tr>
		<tr>
			<td class="header underbar">작성자</td>
			<td class= "underbar"colspan="2">
				<jsp:getProperty name="lounge" property="guestName"/>
			</td>
		</tr>
		<tr>
			<td class="header underbar">작성일</td>
			<td colspan="2">
				<jsp:getProperty name="lounge" property="writeDate"/>
			</td>
		</tr>
		<tr>
			<td class="header">내용</td>
			<td class="message" colspan="2">
				<pre><%=lounge.getMessage()%></pre>
			</td>
		</tr>
		<tr><td></td></tr>
		<tr>
			<td>
			<button class="btg" onclick="location.href='mungPlaceLounge_Detail.jsp?num=${lounge.num - 1}'">이전글</button>
			</td>
			<td style="text-align:right">
			<button class="btg" onclick="location.href='mungPlaceLounge.jsp'">목록</button>
			</td>
			<td style="text-align:right">
			<button class="btg" onclick="location.href='mungPlaceLounge_Detail.jsp?num=${lounge.num + 1}'">다음글</button>
			</td>
		</tr>
		<tr><td></td></tr>
	</table>
</div>	
</body>
</html>
