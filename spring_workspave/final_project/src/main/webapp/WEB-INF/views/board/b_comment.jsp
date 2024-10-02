<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" /> 

<head>
	<link rel="stylesheet" href="${path}/resources/css/b_comment_style.css?after">
</head>

<!-- hidden 으로 받아오는 값 -->
<input type="hidden" id="s_member" name="s_member" value="${sessionScope.member}">
<input type="hidden" id="sp_email" name="sp_email" value="${sessionScope.currentProfile.email}">
<input type="hidden" id="sp_num" name="sp_num" value="${sessionScope.currentProfile.num}">


<div id="modDiv">
	<!-- 댓글 수정창 -->
	<h2>댓글 수정</h2>
	<!-- 수정할 댓글 번호 -->
	<div id="modCno"></div>
	<div>
		<input type="text" id="modAuth" placeholder="작성자" readonly />
	</div>
	<div>
		<textarea id="modText" placeholder="댓글내용"></textarea>
	</div>
	<div>
		<button id="modBtn">MODIFY</button>
		<button id="delBtn">DELETE</button>
		<button id="closeBtn">CLOSE</button>
	</div>
</div>
 
<div class="commentInsert-div-1">
<hr class="line" />
<h2>댓글</h2>
	<div class="commentInsert-div-2">
		작 성 자 : <input type="text" class="commentInsert-input"
		id="name" name="name" value="${sessionScope.currentProfile.name}" readonly/>
		<input type="hidden" id="p_email" name="p_email" value="${sessionScope.currentProfile.email}">
		<input type="hidden" id="p_num" name="p_num" value="${sessionScope.currentProfile.num}">
	</div>
	<div class="commentInsert-div-2">
		내 &nbsp;&nbsp;&nbsp; 용 : <textarea class="commentInsert-textarea"
		id="c_content" name="c_content" ></textarea>
	</div>
	<br/>
	<button id="addBtn">ADD Comment</button>
</div>

<!-- 댓글 리스트 출력 -->
<div class="comments-div">
	<ul id="comments"></ul>
</div>
<br/><br/><br/><br/><br/><br/><br/><br/>

<!-- jQuery library 등록 -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script>
	
	$(document).ready(function() {
		
		// 현재 세션에 저장된 사용자의 정보
		var currentProfile = "${sessionScope.currentProfile}";
		
		/* var sp_email = $("#sp_email").val(); // 세션에 들어간 이메일 번호
		var sp_num = $("#sp_num").val(); // 세션에 들어간 프로필 번호
		
		var p_email = $("#p_email").val(); // 게시글에 들어간 프로필 이메일
		var p_num = $("#p_num").val();  // 게시글에 들어간 프로필 번호 */
		
		
		if (currentProfile != null && currentProfile !== "") {
			// 세션에 로그인 된 프로필이 있으면 댓글 작성창을 보여준다. 
			$(".commentInsert-div-1").show();
			$(".commentModify-Btn").show();
			/* if(sp_email === p_email && sp_num === p_num){
			// 로그인 된 사용자 중에 
			// 댓글 작성시에 사용된 이메일과 프로필 번호가 맞으면 댓글 수정 버튼 보여줌
				$(".commentModify-Btn").show();
			}else{
				$(".commentModify-Btn").hide();
			} */
			
		} else {
			// 세션에 로그인 된 프로필이 없으면 댓글 작성창 보이지 않음
			$(".commentInsert-div-1").hide();
			$(".commentModify-Btn").hide();
		}
	
		
	});
</script>

