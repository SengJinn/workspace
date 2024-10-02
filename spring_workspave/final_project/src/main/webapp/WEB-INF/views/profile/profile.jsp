<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../common/header.jsp" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>VIVIVIEW - 프로필 선택</title>

<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
<link rel="stylesheet" href="${path}/resources/css/profile/profile.css">

</head>
<body>

<section>
    <div class="wrapper">
    	<div class="upperBox">
    		<p class="title">프로필 선택</p>
    		<p class="caution">시청할 프로필을 선택해주세요.</p>
    	</div>
    	<hr/>

    	<c:set var="maxProfiles" value="4"/> <!-- 기본 최대 프로필 개수 -->
    	<c:if test="${member.membershipStatus == '만료'}">
    	    <c:set var="maxProfiles" value="1"/>
    	</c:if>
    	<c:if test="${member.membershipStatus == '갱신' && member.membershipType == '광고형 스탠다드' || member.membershipType == '스탠다드'}">
    	    <c:set var="maxProfiles" value="2"/>
    	</c:if>

    	<div class="profileList">
	    	<!-- 프로필 목록 표시 -->
	    	<c:if test="${profiles != null && !profiles.isEmpty()}">
			    <c:forEach var="profile" items="${profiles}">
			        <div class="profiles">
			            <input type="hidden" class="num" value="${profile.num}">
			            <div class="profileCard">
			                <img src="${profile.image}" alt="Profile Image">
			            </div>
			            <div class="profileInfo">
			                <p class="profileName">${profile.name}</p>
			                <c:choose>
			                    <c:when test="${!empty profile.pass}">
			                        <div class="secure">
			                            <input type="hidden" class="pass" value="${profile.pass}">
			                            <p><i class='bx bxs-lock-alt'></i></p>
			                        </div>
			                    </c:when>
			                    <c:otherwise>
			                        <!-- 비밀번호 없으면 표시 안함 -->
			                    </c:otherwise>
			                </c:choose>
			            </div>
			        </div>
			    </c:forEach>
			</c:if>
	    	
	    	<!-- 생성 조건부 -->
	    	<c:choose>
		    	<c:when test="${fn:length(profiles) < maxProfiles}">
			    	<div class="createProfile">
		            	<div class="profileCard">
		            		<img src="${path}/resources/img/profile/profileAdd.png">
		            	</div>
		            	<div class="profileInfo">
		                	<p class="profileName">프로필 생성</p>
		                </div>
		            </div>
	            </c:when>
	            <c:otherwise>
	            	<!-- 프로필이 최대 개수 이상일 때는 생성 버튼 숨김 -->
	            </c:otherwise>
            </c:choose>
    	</div>
    </div>
</section>

<%@ include file="/WEB-INF/views/profile/create.jsp" %>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- sweetalert2 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<script>
	$(document).ready(function() {
		// 모달 관련 요소
		var createBtn = $(".createProfile");		// 프로필 생성창 버튼
		var create = $("#createProfileModal");		// create 모달창
		
		var imageBtn = $(".imageSelectBtn");		// 이미지 선택 버튼
		var imageSelect = $("#imageSelectModal");	// imageSelect 모달창
		
		var span = $("#closeModal");				// 닫기 버튼
		var form = $("#createProfileForm");
		
		
		// create.jsp 제어하는 부분
		// create 모달 열기
		createBtn.on("click", function() {
			console.log("Create profile button clicked!");
			create.show();
		});
		
		// create 모달 닫기 및 초기화
		span.on("click", function() {
			// 모달 닫기
			create.hide();
			
			// 입력값 초기화
			$("#selectedImage").attr("src", "").hide(); // 이미지 초기화
	        $("#name").val("");
	        $("#pass").val("");
		});
		
		
		// imageSelect.jsp 제어하는 부분
		// imageSelect 모달 열기
		imageBtn.on("click", function() {
			console.log("imageSelect button clicked!");
			imageSelect.show();
		});
		
		// 외부 클릭 시 imageSelect 모달 닫기
		$(window).on("click", function(event) {
			if ($(event.target).is(imageSelect)) {
				imageSelect.hide();
			}
		});
		
		// 이미지 선택 시 create.jsp에 선택한 이미지 띄우기
		$(document).on("click", ".selectBody img", function() {
			var imageUrl = $(this).attr("src");
			console.log(imageUrl);
			
			// 선택한 이미지를 create.jsp로 전달
			$("#image").val(imageUrl);
			$("#selectedImage", window.parent.document).attr("src", imageUrl).show();
			
			// 선택 창 닫기
			$("#imageSelectModal").hide();
		});
		
		// 사용할 프로필 클릭 시 메인 페이지 이동 (이건 완성)
		$(".profiles").on("click", function() {
			
		    var num = $(this).find(".num").val();
		    var pass= $(this).find(".pass").val();
		    
		    if (pass) {
		    	(async () => {
		            const { value: enteredPass } = await Swal.fire({
		                title: '프로필 비밀번호를 입력하세요.',
		                input: 'password',  // password input type으로 변경
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
		                        // AJAX로 서버에 프로필 선택 요청
		                        $.ajax({
		                            url: "${path}/profile/profile",
		                            type: "POST",
		                            data: { num: num },
		                            success: function(response) {
		                                if (response) {
		                                    // 프로필 선택 성공 시 메인 페이지로 이동
		                                    window.location.href = '${path}/home';
		                                } else {
		                                    alert("프로필 선택에 실패했습니다.");
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
		    	
		    })();
		    } else {		    	
			    $.ajax({
			        url: "${path}/profile/profile",
			        type: "POST",
			        data: { num: num },
			        success: function(response) {
			            if (response) {
			                console.log(response);
			                window.location.href = '${path}/home';  // 홈 페이지로 리다이렉트
			            } else {
			            	Swal.fire({
								icon : 'error',
								title : '프로필 선택 실패',
								text : '',
								confirmButtonText : '확인',
								confirmButtonColor: '#FFA200'
							});
			            }
			        },
			        error: function() {
			        	Swal.fire({
							icon : 'error',
							title : '서버 오류',
							text : '',
							confirmButtonText : '확인',
							confirmButtonColor: '#FFA200'
						});
			        }
			    });
		    }
		});
		
		
	});
</script>

</body>
</html>

<%@ include file="../common/footer.jsp" %>