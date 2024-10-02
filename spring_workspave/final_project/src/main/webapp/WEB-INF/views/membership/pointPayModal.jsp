<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<link rel="stylesheet" href="${path}/resources/css/membership/pointPayModal.css">
<!-- pointPayModal.jsp -->

<div id="pointPayModal" class="selectPayModal">
    <div class="pointPayModalcontent">
        <span id="closeModal" class="close">&times;</span>
        
        <div class="modalHeader">
	        <p>포인트 결제</p>        
        </div>
        
        <hr/>
        
        <form action="pointPay" id="pointPayForm" method="POST">
            <input type="hidden" id="hiddenMembershipType" />
            <input type="hidden" id="hiddenPrice" />
        
        	<div class="modalBody">
	            <div class="selectMembership">
	        		<p>선택한 멤버십</p>
		            <span class="displayMembership"></span>
	            </div>
	            
	            <!-- 포인트 계산 후 보여줌 -->
	            <div class="pointBox">
	            	<p>결제 후 잔여 포인트</p>
		            <span class="remainPoint"></span>
	            </div>
        	</div>
        	<hr/>
        	
            <div class="modalFooter">
	            <button class="pointPayment">포인트 결제</button>            
            </div>
        </form>
    </div>
</div>

<!-- jQuery -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- sweetalert2 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<script>
	$(document).ready(function(e) {
		
		/* 모달 요소 */
		var pointPayBtn = $(".pointPay");			// 포인트 결제 모달창 열기 버튼
		var pointPayModal = $("#pointPayModal");	// 포인트 결제창
		var span = $("#closeModal");				// 포인트 결제창 닫기 버튼
		
		var hiddenMembershipType = '';
		var hiddenPrice = '';
		
		/* 모달창 열기 */
		pointPayBtn.on("click", function() {
			const membershipType = $(this).closest('form').find(".membershipType").val();
			const membershipPrice = $(this).closest('form').find(".price").val();
			
			$("#hiddenMembershipType").val(membershipType);  // 숨겨진 필드에 값 설정
		    $("#hiddenPrice").val(membershipPrice);          // 숨겨진 필드에 값 설정
			
		    $(".displayMembership").text(membershipType); // 모달에 멤버십 이름 설정
			pointPayModal.show();
			
			// 잔여 포인트 계산 함수
			updateRemainingPoint($(this).closest('form'));
		});
		
		/* 모달창 닫기 */
		span.on("click", function() {
			pointPayModal.hide();
		});
		
		/* 포인트 결제 */
	    $(".pointPayment").on("click", function (e) {
	    	e.preventDefault();
	    	
	    	if (currentMembershipStatus == '갱신') {
		    	showAlert('warning', '멤버십 사용 중', '현재 사용 중인 멤버십이 있습니다. 종료 후 결제를 진행해주세요.');
		        return; // 결제 요청 중지
		    }
	    	
	    	// const $form = $(this).closest('form');
	        const membershipType = $("#hiddenMembershipType").val();
	        const price = $("#hiddenPrice").val();
	        // const point = ${sessionScope.member.point};
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
	        
	        $.ajax({
	        	url : '${path}/membership/pointPay',
	        	type : "POST",
	        	data : {
	        		email: email,
	        		membershipType: membershipType,
	        		point: price,
	        		paymentDate: paymentDate,
	        		expiryDate: expiryDate
	        	},
	        	success: function(reponse) {
	        		showAlert('success', '포인트 결제가 완료되었습니다.', '결제 금액만큼 포인트가 차감됩니다.').then(() => {
	        		    window.location.href = "${path}/home";
	        		});
	        	},
	        	error: function(error) {
	        		showAlert('error', '포인트 결제 실패', '결제에 실패했습니다. 다시 시도해주세요.').then(() => {
		        		window.location.href = "${path}/membership/membership?email=" + email;	        			
	        		});
	        	}
	        });
	        
	        console.log({
	            email: email,
	            membershipType: membershipType,
	            // price: price,
	            point: price,
	            paymentDate: paymentDate,
	            expiryDate: expiryDate
	        });
	    });
		
		/* 잔여 포인트 계산 */
		function updateRemainingPoint($form) {
			const price = $form.find(".price").val();
			const currentPoint = ${sessionScope.member.point};
			const remainingPoint = currentPoint - price;
			
			console.log(currentPoint);
			console.log(price);
			console.log(remainingPoint);
			
			if (remainingPoint >= 0) {
				$(".remainPoint").text(remainingPoint + " Point").css("color", "FFA200");
				$(".pointPayment").css("cursor", "pointer").css("background", "#FFA200").prop("disabled", false);
			} else {
				$(".remainPoint").text("잔여 포인트가 부족합니다.").css("color", "#F58");
				$(".pointPayment").prop("disabled", true);
			}
		}
		
		/* sweetalert 함수 */
	    function showAlert(icon, title, text) {
	    	return Swal.fire({
	    		icon : icon,
	    		title : title,
	    		text : text,
	    		confirmButtonText: '확인',
                confirmButtonColor: '#FFA200'
	    	});
	    }
	});
</script>