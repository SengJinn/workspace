<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="../common/header.jsp" %>

<head>
	<title>게시글 작성</title>
	<link rel="stylesheet" href="${path}/resources/css/board_write_style.css?after">
</head>

<div class="container">
	<form action="${path}/board/board_write" method="POST" >
	<div>
		<h1 class="commu_title">게시글 작성</h1>
	</div>
	<div class="row m-5">
		<div class="col-md-2">
			<span class="form-control-plaintext">작성자</span>
		</div>
		<div class="col-md-10">
			<input class="form-control-plaintext input-form" 
			name="name" type="text" value="${currentProfile.name}" readonly />
			<input type="hidden" name="email" value="${currentProfile.email}">
			<input type="hidden" name="p_num" value="${currentProfile.num}">
		</div>
	</div>
	<div class="row m-5">
		<div class="col-md-2">
			<span class="form-control-plaintext">제목</span>
		</div>
		<div class="col-md-10">
		<input class="form-control-plaintext input-form" 
		name="b_title" type="text" required />
		</div>
	</div>
	<div class="row m-5">
		<div class="col-md-2">
			<span class="form-control-plaintext">내용</span>
		</div>
		<div class="col-md-10">
			<textarea name="b_content" class="form-control" 
			rows="10" required></textarea>
		</div>
	</div>
	<div class="row m-5">
		<div class="col-md-4">
			<button type="submit" class="btn">작성완료</button>
		</div>
	</div>
	</form>
</div>

<%@ include file="../common/footer.jsp" %>