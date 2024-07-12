<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ include file="header.jsp" %>

<style>
	@import url('https://fonts.googleapis.com/css2?family=Jua&display=swap');
	
	.gaebusan{
		font-family: "Jua", sans-serif;
 		font-weight: 400;
  		font-style: normal;
  		color: black;
  		text-align: left;
	}
	
	.promotion {
		color: black;
		text-align: left;
	}
	
	.introduce{
	  	background-color:#0a0a23;
	    color: #fff;
	    border:none;
	    border-radius:10px;
	    width: 80px;
	    height: 23px;
	    font-family: "Jua", sans-serif;
 		font-weight: 400;
  		font-style: normal;
	}
	
	.insta{
	  	background-color:rgb(245,212,46);
	    color: #fff;
	    border:none;
	    border-radius:10px;
	    width: 80px;
	    height: 23px;
	    font-family: "Jua", sans-serif;
 		font-weight: 400;
  		font-style: normal;
	}
</style>


<body style="text-align:center;">
	
	<h1 class="gaebusan">개편한 부산</h1>
	<br/>
	<div class="promotion">부산의 모든 개가 편해지는 그날까지! <br/> 개와 부산민들이 함께합니다.</div>
	<img src="puppy.png" /> <br/>
	<input type="button" value="소개글" class="introduce"/> <input type="button"  value="인스타 방문" class="insta"/> <br/>
	
</body>


<%@ include file="footer.jsp" %>