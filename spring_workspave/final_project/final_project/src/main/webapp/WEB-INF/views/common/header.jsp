<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link href="https://fonts.googleapis.com/css2?family=Noto+Sans:wght@400;700&display=swap" rel="stylesheet">

<link rel="stylesheet" href="${path}/resources/css/header_style.css?after">

<c:set var="path" value="${pageContext.request.contextPath}" scope="session"/>

<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert2/11.7.2/sweetalert2.all.min.js"></script>

<link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />

<style>
.inner-menu-item2{
	margin-bottom: 8px;
}
</style>

<!-- iconbox 설정 -->
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

<!-- 네비게이션 바 -->
<header class="header">
  <a href="${path}/home"><img src="${path}/resources/images/logo.png" alt="Logo" class="header-logo"></a>
  <div class="left-array">
    <a href="#">드라마</a> 
    <a href="${path}/contents/movies/movies">영화</a>
    <a href="#">예능</a>
    <a href="#">다큐멘터리</a>
    <a href="${path}/board/board_list">커뮤니티</a>
  </div>
  <nav class="nav-links">
    <a href="${path}/search/search_main"><i class='bx bx-search'></i> 검색</a>
    
    <c:choose>
      
      	<c:when test="${!empty sessionScope.member}">
      		
      		<div class="profileMenu">
		    	<!-- 현재 내가 접속한 프로필 -->
		    	<c:if test="${!empty currentProfile}">
				<div class="profileMenu">
				    <div class="currentProfile">
				        <img src="${currentProfile.image}" class="currentImg">
				        <span class="currentName" style="color: #fff">${currentProfile.name} 님</span>
				    </div>
				
				    <!-- 드롭다운 메뉴 -->
				    <div class="inner-menu">
				        <ul>
				            <li class="inner-menu-item1"><a href="${path}/profile/profile?email=${currentProfile.email}">프로필 변경</a></li>
				            <li class="inner-menu-item2"><a href="${path}/profile/profileEdit?num=${currentProfile.num}">프로필 수정</a></li>
				            <li class="inner-menu-item3"><a href="${path}/membership/membership?email=${currentProfile.email}">My Page</a></li>
				        </ul>
				    </div>
				</div>
	      		</c:if>
	      		
	      		<c:if test="${empty currentProfile}">
	      		<a href="${path}/member/myPage?email=${sessionScope.member.email}">${member.email}님의 마이페이지</a>
	      		</c:if>
	      		
      		</div>
      		
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
var confirmLogout = function(msg, title) {
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
	confirmLogout('정말 로그아웃 하시겠습니까?', '로그아웃 확인');
}
</script>