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
		        	<!-- 모달 트리거 버튼으로 활용 -->
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
		        	<!-- 모달 트리거 버튼으로 활용 -->
		            <input type="button" class="kakaoPay" value="결제">
        		</div>
            </div>
        </form>        
        <!-- 프리미엄 상세 내용 -->
        <form action="membership" method="POST">
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
		        	<!-- 모달 트리거 버튼으로 활용 -->
		            <input type="button" class="kakaoPay" value="결제">
        		</div>
            </div>
        </form>    
    </div>
</section>
</body>

<!-- jQuery -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- sweetalert2 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<!-- 포트원 -->
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>

<script>
	$(document).ready(function () {
	    /* 카카오 페이 초기화 */
	    IMP.init('imp03856802');
	    
	    $(".kakaoPay").on("click", function(e) {
	        e.preventDefault();
	        
	        var $form = $(this).closest('form');
	        
	        var membershipType = $form.find(".membershipType").val();
	        var price = $form.find(".price").val();
	        var email = $(".email").val();
	        var phone = $(".phone").val();
	        
	        // 결제 요청
	        IMP.request_pay({
	            pg: 'kakaopay',
	            pay_method: 'card',
	            name: membershipType,   // 상품 이름
	            amount: price,          // 결제 금액
	            buyer_email: email
	        }, function(rsp) {
	            if (rsp.success) {
	                // 결제 성공
	                Swal.fire({
	                    icon: 'success',
	                    title: '결제가 완료되었습니다.',
	                    text: '결제 금액의 10%를 포인트로 적립해 드립니다.',
	                    confirmButtonText: '확인',
	                    confirmButtonColor: '#FFA200'
	                });
	                
	                // 결제 금액의 10%를 포인트로
	                var point = Math.floor(price * 0.1);
	                
	                // 결제 정보 저장 AJAX 요청
	                $.ajax({
	                    url: '${path}/membership/paymentInfo',  // 결제 정보를 저장할 URL
	                    method: 'POST',
	                    data: {
	                        email: email,
	                        membershipType: membershipType,
	                        price: price,
	                        paymentDate: new Date().toISOString(), // 현재 날짜
	                        expiryDate: new Date(new Date().setMonth(new Date().getMonth() + 1)).toISOString(), // 만료일
	                        transactionId: rsp.imp_uid // 결제 트랜잭션 ID
	                    },
	                    success: function(response) {
	                        // 포인트 업데이트 AJAX 요청
	                        $.ajax({
	                            url: '${path}/membership/pointUpdate',
	                            method: 'POST',
	                            data: {
	                                point: point
	                            },
	                            success: function(response) {
	                                Swal.fire({
	                                    icon: 'success',
	                                    title: '포인트 적립 완료',
	                                    text: '',
	                                    confirmButtonText: '확인',
	                                    confirmButtonColor: '#FFA200'
	                                });
	                            },
	                            error: function(error) {
	                                Swal.fire({
	                                    icon: 'error',
	                                    title: '포인트 적립 실패',
	                                    text: '',
	                                    confirmButtonText: '확인',
	                                    confirmButtonColor: '#FFA200'
	                                });
	                            }
	                        });
	                    },
	                    error: function(error) {
	                        Swal.fire({
	                            icon: 'error',
	                            title: '결제 정보 저장 실패',
	                            text: '',
	                            confirmButtonText: '확인',
	                            confirmButtonColor: '#FFA200'
	                        });
	                    }
	                });
	            } else {
	                // 결제 실패
	                Swal.fire({
	                    icon: 'error',
	                    title: '결제 실패',
	                    text: '',
	                    confirmButtonText: '확인',
	                    confirmButtonColor: '#FFA200'
	                });
	            }
	        }); // IMP.request_pay
	    }); // $(".kakaoPay").on
		
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

</html>
<%@ include file="../common/footer.jsp" %>