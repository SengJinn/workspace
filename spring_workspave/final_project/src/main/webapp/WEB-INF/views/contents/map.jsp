<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../common/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>VIVIVIEW MAP</title>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans:wght@400;700&display=swap" rel="stylesheet">

<style>


body {
  margin: 0;
  font-family: 'Noto Sans KR', sans-serif;
  background-color: #141414;
  color: #e5e5e5;
  overflow-x: hidden;
}

.blank {
	height: 100px;
}

.road-map {
	display: flex;
    justify-content: center;
}

h1{
	text-align: center;
	margin-right: 820px;
}

.way-text {
   margin: 1px;

   text-align: center;
}

.address-contact {
	display: inline-block;	  
	text-align: left;
	padding-right: 33px;
}

.how-to-find {
	display: inline-block;	
	text-align: left;
	box-sizing: border-box;
	border-left: 1px  solid gray;
}

.contact-text {
	font-size: 1.3em;
	font-weight: 600;
	margin-bottom: 60px;
	border-bottom: 2px solid gray;
	
	box-sizing: border-box;
}

li {
	border-bottom: 1px dashed gray;
	margin-bottom: 5px;
}

.address-contact p:nth-child(2) {
	padding: 0px;
	margin-top: -37px;
}

.address-contact p:nth-child(3) {
	padding: 0px;
}

</style>

</head>
<body>
<div class="blank"></div>

<h1>찾아오시는 길</h1>

<div class="road-map">
<!-- * 카카오맵 - 지도퍼가기 -->
<!-- 1. 지도 노드 -->
<div id="daumRoughmapContainer1725429025099" class="root_daum_roughmap root_daum_roughmap_landing"></div>

<!--
	2. 설치 스크립트
	* 지도 퍼가기 서비스를 2개 이상 넣을 경우, 설치 스크립트는 하나만 삽입합니다.
-->
<script charset="UTF-8" class="daum_roughmap_loader_script" src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>

<!-- 3. 실행 스크립트 -->
<script charset="UTF-8">
	new daum.roughmap.Lander({
		"timestamp" : "1725429025099",
		"key" : "2kjdx",
		"mapWidth" : "1000",
		"mapHeight" : "460"
	}).render();
</script>
</div>

<br/>

<div class="way-text">

<div class="address-contact">
    <p class="contact-text"> ADDRESS AND CONTACT <br/> 주소 및 연락처</p>
    <p>주소 : (48262)부산광역시 수영구 광남로 70 (남천동)</p>
    <p>대표전화 : 010-7271-9301</p>
</div>



<div class="how-to-find">
<ul>
	<li>지하철 이용 시 : 금련산역 3번 출구로 나와서 광안해변 방면으로 200m 직진</li>
	<li>버스 이용 시 : 광안2동우편취급국 방면 : 108, 38, 83, 83-1 금련산역 정류장 하차</li>
	<li>건강보험공단 방면 : 수영구2 금련산역 정류장 하차 </li>
	<li>광일맨션 방면 : 41, 42 수영구청 정류장 하차</li>
	<li>금련산청소년수련원 방면 : 108, 131, 155, 20, 39, 51, 83, 83-1 금련산역 정류장 하차</li>
</ul>
</div>

</div>

<br/><br/><br/>

</body>
</html>

<%@ include file="../common/footer.jsp" %>