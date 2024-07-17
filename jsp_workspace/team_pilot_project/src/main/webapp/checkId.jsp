<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*, vo.MungMemberVO" %>
<%
    String id = request.getParameter("id");

    // 나중에 DB 연동 시 SQL 쿼리로 대체될 부분
    List<MungMemberVO> memberList = (List<MungMemberVO>)application.getAttribute("memberList");
    
    boolean isCheck = false;
    
    if (memberList != null) {
        for (MungMemberVO m : memberList) {
            if (m.getId().equals(id)) {
                isCheck = true;
                break;
            }
        }
    }

    String result = isCheck ? "이미 사용중인 아이디입니다." : "사용 가능한 아이디입니다.";
    response.setContentType("text/plain; charset=UTF-8");
    response.getWriter().write(result);
%>