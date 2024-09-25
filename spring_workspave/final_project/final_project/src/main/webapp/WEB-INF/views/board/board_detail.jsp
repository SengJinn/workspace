<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="../common/header.jsp" %>

<head>
	<title>${board.b_num} 번째 게시글</title>
	<link rel="stylesheet" href="${path}/resources/css/board_detail_style.css?after">
</head>


<input type="hidden" id="c_email" value="${sessionScope.currentProfile.email}">
<input type="hidden" id="c_num" value="${sessionScope.currentProfile.num}">

<input type="hidden" id="b_email" value="${board.email}">
<input type="hidden" id="p_num" value="${board.p_num}">

<div class="container">
	<div>
		<h1 class="commu_title">${board.b_num} 번째 게시글</h1>
	</div>
	<div class="row m-5">
		<div class="col-md-2">
			<span class="form-control-plaintext">작성자</span>
		</div>
		<div class="col-md-10">
			<span class="form-control-plaintext input-form">${board.name}</span>
			<input type="hidden" value="${board.email}" >
		</div>
	</div>
	<div class="row m-5">
		<div class="col-md-2">
			<span class="form-control-plaintext">제목</span>
		</div>
		<div class="col-md-10 form-control-plaintext input-form">${board.b_title}</div>
	</div>
	<div class="row m-5">
		<div class="col-md-2">
			<span class="form-control-plaintext">내용</span>
		</div>
		<div class="col-md-10">
			<textarea class="form-control input-form" rows="10"
				readonly>${board.b_content}</textarea>
		</div>
	</div>
	<div class="row m-5">
		<div class="col-md-4">
			<a href="${path}/board/board_modify?b_num=${board.b_num}"
				class="form-control btn btn-warning">수정</a>
			<a href="#" onclick="deleteNotice('${board.b_num}',event);"
				class="form-control btn btn-danger">삭제</a>
			<a href="${path}/board/board_list"
				class="form-control btn btn-primary">목록</a>
		</div>
		<div>
			<%@ include file="/WEB-INF/views/board/b_comment.jsp" %>
		</div>
	</div>
</div>

<!-- jQuery -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- sweetalert2 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<script>
	function deleteNotice(b_num,event){
		event.preventDefault();
		
		var c_num = $("#c_num").val(); // 세션에 들어간 프로필 번호
		var b_number = $("#b_number").val();  // 게시글에 들어간 프로필 번호
		
		if(c_num === b_number) {
			
		}
		
		Swal.fire({
			title: '',
	        text: b_num + "번 게시물을 삭제하시겠습니까?",
	        icon: 'warning',
	        showCancelButton: true,
	        confirmButtonColor: '#FFA200',
	        cancelButtonColor: '#888',
	        confirmButtonText: '삭제',
	        cancelButtonText: '취소'
		}).then((result) => {
			// console.log(result);
			if(result.isConfirmed) {
				location.href='${path}/board/delete?b_num='+b_num;
			}
		});
		
	} 
</script>



<script>
	$(document).ready(function() {
		var c_email = $("#c_email").val();		// 세션에 저장된 이메일
		var b_email = $("#b_email").val();		// 게시글에 저장된 이메일
		
		var c_num = $("#c_num").val(); // 세션에 들어간 프로필 번호
		var p_num = $("#p_num").val();  // 게시글에 들어간 프로필 번호
		
		if (c_num === p_num && c_email === b_email) {
			$(".btn-danger").show();
			$(".btn-warning").show();
		} else {
			$(".btn-danger").hide();
			$(".btn-warning").hide();
		}
	});
</script>




<%@ include file="../common/footer.jsp" %>