<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>VIVIVIEW - 멤버십</title>

<!-- 네비게이션 바 CSS -->
<link rel="stylesheet" href="${path}/resources/css/member/sideMenu.css">
<!-- membership CSS -->
<link rel="stylesheet" href="${path}/resources/css/membership/membership.css">
<!-- <link rel="stylesheet" href="${path}/resources/css/membership/kakao_qr.css">  -->




</head>
<body>
<!-- 세션 member 정보 -->
<input type="hidden" class="email" value="${member.email}">
<input type="hidden" class="phone" value="${member.phone}">

<section>
	<!-- 네비게이션 바 -->
    <nav class="sideMenu">
        <ul>
            <li><a href="${path}/home">VIVIVIEW로 돌아가기</a></li>
            <li><a href="${path}/membership/membership?email=${sessionScope.member.email}">멤버십</a></li>
            <li><a href="${path}/member/beforeMyPage?email=${sessionScope.member.email}">개인정보 수정</a></li>
            <li><a href="${path}/member/changePW?email=${sessionScope.member.email}">비밀번호 변경</a></li>
            <li><a href="${path}/member/beforeWithdraw?email=${sessionScope.member.email}">회원 탈퇴</a></li>
        </ul>
    </nav>
	

    <div class="wrapper">
    	<div class="upperBox">
        	<p class="title">멤버십</p>
            <p class="caution">원하는 멤버십을 선택하세요.</p>
        </div>
        <hr/>
            
        <!-- 멤버십 종류 -->
        <div class="membership">
	    	<div class="commercial">
	        	<p>광고형 스탠다드</p>
	            <p>1080p</p>
	        </div>
            
	        <div class="standard">
	        	<p>스탠다드</p>
	            <p>1080p</p>
	        </div>
            
	        <div class="premium">
	          	<p>프리미엄</p>
	            <p>4K + HDR</p>
	        </div>
        </div>
                
        <!-- 멤버십 별 상세 내용 -->
        <!-- 광고형 스탠다드 상세 내용 -->
        <form action="membership" method="POST">
            <div class="commercialContent">
                <ul>
                    <li>
                        <div class="first">월 요금</div>
                        <div class="second">5,500원</div>
                    </li>
                    <li>
                        <div class="first">화질과 음질</div>
                        <div class="second">좋음</div>
                    </li>
                    <li>
                        <div class="first">해상도</div>
                        <div class="second">1080p(FULL HD)</div>
                    </li>
                    <li>
                        <!-- 프로필 최대 2개 생성 가능 -->
                        <div class="first">동시 접속자 수</div>
                        <div class="second">2</div>
                    </li>
                    <li>
                        <div class="first">광고</div>
                        <div class="second">생각보다 적은 광고</div>
                    </li>
                </ul>
                
                <input type="hidden" class="membershipType" name="membershipType" value="광고형 스탠다드">
                <input type="hidden" class="price" name="price" value="5500">
                
                <!-- 버튼 박스 -->
        		<div class="btnBox">
		        	<input type="button" class="pointPay" value="포인트 결제">
		            <input type="button" class="kakaoPay" value="결제">
        		</div>
            </div>
        </form>        
        <!-- 스탠다드 상세 내용 -->
        <form action="membership" method="POST">
            <div class="standardContent">
                <ul>
                    <li>
                        <div class="first">월 요금</div>
                        <div class="second">13,500원</div>
                    </li>
                    <li>
                        <div class="first">화질과 음질</div>
                        <div class="second">좋음</div>
                    </li>
                    <li>
                        <div class="first">해상도</div>
                        <div class="second">1080p(FULL HD)</div>
                    </li>
                    <li>
                        <!-- 프로필 최대 2개 생성 가능 -->
                        <div class="first">동시 접속자 수</div>
                        <div class="second">2</div>
                    </li>
                    <li>
                        <div class="first">광고</div>
                        <div class="second">무광고</div>
                    </li>
                </ul>
                
                <input type="hidden" class="membershipType" name="membershipType" value="스탠다드">
                <input type="hidden" class="price" name="price" value="13500">
                
                <!-- 버튼 박스 -->
        		<div class="btnBox">
		        	<input type="button" class="pointPay" value="포인트 결제">
		            <input type="button" class="kakaoPay" value="결제">
        		</div>
            </div>
        </form>        
        <!-- 프리미엄 상세 내용 -->
        <form action="membership" method="POST" class="">
            <div class="premiumContent">
                <ul>
                    <li>
                        <div class="first">월 요금</div>
                        <div class="second">17,000원</div>
                    </li>
                    <li>
                        <div class="first">화질과 음질</div>
                        <div class="second">가장 좋음</div>
                    </li>
                    <li>
                        <div class="first">해상도</div>
                        <div class="second">4K(UHD) + HDR</div>
                    </li>
                    <li>
                        <div class="first">공간 음향(아머시브 사운드)</div>
                        <div class="second">포함</div>
                    </li>
                    <li>
                        <!-- 프로필 최대 4개 생성 가능 -->
                        <div class="first">동시 접속자 수</div>
                        <div class="second">4</div>
                    </li>
                    <li>
                        <div class="first">광고</div>
                        <div class="second">무광고</div>
                    </li>
                </ul>
                
                <input type="hidden" class="membershipType" name="membershipType" value="프리미엄">
                <input type="hidden" class="price" name="price" value="17000">
                
                <!-- 버튼 박스 -->
        		<div class="btnBox">
        			<input type="button" class="pointPay" value="포인트 결제">
		            <input type="button" class="kakaoPay" value="결제">
        		</div>
            </div>
        </form>    
    </div>
