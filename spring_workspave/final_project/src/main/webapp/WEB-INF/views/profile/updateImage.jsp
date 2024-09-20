<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<link rel="stylesheet" href="${path}/resources/css/profile/imageSelect.css">

<!-- updateImage.jsp -->


<div id="updateImageModal">
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

<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script>

	$(document).ready(function () {
		
		var imageSelect = $("#updateImageModal");
		
		// 이미지 변경 모달 열기
		$(".imageSelectBtn").on("click", function () {
			$("#updateImageModal").show();
		});
		
		// 외부 클릭 시 이미지 변경 모달 닫기
		$(window).on("click", function(event) {
			if ($(event.target).is(imageSelect)) {
				imageSelect.hide();
			}
		});
		
		// 이미지 선택 시 updateProfile.jsp에 선택한 이미지 띄우기
		$(document).on("click", ".selectBody img", function () {
			var imageUrl = $(this).attr("src");
			
			console.log(imageUrl);
			
			// 선택한 이미지 updateProfile.jsp에 전달
			$("#updateImage").val(imageUrl);
			// 변수 이름 "src"
			$("#updateImage", window.parent.document).attr("src", imageUrl).show();
			
			imageSelect.hide();
		});
	});

</script>