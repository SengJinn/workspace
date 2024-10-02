<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<c:set var="path" value="${pageContext.request.contextPath}" scope="session"/>

<link rel="stylesheet" href="${path}/resources/css/footer_style.css"> 
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans:wght@400;700&display=swap" rel="stylesheet">

  <!-- 푸터 -->
  <footer class="footer">
    <p>&copy; 2024 viviview All right reserved</p>
    <p><a href="${path}/contents/privacy_policy">개인정보처리방침</a> | <a href="${path}/contents/map">찾아오시는 길</a></p>
    <p>- COMPANY : VVV(viviview) -</p>
    <p>Tel. 010-1234-5678 | viviview@gmail.com</p>
  </footer>