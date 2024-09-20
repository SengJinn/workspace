<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="../common/header.jsp" %>

<head>
	<title>Insert title here</title>
	<link rel="stylesheet" href="${path}/resources/css/board_modify_style.css?after">
</head>

<div class="container">
	<form action="${path}/board/board_modify" method="POST">
	<input type="hidden" name="b_num" value="${boardVO.b_num}"/>
	<div>
		<h1 class="commu_title">${boardVO.b_num} 번째 게시글 수정</h1>
	</div>
	<div class="row m-5">
		<div class="col-md-2">
			<span class="form-control-plaintext">작성자</span>
		</div>
		<div class="col-md-10">
			<span class="form-control-plaintext " name="email"
			>${boardVO.email}</span>
		</div>
	</div>
	<div class="row m-5">
		<div class="col-md-2">
			<span class="form-control-plaintext">제목</span>
		</div>
		<div class="col-md-10">
			<input class="form-control-plaintext input-form input-form-t"
			name="b_title" type="text" value="${boardVO.b_title}"/>
		</div>	
	</div>

	<div class="row m-5">
		<div class="col-md-2">
			<span class="form-control-plaintext">내용</span>
		</div>
		<div class="col-md-10">
			<textarea name="b_content" class="form-control input-form" 
			rows="10">${boardVO.b_content}</textarea>
		</div>
	</div>
	<div class="row m-5">
		<div class="col-md-4">
			<input type="submit" value="수정완료" class="form-control btn btn-primary" />
		</div>
	</div>
	</form>
</div>

<%@ include file="../common/footer.jsp" %>