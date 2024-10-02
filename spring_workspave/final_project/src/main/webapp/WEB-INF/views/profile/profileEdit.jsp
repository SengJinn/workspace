<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>VIVIVIEW - 프로필 설정</title>

<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
<link rel="stylesheet" href="${path}/resources/css/profile/profileEdit.css">

</head>
<body>
<section>
    <div class="wrapper">
    	<div class="profileHeader">
    		<p class="profileEdit">프로필 수정</p>
    		<div class="loginInfo">
	    		<img src="${currentProfile.image}" />
    	        <p class="profileName">${currentProfile.name} 님</p>
    		</div>
    	</div>
    	<hr/>
        <div class="subject">프로필</div>
        <div class="profile">
            <div class="profileSection" style="cursor: pointer;">
                <div class="icon"><i class='bx bxs-user'></i></div>
                <div class="profileContent profileUpdate">
                    <p class="title">프로필 변경</p>
                    <p class="sub">프로필의 사진과 이름을 변경할 수 있습니다.</p>
                </div>
            </div>
            <hr />
            <div class="profileSection">
                <div class="icon"><i class='bx bxs-envelope'></i></div>
                <div class="profileContent">
                    <p class="title">이메일</p>
                    <p class="sub">${currentProfile.email}</p>
                </div>
            </div>
            <hr/>
            <div class="profileSection profileDelete" style="cursor: pointer;">
                <div class="icon"><i class='bx bxs-trash'></i></div>
                <div class="profileContent">
                    <p class="title">프로필 삭제</p>
                    <p class="sub">프로필 삭제</p>
                </div>
            </div>
        </div>
        
        <div class="subject">멤버십</div>
        <div class="membership">
        	<div class="membershipList">
        		<div class="membershipSection">
        			<div class="icon"><i class='bx bx-credit-card'></i></div>
        			<div class="membershipContent">
        				<p class="title">멤버십</p>
        				<p class="sub">${member.membershipType}</p>
        				<p class="sub">${member.paymentDate} ~ ${member.expiryDate}</p>
        			</div>
        		</div>
        		<hr/>
        		<div class="membershipSection">
        			<div class="icon"><i class='bx bxs-offer'></i></div>
        			<div class="membershipContent">
        				<p class="title">포인트</p>
        				<p class="sub">${member.point}</p>
        			</div>
        		</div>
        	</div>
        </div>

        <div class="subject">설정</div>
        <div class="optional">
            <div class="optionalList">
                <div class="optionalSection">
                    <div class="icon"><i class='bx bx-game'></i></div>
                    <div class="optionalContent">
                        <p class="title">언어</p>
                        <p class="sub">화면 표시 및 음성용 언어 설정</p>
                    </div>
                </div>
                <hr />
                <div class="optionalSection">
                    <div class="icon"><i class='bx bx-block'></i></div>
                    <div class="optionalContent">
                        <p class="title">시청 제한</p>
                        <p class="sub">관람등급 및 콘텐츠 제한 변경</p>
                    </div>
                </div>
                <hr />
                <div class="optionalSection">
                    <div class="icon"><i class='bx bx-text'></i></div>
                    <div class="optionalContent">
                        <p class="title">자막 표시 설정</p>
                        <p class="sub">자막 표시 방식 맞춤화</p>
                    </div>
                </div>
                <hr />
                <div class="optionalSection">
                    <div class="icon"><i class='bx bx-movie-play'></i></div>
                    <div class="optionalContent">
                        <p class="title">재생 설정</p>
                        <p class="sub">자동 재생, 오디오, 화질 설정</p>
                    </div>
                </div>
                <hr />
                <div class="optionalSection">
                    <div class="icon"><i class='bx bx-bell'></i></div>
                    <div class="optionalContent">
                        <p class="title">알림 설정</p>
                        <p class="sub">이메일, 문자, 푸시 알림 관리</p>
                    </div>
                </div>
                <hr />
                <div class="optionalSection">
                    <div class="icon"><i class='bx bxs-playlist'></i></div>
                    <div class="optionalContent">
                        <p class="title">시청 기록</p>
                        <p class="sub">시청 기록 및 평가 관리</p>
                    </div>
                </div>
                <hr />
                <div class="optionalSection">
                    <div class="icon"><i class='bx bx-shield-quarter'></i></div>
                    <div class="optionalContent">
                        <p class="title">개인 정보 및 데이터 설정</p>
                        <p class="sub">개인 정보 이용 관리</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
    
<%@ include file="/WEB-INF/views/profile/updateProfile.jsp" %>
<%@ include file="/WEB-INF/views/profile/deleteProfile.jsp" %>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

</body>

</html>
<%@ include file="../common/footer.jsp" %>
