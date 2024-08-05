<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<head>
    <meta charset="UTF-8">
    <title>홈페이지 메인</title>
    <style>
   
 .slideshow-container {
  position: relative;
  max-width: 100%;
  margin: auto;
  overflow: hidden;
}

/* 슬라이드 이미지들 */
.mySlides {
  display: none;
  width: 100%;
  height: 80%;
}

/* 이전 버튼, 다음 버튼 스타일링 */
.prev, .next {
  cursor: pointer;
  position: absolute;
  top: 50%;
  width: auto;
  padding: 16px;
  margin-top: -100px;
  color: white;
  font-weight: bold;
  font-size: 30px;
  transition: 0.6s ease;
  border-radius: 0 3px 3px 0;
  user-select: none;
}

.prev{
	left: 0;
}

.next {
  right: 0;
  border-radius: 3px 0 0 3px;
}

/* 버튼을 호버할 때 */
.prev:hover, .next:hover {
  background-color: rgba(0,0,0,0.8);
}

/* 슬라이드 쇼 인디케이터 */
/*
.dot {
  cursor: pointer;
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}
*/
.active, .dot:hover {
  background-color: #717171;
}

/* 페이드 애니메이션 */
.fade {
  animation-name: fade;
  animation-duration: 1.5s;
}

@keyframes fade {
  from {opacity: .4}
  to {opacity: 1}
}
    </style>
</head>
<body>

<div class="slideshow-container">

  <div class="mySlides fade">
    <img src="mungSlidePic/puppySlide1.png" style="width:100%">
  </div>

  <div class="mySlides fade">
    <img src="mungSlidePic/puppySlide2.png" style="width:100%">
  </div>

  <div class="mySlides fade">
    <img src="mungSlidePic/puppySlide3.png" style="width:100%">
  </div>

  <!-- 이전, 다음 버튼 -->
  <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
  <a class="next" onclick="plusSlides(1)">&#10095;</a>
</div>


<!-- 슬라이드 쇼 인디케이터 -->
<!--  <div style="text-align:center">
  <span class="dot" onclick="currentSlide(1)"></span> 
  <span class="dot" onclick="currentSlide(2)"></span> 
  <span class="dot" onclick="currentSlide(3)"></span> 
</div>
-->
<script>
var slideIndex = 1;
showSlides(slideIndex);

// 다음/이전 컨트롤
function plusSlides(n) {
  showSlides(slideIndex += n);
}

// 썸네일 이미지 컨트롤
function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  var i;
  var slides = document.getElementsByClassName("mySlides");

  if (n > slides.length) {slideIndex = 1}
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";  
  }

  slides[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " active";
}
</script>

</body>
</html>