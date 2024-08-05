<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ include file="header.jsp" %>
<head>
	<title>개편한 부산</title>
</head>

<style>
	@import url('https://fonts.googleapis.com/css2?family=Jua&display=swap');
	@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap');
	
	.mainBody {
    margin: 0;
    padding: 0;
	}
	
	.mainDiv{
		background-color:rgb(255,246,189);
		margin: 0px;
	}
	
	.gaebusan{
		font-family: "Jua", sans-serif;
 		font-weight: 400;
  		font-style: normal;
  		font-size: 7em;
  		color: 140500;
  		text-align: left;
  		margin: 50px 0px 0px 260px;
  		position:relative;
  		 z-index: 2;

	}
	
	.foot{
		width: 120px;
        position: absolute;
        top: -30px; /* 텍스트와 겹치는 위치 조정 */
        left: 217px; /* 텍스트와 겹치는 위치 조정 */
        z-index: 1;
	}
	
	.imgTitle{
		position:relative;
	}
	
	.promotion {
		color: black;
		text-align: left;
		font-family: "Noto Sans KR", sans-serif;
		margin-left: 270px;
		font-size: 20px;
	}
	
	.introduce{
	  	background-color:3A2400;
	    color: #fff;
	    border:none;
	    border-radius:25px;
	    width: 120px;
	    height: 45px;
	    font-family: "Jua", sans-serif;
 		font-weight: 400;
  		font-style: normal;
  		float:left;
  		font-size: 1.3em;
  		transition: transform 0.2s ease, box-shadow 0.2s ease;
  		cursor: pointer;
  		margin-left: 270px;
	}
	
	.insta{
	  	background-color:rgb(245,212,46);
	    color: #fff;
	    border:none;
	    border-radius:25px;
	    width: 120px;
	    height: 45px;
	    font-family: "Jua", sans-serif;
 		font-weight: 400;
  		font-style: normal;
  		float:left;
  		font-size: 1.3em;
  		transition: transform 0.2s ease, box-shadow 0.2s ease;
  		margin-left: 65px;
	}
	
	.introduce:hover {
		background-color: 58504e;
		cursor: pointer;
	}
	
	.insta:hover {
		background-color: ffdc72;
		cursor: pointer;
	}
	
	.introduce:active {
    transform: scale(0.95);
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    background-color: 140500;
    transition: 0.2s;
	}
	
	.insta:active {
    transform: scale(0.95);
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    background-color: FFCC00;
    transition: 0.2s;
	}
	
	.puppy{
		width: 650px;
		display: inline-block;
		float: right;
		margin-right: 280px;
	}
	
	.whitebox{
		background-color:white;
		height:200px;
		text-align: left;
		padding: 5px 0px 0px 0px;
		border-bottom: 1px solid lightgray;
	}
	
	h2:hover{
		text-decoration: underline;
		cursor: pointer;
	}
	
	.mapGO{
		margin-left: 270px;
	}
</style>


<body class="mainBody" style="text-align:center;">
<div class="mainDiv">	
	<br/>
	<br/>
	<img src="mainPuppy.png" class="puppy"/>
	<br/><br/><br/><br/>
	<div class="imgTitle">
	<img src="dogFootprint.png" class="foot">
	<h1 class="gaebusan">개편한 부산</h1></div>
	<div class="promotion">부산의 모든 개가 편해지는 그날까지! <br/> 개와 부산민들이 함께합니다.</div>
	<br/>
	<input type="button" value="소개글" class="introduce" onclick="location.href='NewFile.html'"/>
	<input type="button"  value="인스타 방문" class="insta"  onclick="location.href='https://www.instagram.com/jjiiccsj/'" />
	<br/>
	<br/>
	<br/>
	<br/>
	<br/>
	<br/>
	<div class="whitebox"><a href="mungPlaceIndex.jsp"><h2 class="mapGO">▶지도(PLACE) 체크 바로가기!</a></h2></div>
</div>	

</body>

<%@ include file="mainPreview.jsp" %>

<%@ include file="mainSlide.jsp" %>

<%@ include file="footer.jsp" %>