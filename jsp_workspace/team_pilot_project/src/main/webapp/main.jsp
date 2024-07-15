<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ include file="header.jsp" %>


<style>
	@import url('https://fonts.googleapis.com/css2?family=Jua&display=swap');
	@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap');
	
	body {
    margin: 0;
    padding: 0;
	}
	
	.mainbody{
		background-color:rgb(255,246,189);
		margin: 0px;
	}
	
	.gaebusan{
		font-family: "Jua", sans-serif;
 		font-weight: 400;
  		font-style: normal;
  		font-size: 5em;
  		color: black;
  		text-align: left;
  		margin: 50px 0px 0px 0px;
	}
	
	.promotion {
		color: black;
		text-align: left;
		font-family: "Noto Sans KR", sans-serif;
	}
	
	.introduce{
	  	background-color:3A2400;
	    color: #fff;
	    border:none;
	    border-radius:20px;
	    width: 100px;
	    height: 35px;
	    font-family: "Jua", sans-serif;
 		font-weight: 400;
  		font-style: normal;
  		float:left;
  		font-size: 1em;
  		transition: transform 0.2s ease, box-shadow 0.2s ease;
	}
	
	.insta{
	  	background-color:rgb(245,212,46);
	    color: #fff;
	    border:none;
	    border-radius:20px;
	    width: 100px;
	    height: 35px;
	    font-family: "Jua", sans-serif;
 		font-weight: 400;
  		font-style: normal;
  		float:left;
  		font-size: 1em;
  		transition: transform 0.2s ease, box-shadow 0.2s ease;
	}

	.introduce + .insta{
		margin-left: 40px;
		cursor: pointer;
	}
	
	.introduce:active {
    transform: scale(0.95);
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    background-color: 140500;
	}
	
	.insta:active {
    transform: scale(0.95);
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    background-color: FFCC00;
	}
	
	.puppy{
		display: inline-block;
		float: right;
	}
	
	.whitebox{
		background-color:white;
		height:120px;
		text-align: left;
		padding: 5px 0px 0px 0px;
	}
	
	h2:hover{
		text-decoration: underline;
	}
</style>


<body  style="text-align:center;">
<div class="mainbody">
	<img src="puppy.png" class="puppy"/>
	<br/>
	<h1 class="gaebusan">개편한 부산</h1>
	<div class="promotion">부산의 모든 개가 편해지는 그날까지! <br/> 개와 부산민들이 함께합니다.</div>
	<br/>
	<input type="button" value="소개글" class="introduce"/> <input type="button"  value="인스타 방문" class="insta"/>
	<br/>
	<br/>
	<br/>
	<div class="whitebox"><h2>▶지도(PLACE) 체크 바로가기!</h2></div>
</div>	
</body>


<%@ include file="footer.jsp" %>