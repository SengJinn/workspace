<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<link rel="stylesheet" href="${path}/resources/css/profile/deleteProfile.css">

<!-- profileDelete.jsp -->


<div id="deleteProfileModal">
    <div class="deleteProfileContent">
    	<span id="closeModal" class="close">&times;</span>
    
        <div class="deleteHeader">
	        <p>프로필 삭제</p>
        </div>
        
        <hr/>
        
        <form action="deleteProfile" method="POST" >
	        <div class="deleteBody">
		    	<img class="deleteImage" src="${currentProfile.image}" />
		    	<p class="deleteName">${currentProfile.name}</p>
		    	<!-- 비밀번호가 있다면 아이콘 표시 -->
		    	<c:if test="${!empty currentProfile.pass}">
		    		<i class='bx bxs-lock-alt'></i>
		    	</c:if>
		    	<input type="hidden" id="deleteNum" name="num" value="${currentProfile.num}" >
		    	<input type="hidden" id="deleteEmail" name="email" value="${currentProfile.email}" >
		    	<input type="hidden" id="deletePass" value="${currentProfile.pass}" >
		    </div>
        </form>
	    
	    <div class="deleteFooter">
	    	<button class="deleteProfileBtn" >프로필 삭제</button>            
        </div>
	    
    </div>
</div>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- sweetalert2 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<script>
	
	$(document).ready(function () {
		
		var deleteProfile = $("#deleteProfileModal");
		
		// 프로필 삭제 모달 열기
		$(".profileDelete").on("click", function() {
			console.log("Delete Profile Click !");
			deleteProfile.show();
		});
		
		// 프로필 삭제 모달 닫기
		$(".close").on("click", function() {
			console.log("Close Modal");
			deleteProfile.hide();
		});
		
		// 외부 클릭 시 프로필 삭제 모달 닫기
		$(window).on("click", function(event) {
			if ($(event.target).is(deleteProfile)) {
				deleteProfile.hide();
			}
		});
		
		// 삭제 버튼 누르면 sweetalert로 진짜 삭제할거냐고 물어고보 비밀번호 있으면 비번치고 없으면 바로 삭제
		$(".deleteProfileBtn").on("click", async function () {
		    var pass = $("#deletePass").val();
		    var num = $("#deleteNum").val();
		    var email = $("#deleteEmail").val();
		    
		    if (pass) {
		        // 비밀번호가 있을 때 비밀번호 입력 창을 표시
		        const { value: enteredPass } = await Swal.fire({
		            title: '프로필 비밀번호를 입력하세요.',
		            input: 'password',
		            inputPlaceholder: '4자리 숫자',
		            inputAttributes: {
		                maxlength: 4,
		                autocapitalize: 'off',
		                autocorrect: 'off'
		            },
		            showCancelButton: true
		        });
		        
		        if (enteredPass) {
		            if (enteredPass === pass) {
		                Swal.fire("비밀번호가 일치합니다!", "", "success").then(() => {
		                    // AJAX로 서버에 프로필 삭제 요청
		                    $.ajax({
		                        url: "${path}/profile/profileDelete",
		                        type: "POST",
		                        data: { 
		                            num: num,
		                            email: email
		                        },
		                        success: function(response) {
		                            if (response) {
		                                // 프로필 삭제 성공 시 profile 페이지로 이동
		                                window.location.href = '${path}/profile/profile';
		                            } else {
		                                alert("프로필 삭제에 실패했습니다.");
		                            }
		                        },
		                        error: function() {
		                            alert("서버와의 통신 중 오류가 발생했습니다.");
		                        }
		                    });
		                });
		            } else {
		                Swal.fire("비밀번호가 틀렸습니다!", "", "error");
		            }
		        }
		    } else {
		        // 비밀번호가 없을 때 삭제 확인 창을 표시
		        Swal.fire({
		            title: '프로필을 삭제 하시겠습니까?',
		            text: "",
		            icon: 'warning',
		            showCancelButton: true,
		            confirmButtonColor: '#3085d6',
		            cancelButtonColor: '#d33',
		            confirmButtonText: '삭제',
		            cancelButtonText: '취소',
		            reverseButtons: true
		        }).then((result) => {
		            if (result.isConfirmed) {
		                Swal.fire(
		                    '프로필이 삭제되었습니다.',
		                    '',
		                    'success'
		                ).then(() => {
		                    // AJAX로 서버에 프로필 삭제 요청
		                    $.ajax({
		                        url: "${path}/profile/profileDelete",
		                        type: "POST",
		                        data: { 
		                            num: num,
		                            email: email
		                        },
		                        success: function(response) {
		                            if (response) {
		                                // 프로필 삭제 성공 시 profile 페이지로 이동
		                                window.location.href = '${path}/profile/profile';
		                            } else {
		                                alert("프로필 삭제에 실패했습니다.");
		                            }
		                        },
		                        error: function() {
		                            alert("서버와의 통신 중 오류가 발생했습니다.");
		                        }
		                    });
		                });
		            }
		        });
		    }
		});		
		
		
	});
	
</script>