<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>

<%@ include file="../common/header.jsp" %>

<head>
	<title>vivi board</title>
	<link rel="stylesheet" href="${path}/resources/css/board_list_style.css?after">
</head>

<input type="hidden" id="loginStatus" value="${!empty sessionScope.member}">

<div class="container">
	<h1 class="commu_title">커뮤니티</h1>
	<div class="search-form">
		<form action="boardSearch" method="GET">
			<select name="searchName" class="select-op" >
				<option value="b_title">제목</option>
				<option value="email">작성자</option>
			</select>
			<input type="text" class="search-input" name="searchValue"  />
			<input type="submit" class="search-go" value="검색" />
		</form>
		<form>
			<select name="perPageNum" class="select-op"
			onchange="this.form.submit();">
				<c:forEach var="i" begin="10" end="30" step="5">
					<option value="${i}" ${pageMaker.cri.perPageNum eq i ? 'selected' : ''}>${i}개씩 보기</option>
				</c:forEach>
			</select>
		</form>
	</div>
<%-- 	<div>
		<a class="btn btn-primary" href="${path}/board/board_write">글 작성</a>
	</div> --%>
	<table class="table table-hover">
		<tr>
			<th>글번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성시간</th>
			<th>조회수</th>
		</tr>
		<c:choose>
			<c:when test="${!empty list}">
				<c:forEach var="b" items="${list}">
					<tr onclick="detail('${b.b_num}');" >
						<td class="board-rows">${b.b_num}</td>
						<td class="board-rows">${b.b_title}</td>
						<td class="board-rows">${b.name}</td>
						<td class="board-rows">
							<f:formatDate value="${b.b_regdate}" pattern="yyyy/MM/dd hh:mm" />
						</td>
						<td class="board-rows">${b.b_viewcnt}</td>
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="5" class="text-none">등록된 게시글이 없습니다.</td>
				</tr>
			</c:otherwise>
		</c:choose>
	</table>
	
	<c:if test="${!empty currentProfile}">
	<div>
		<a class="btn-primary" href="${path}/board/board_write">글 작성</a>
	</div>
	</c:if>
	
	<ul class="pagination justify-content-center">
		<c:if test="${pm.first}">
			<li class="page-item"><a class="page-link" 
				href="?page=1">&lt;&lt;</a></li>
		</c:if>
	
		<c:if test="${pm.prev}">
			<li class="page-item"><a class="page-link"
				href="?page=${pm.startPage-1}">&lt;</a></li>
		</c:if>
		<c:forEach var="i" begin="${pm.startPage}" end="${pm.endPage}">
			<c:choose>
				<c:when test="${pm.cri.page eq i}">
					<li class="page-item active"><a class="page-link" href="#">${i}</a>
					</li>
				</c:when>
				<c:otherwise>
					<li class="page-item"><a class="page-link" href="?page=${i}">${i}</a>
					</li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${pm.next}">
			<li class="page-item"><a class="page-link"
				href="?page=${pm.endPage+1}">&gt;</a></li>
		</c:if>
		
		<c:if test="${pm.last}">
			<li class="page-item"><a class="page-link" 
				href="?page=${pm.maxPage}">&gt;&gt;</a>
            </li>
		</c:if>
	</ul>
</div>

<script>
		function detail(b_num){
			location.href="${path}/board/detail?b_num="+b_num;
		}
</script>

<%@ include file="../common/footer.jsp" %>