<script>
	console.log(this.c_regdate);
	
	var b_num = '${board.b_num}'; // 댓글을 등록할 게시글 번호
	
	getCommentList();

	// 전체 댓글 목록 검색 후 출력
	function getCommentList(){
		// GET - 검색(read)
		let url = "${path}/comments/all/"+b_num;
		// 댓글 목록
		$.getJSON(url, function(data){
			console.log(data);
			printList(data);
		});
	}
	
	
	// 댓글 목록 comments ul 에 출력하는 함수
	function printList(list){
		// list = [CommentVO, CommentVO ... ]
		let str = "";
		
		$(list).each(function(){
			console.log(this);
			let cno = this.bc_num;
			let cAuth = this.name;
			let cText = this.c_content;
			
			console.log(cno+"-"+cAuth+"-"+cText);
			str += "<hr class='line2' /><li>";
			str += "["+ cno + "번 댓글]"+"<br/>"+"작성자 : "+cAuth+" | "+getTime(this.c_regdate)+"<br/>";
			str += cText;
			str += "<br/>";
			str += "<button class='commentModify-Btn' onclick='modDiv(this, "+cno+", \""+cAuth+"\", \""+cText+"\");'>MODIFY</button>";
			str += "</li>";
		});
		
		$("body").prepend($("#modDiv"));
		$("#modDiv").css("display","none");
		$("#comments").html(str);
	}
	
	
	// 댓글 수정창 open
	function modDiv(el, cno, auth, text){
		console.log(el);
		$("#modDiv").css("display","none");
		
		$("#modCno").html(cno);
		$("#modText").val(text);
		$("#modAuth").val(auth);
		
		// 이벤트가 발생한 button 태그요소의 부모 li요소 뒤에 수정 창 추가(이동)
		$(el).parent().after($("#modDiv"));
		$("#modDiv").slideDown("slow");
	}
	
	$("#closeBtn").click(function(){
		$("#modDiv").fadeOut('slow');
	});
	
	
	function getTime(time){
		
		let date = new Date(time);
		
		let year = date.getFullYear();
		let month = date.getMonth() + 1;
		let day = date.getDate();
		let hour = date.getHours();
		let minute = date.getMinutes();
		let seconds = date.getSeconds();
		let millis = date.getMilliseconds();
		
		return date.toLocaleString("ko");
	}
	
	// 댓글 생성
	$("#addBtn").click(function(){
		// 클릭하면 정보를 서버에 전달 
		let cAuth = $("#name").val();
		let cText = $("#c_content").val();
		let email = $("#p_email").val();
		let p_num = $("#p_num").val();
		
		$.ajax({
			type : "POST",
			url : "${path}/comments",
			data : {
				b_num : b_num,
				name : cAuth,
				c_content : cText,
				email : email,
				p_num : p_num
			},
			dataType : "text",
			success : function(result){
				alert(result);
				getCommentList();
			},
			error : function(res){
				console.log(res);
			}
		});
		
		// 값 전달 후 작성 칸에는 빈 칸이 되도록 
		document.getElementById('c_content').value = '';
		
	});
	
	
	/*
	수정 요청 처리
	*/
	$("#modBtn").click(function(){
		// 수정할 댓글 번호, 수정된 작성자 , 수정된 댓글 내용
		let cno = $("#modCno").text(); // innerText
		let auth = $("#modAuth").val();
		let text = $("#modText").val();
		console.log("----------------------------------------");
		console.log(auth);
		console.log(text);
		$.ajax({
			type : "PUT",
			url : "${path}/comments/"+cno,
			headers : {
				"Content-Type" : "application/json"
			},
			// JSON.stringify : json 형식의 문자열로 변환
			data : JSON.stringify({
				c_content : text,
				name : auth
			}),
			dataType : "text",
			success : function(result){
				alert(result);
				$("#modDiv").slideUp("slow");
				getCommentList();
			}
		});
	});
	
	
	/*
	댓글 삭제 요청 처리
	*/
	$("#delBtn").click(function(){
	
		let cno = $("#modCno").text();
	
		$.ajax({
			type : "DELETE",
			url : "${path}/comments/"+cno,
			dataType : "text",
			success : function(result){
				alert(result);
				if(result == "삭제성공"){
					console.log($("#modDiv").parent());
					console.log($("#modDiv").parent().first());
				}
				getCommentList();
			}
		});
	});	
	
</script>