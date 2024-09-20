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
<link rel="stylesheet" href="${path}/resources/css/member/membership.css">

</head>
<body>
<section>
	<!-- 네비게이션 바 -->
    <nav class="sideMenu">
        <ul>
            <li><a href="${path}/home">VIVIVIEW로 돌아가기</a></li>
            <li><a href="${path}/member/membership?email=${sessionScope.member.email}">멤버십</a></li>
            <li><a href="${path}/member/beforeMyPage?email=${sessionScope.member.email}">개인정보 수정</a></li>
            <li><a href="${path}/member/changePW?email=${sessionScope.member.email}">비밀번호 변경</a></li>
            <li><a href="${path}/member/beforeWithdraw?email=${sessionScope.member.email}">회원 탈퇴</a></li>
        </ul>
    </nav>
	
	<form action="" method="POST">
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
            </div>
                
            <!-- 스탠다드 상세 내용 -->
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
            </div>
                
            <!-- 프리미엄 상세 내용 -->
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
            </div>

            <!-- 버튼 박스 -->
            <div class="btnBox">
                <!-- 모달 트리거 버튼으로 활용 -->
                <input type="button" id="" value="결제">
            </div>
        </div>
    </form>	
</section>
</body>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script>
	$(document).ready(function () {
		$(".commercial").click(function () {
            resetHalo();
            $(this).addClass("halo");
            $(".commercialContent").css("display", "block");
            $(".standardContent").css("display", "none");
            $(".premiumContent").css("display", "none");
        });

        $(".standard").click(function () {
            resetHalo();
            $(this).addClass("halo");
            $(".standardContent").css("display", "block");
            $(".commercialContent").css("display", "none");
            $(".premiumContent").css("display", "none");
        });

        $(".premium").click(function () {
            resetHalo();
            $(this).addClass("halo");
            $(".premiumContent").css("display", "block");
            $(".commercialContent").css("display", "none");
            $(".standardContent").css("display", "none");
        });
        
        function resetHalo() {
            $(".commercial").removeClass("halo");
            $(".standard").removeClass("halo");
            $(".premium").removeClass("halo");
        }
	});
	
	/* 모달 */
	function openPaymentModal() {
		$('.modal-content').load("${path}/member/paymentModal");
	}
</script>

</html>
<%@ include file="../common/footer.jsp" %>