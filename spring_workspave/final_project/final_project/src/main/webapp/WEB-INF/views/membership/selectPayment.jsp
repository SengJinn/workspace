<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!-- selectPayment.jsp -->

<div id="selectPayModal" class="selectPayModal">
    <div class="selectPayModalcontent">
        <span id="closeModal" class="close">&times;</span>
        
        <div class="modalHeader">
	        <p>결제 수단 선택</p>        
        </div>
        
        <hr/>
        
        <form action="create" id="createProfileForm" method="POST">
        
        	<div class="modalBody">
	            <div class="createImage">
		            <div>
		        		<p>프로필 이미지</p>
			            <!-- 이미지 선택하는 버튼 -->
		            	<input type="button" class="imageSelectBtn" value="이미지 선택">
		            </div>
		            <!-- 이미지 띄울 칸 -->
		            <div class="imageBox">
			            <img src="${src}" id="selectedImage" >
			            <input type="hidden" name="image" id="image" required value="${src}">
		            </div>
	            </div>
	            
        		<div class="createName">
		            <p>프로필 이름</p>
		            <input type="text" id="name" name="name" required
		            placeholder="한글 또는 영어로 최대 12자" maxlength="12" pattern="[A-Za-z가-힣]{1,12}">        		
        		</div>
	            
	            <!-- 비밀번호는 선택적 -->
	            <div class="createPass">
	            	<p>프로필 비밀번호</p>
		            <input type="password" id="pass" name="pass" 
		            placeholder="숫자 4자리 (필수 X)" maxlength="4" pattern="\d{4}">
	            </div>
        	</div>
        	<hr/>
        	
            <div class="modalFooter">
	            <button class="createProfileBtn" >프로필 생성</button>            
            </div>
        </form>
    </div>
</div>

<!-- jQuery -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- 포트원 -->
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>

<script>
	$(document).ready(function(e) {
		
		e.preventDefault();
	});
</script>