</section>
<%@ include file="/WEB-INF/views/membership/pointPayModal.jsp" %>

<!-- jQuery -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- sweetalert2 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<!-- 포트원 -->
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>

<script>
	$(document).ready(function () {
		
		var currentMembershipStatus = "${member.membershipStatus}";
		
	    /* 카카오 페이 초기화 */
	    var IMP = window.IMP;
	    IMP.init('imp03856802');
	    
    	// 결제 요청 및 ajax에 넘겨야 하는 변수들
        
	    $(".kakaoPay").on("click", function(e) {
	        e.preventDefault();
	        
	    if (currentMembershipStatus == '갱신') {
	    	showAlert('warning', '멤버십 사용 중', '현재 사용 중인 멤버십이 있습니다. 종료 후 결제를 진행해주세요.');
	        return; // 결제 요청 중지
	    }
	        
        const $form = $(this).closest('form');
        const membershipType = $form.find(".membershipType").val();
        const price = $form.find(".price").val();
        const email = $(".email").val();
        
        // 현재 시간 가져오기
        const now = new Date();
        now.setHours(now.getHours() + 9);
        // TIMESTAMP에 맟게 변환
        const paymentDate = now.toISOString().slice(0, 19).replace('T', ' ');
        
        // 한 달 뒤 시간 가져오기
        const oneMonth = new Date(now);
        oneMonth.setMonth(oneMonth.getMonth() + 1);
        const expiryDate = oneMonth.toISOString().slice(0, 19).replace('T', ' ');

	        // 결제 요청
	        IMP.request_pay({
	            pg : 'kakaopay',
	            pay_method : 'card',
	            name : membershipType,   // 상품 이름
	            amount : price,          // 결제 금액
	            buyer_email : email,
	            merchant_uid : 'merchant_' + new Date().getTime()	// 주문 번호
	        }, function(rsp) {
	            if (rsp.success) {
	            	// 결제 금액의 10%를 포인트로
	                const point = Math.floor(price * 0.1);
	            	
	                console.log({
	                    membershipType: membershipType,
	                    point: point,
	                    email: email,
	                    paymentDate: paymentDate,
	                    expiryDate: expiryDate
	                });
	                
	                /*
	                2024-09-26 PM 03:38 일단 값 넘어오기는 함
	                {membershipType: '프리미엄', point: 1700,
	                	email: 'apfhd2@naver.com', 
	                	paymentDate: '2024-09-26 15:37:45', 
	                	expiryDate: '2024-10-26 15:37:45'}
	                */
	            	
	            	// 계정에 멤버십 적용
	            	$.ajax({
                        url : '${path}/membership/membershipUpdate',
                        type : 'POST',
                        data: {
                        	membershipType : membershipType,
                            point: point,
                            email: email,
                            paymentDate: paymentDate,
                            expiryDate: expiryDate
                        },
		                success: function(response) {
			                // 결제 성공
		                	showAlert('success', '결제가 완료되었습니다.', '결제 금액의 10%를 포인트로 적립해 드립니다.');
			                
			                window.location.href = "${path}/home";
		                },
		                error: function(error) {
		                	showAlert('error', '포인트 적립 실패', '포인트 적립 중 문제가 발생했습니다.');
                        }
	                });
	            } else {
	                // 결제 실패
	            	showAlert('error', '결제 실패', '결제에 실패했습니다. 다시 시도해주세요.');
	                
	                window.location.href = "${path}/membership/membership?email=" + email;
	            }
	        }); // IMP.request_pay
	    }); // $(".kakaoPay").on
		
	    // sweetalert 함수
	    function showAlert(icon, title, text) {
	    	Swal.fire({
	    		icon : icon,
	    		title : title,
	    		text : text,
	    		confirmButtonText: '확인',
                confirmButtonColor: '#FFA200'
	    	});
	    }
	    
		/* 광고형 스탠다드 정보 */
		$(".commercial").click(function () {
            resetHalo();
            $(this).addClass("halo");
            $(".commercialContent").css("display", "block");
            $(".standardContent").css("display", "none");
            $(".premiumContent").css("display", "none");
        });

		/* 스탠다드 정보 */
        $(".standard").click(function () {
            resetHalo();
            $(this).addClass("halo");
            $(".standardContent").css("display", "block");
            $(".commercialContent").css("display", "none");
            $(".premiumContent").css("display", "none");
        });

        /* 프리미엄 정보 */
        $(".premium").click(function () {
            resetHalo();
            $(this).addClass("halo");
            $(".premiumContent").css("display", "block");
            $(".commercialContent").css("display", "none");
            $(".standardContent").css("display", "none");
        });
        
        /* halo 추가 */
        function resetHalo() {
            $(".commercial").removeClass("halo");
            $(".standard").removeClass("halo");
            $(".premium").removeClass("halo");
        }
	});
</script>

</body>
</html>
<%@ include file="../common/footer.jsp" %>