<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<link rel="stylesheet" href="${path}/resources/css/profile/updateProfile.css">

<!-- updateProfile.jsp -->

<div id="updateProfileModal">
    <div class="updateProfileContent">
        <span id="closeModal" class="close">&times;</span>
        
        <div class="updateHeader">
	        <p>프로필 수정</p>        
        </div>
        
        <hr/>
        
        <form action="updateProfile" id="createProfileForm" method="POST">
        	<input type="hidden" id="num" value="${currentProfile.num}">
        	<div class="updateBody">
	            <div class="updateImage">
		            <div>
		        		<p>프로필 이미지</p>
			            <!-- 이미지 선택하는 버튼 -->
		            	<input type="button" class="imageSelectBtn" value="이미지 변경">
		            </div>
		            <!-- 이미지 띄울 칸 -->
		            <div class="imageBox">
		            	<div>
				            <img src="${currentProfile.image}" id="usedImage" >		            	
		            	</div>
			            <p>사용 중</p>
		            </div>
			        <div class="imageBox">
			        	<div>
				            <img src="${src}" id="updateImage" >			        	
			        	</div>
			            <p>변경</p>
		            </div>
	            </div>
	            
        		<div class="updateName">
		            <p>프로필 이름</p>
		            <input type="text" id="name" name="name" required value="${currentProfile.name}"
		            placeholder="한글 또는 영어로 최대 12자" maxlength="12" pattern="[A-Za-z가-힣]{1,12}">        		
        		</div>
	            
	            <!-- 비밀번호는 선택적 -->
	            <div class="updatePass">
	            	<p>프로필 비밀번호</p>
		            <input type="password" id="pass" name="pass" value="${currentProfile.pass}"
		            placeholder="숫자 4자리 (필수 X)" maxlength="4" pattern="\d{4}">
	            </div>
        	</div>
        	<hr/>
        	
            <div class="updateFooter">
	            <button class="updateProfileBtn" >프로필 수정</button>            
            </div>
        </form>
    </div>
</div>

<%@ include file="/WEB-INF/views/profile/updateImage.jsp" %>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- sweetalert2 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<script>

	$(document).ready(function () {
		
		var updateProfile = $("#updateProfileModal");
		
		// 프로필 수정 모달 열기
		$(".profileUpdate").on("click", function () {
			updateProfile.show();
		});
		
		// 프로필 수정 모달 닫기
		$(".close").on("click", function() {
			updateProfile.hide();
		});
		
		// 프로필 수정
		$(".updateProfileBtn").on("click", function (e) {
			
			e.preventDefault(); // 폼의 기본 제출 동작 방지
			
			var num = $("#num").val();
			var usedImage = $("#usedImage").attr("src");
			var updateImage = $("#updateImage").attr("src");
			var name = $("#name").val();
			var pass = $("#pass").val();
			
			
			// 프로필 이미지를 변경하지 않는 경우
			if (updateImage == null || updateImage == '') {
				updateImage == usedImage;
			}
			
			$.ajax({
				url : "${path}/profile/updateProfile",
				type : "POST",
				data : {
					num : num,
					image : updateImage,
					name : name,
					pass : pass
				},
				success : function(response) {
					if (response) {
						Swal.fire({
						      icon: 'success',
						      title: '프로필 수정 성공',
						      text: '',
						    });
						// 성공 시 홈으로 리다이렉트
						window.location.href = "${path}/home";
					} else {
						Swal.fire(							
							'Error',
						    '프로필 수정 <b style ="color:red;">실패</b>',
						    ''
						);
					}
				},
				error : function () {
					Swal.fire(					
						'Error',
					    '<b style ="color:red;">오류 발생</b>',
					    '서버와의 통신 중 오류가 발생했습니다'
					);
				}
			});				
		});
		
	});


</script>