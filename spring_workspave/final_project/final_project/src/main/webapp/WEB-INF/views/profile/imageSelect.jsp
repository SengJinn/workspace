<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<link rel="stylesheet" href="${path}/resources/css/profile/imageSelect.css">

<!-- imageSelect.jsp -->


<div id="imageSelectModal">
    <div class="imageModalContent">
    
        <div class="selectHeader">
	        <p>프로필 이미지 선택<p>
        </div>
        
        <hr/>
        
        <div class="selectBody">
    		<img src="${path}/resources/img/profile/profile1.png" alt="profile1.png" >
    		<img src="${path}/resources/img/profile/profile2.png" alt="profile2.png" >
    		<img src="${path}/resources/img/profile/profile3.png" alt="profile3.png" >
    		<img src="${path}/resources/img/profile/profile4.png" alt="profile4.png" >
	    </div>
	    
    </div>
</div>