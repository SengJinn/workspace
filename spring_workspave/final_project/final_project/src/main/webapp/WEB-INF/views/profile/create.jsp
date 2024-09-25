<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<link rel="stylesheet" href="${path}/resources/css/profile/create.css">

<!-- create.jsp -->

<div id="createProfileModal" class="createModal">
    <div class="createModalcontent">
        <span id="closeModal" class="close">&times;</span>
        
        <div class="modalHeader">
	        <p>프로필 생성</p>        
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

<%@ include file="/WEB-INF/views/profile/imageSelect.jsp" %>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script>

	// 유효성 검사
	$(document).ready(function () {
		function valid() {
			// 이미지를 선택했는지 확인
			var isSelectedImage = $("#selectedImage").attr("src") !== "";
			// 이름 길이 확인
			var isName = $("#name").val().length > 0 && $("#name").val().length <= 12;
			// 비밀번호 유효성 검사
			var passVal = $("#pass").val();
			var isPass = passVal === "" || (passVal.length === 4 && /^\d{4}$/.test(passVal));
			
			// 모든 조건이 충족된다면 버튼 활성화
			if (isSelectedImage && isName && isPass) {
				$(".createProfileBtn").css({
					"background": "#ffa200",
					"cursor": "pointer"
				}).prop("disabled", false);
			} else {
				$(".createProfileBtn").css({
					"background": "#868e96",
					"cursor": "not-allowed"
				}).prop("disabled", true);
			}
		}
		
		// 입력값이 변경될 때마다 유효성 검사
		$("#name").on("input", valid);
		$("#pass").on("input", valid);
		
		// 이미지가 로드될 때 유효성 검사
		$("#selectedImage").on("load", valid);
		
		valid();
		
		
		// 프로필 생성 버튼 클릭 시 AJAX 요청
		$(".createProfileBtn").on("click", function (e) {
			
			e.preventDefault();
			
			var name = $("#name").val();
		    var image = $("#image").val();
		    var pass = $("#pass").val();

			console.log("Create Profile Button Clicked");
		    $.ajax({
		        url: '${path}/profile/create',
		        type: 'POST',
		        data: {
		            name: name,
		            image: image,
		            pass: pass
		        },
		        success: function(response) {
		            // 프로필 생성 성공 후 프로필 목록 갱신
		            location.reload();
		        },
		        error: function(xhr, status, error) {
		        	console.log("XHR:", xhr);
		            console.log("Status:", status);
		            console.log("Error:", error);
		            alert("프로필 생성에 실패했습니다. 다시 시도해 주세요.");
		        }
		    });            
		});
		
		
	});
	
</script>