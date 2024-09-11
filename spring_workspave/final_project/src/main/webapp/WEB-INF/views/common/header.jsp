<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel="stylesheet" href="${path}/resources/css/header_style.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans:wght@400;700&display=swap" rel="stylesheet">

<c:set var="path" value="${pageContext.request.contextPath}" scope="session"/>

<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert2/11.7.2/sweetalert2.all.min.js"></script>

<link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />

<style>
	 * {
    font-family: 'Noto Sans KR', sans-serif;
  }
  
  .header {
    position: fixed;
    top: 0;
    left: 0;
    right: 0;
    background-color: rgba(0, 0, 0, 0.8);
    padding: 20px;
    display: flex;
    align-items: center;
    z-index: 1000;
  }

  .header img {
    height: 50px;
  }

  .header .left-array {
    display: flex;
    gap: 30px;
    margin-left: 20px; /* 로고와 left-array 사이의 간격 추가 */
  }

  .left-array a{
    color: #e5e5e5;
    text-decoration: none;
    font-size: 18px;
  }

  .header .nav-links {
    display: flex;
    gap: 30px;
    margin-left: auto; /* 오른쪽으로 밀어내어 남은 공간을 차지하게 함 */
    align-items: center;
  }

  .header .nav-links a {
    color: #e5e5e5;
    text-decoration: none;
    font-size: 18px;
  }

  .header a:hover {
    text-decoration: underline;
  }

  i {
    color: #fff;
  }
  

  

</style>

<!-- iconbox 설정 -->
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

<!-- 네비게이션 바 -->
<header class="header">
  <a href="${path}/home"><img src="${path}/resources/images/logo.png" alt="Logo"></a>
  <div class="left-array">
    <a href="#">드라마</a> 
    <a href="${path}/contents/movies/movies">영화</a>
    <a href="#">예능</a>
    <a href="#">다큐멘터리</a>
    <a href="#">커뮤니티</a>
  </div>
  <nav class="nav-links">
    <a href="${path}/search/search_main"><i class='bx bx-search'></i> 검색</a>
    
    <c:choose>
      <c:when test="${!empty sessionScope.member}">
        <a href="#"><i class='bx bxs-user'></i> ${sessionScope.member.email}님</a>
        <a href="#" onclick="logout(); return false;">로그아웃</a>
      </c:when>
      <c:otherwise>
        <a href="${path}/member/login">로그인</a>
        <a href="${path}/member/join">회원가입</a>
      </c:otherwise>
    </c:choose>
  </nav>
</header>

<script>
var confirm = function(msg, title) {
    Swal.fire({
        title: title,
        text: msg,
        icon: 'warning',
        showCancelButton: true,
        confirmButtonText: '예',
        cancelButtonText: '아니오',
        confirmButtonColor: '#FFA200',
        cancelButtonColor: '#888'
    }).then((result) => {
        if (result.isConfirmed) {     
            Swal.fire({
                title: '',
                text: '로그아웃 되었습니다.',
                icon: 'success',
                showConfirmButton: false,
                timer: 1200 // 1.2초 후 자동으로 사라지게 설정
            }).then(() => {
                window.location.href = "${path}/member/logout";
            });
        } else {
            Swal.fire({
                title: '',
                text: '로그아웃을 취소했습니다.',
                icon: 'error',
                showConfirmButton: false,
                timer: 1000 // 1초 후 자동으로 사라지게 설정
            });
        }
    });
}

function logout() {
    confirm('정말 로그아웃 하시겠습니까?', '로그아웃 확인');
}
</script>
