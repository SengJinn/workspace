<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ include file="../header.jsp" %>
<!--  contentType에 charset=UTF-8 이 지정되어있으면  
		pageEncoding="UTF-8" 은 필요없다.-->
		<!DOCTYPE html>
		<html>
		<head>
		<meta charset="UTF-8">
		<title>멍상형 월드컵</title>
		<style>
		@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap');	
		@import url('https://fonts.googleapis.com/css2?family=Jua&display=swap');
		
			.worldcup{
				 margin: 0;
  				 box-sizing: border-box;
  				 font-family: "Noto Sans KR", sans-serif;
  				 background-color: rgb(255, 246, 189);
			}	
			
			.box1 {
				text-align:center;
				margin:auto;
    		    width: 900px;
		        background-color: white;
		        border-radius: 20px;
		        padding: 30px;
			}
		
			img {
				width:400px;
				height:400px;
				border-radius: 15px;
				border: 1px solid rgb(245, 212, 46);
			}
			
			img:hover{
				animation:changeOpacity 0.5s linear alternate;
			}
		
			h1{
				color:3A2400;
				font-family: "Jua", sans-serif;
			}
			
			
			@keyframes changeOpacity{
            	from{
                	opacity: 1.0;
            	}

            	to{
            	    opacity: 0;
           		 }
        	}
		
		</style>
		</head>
		<body class="worldcup">
		<br/>
		<br/>
		  <div class="box1">
		  	<br/>
			<h1>♥멍상형 월드컵♥</h1>

			<p id="cal"></p>
			<br/>
			<img id="image" onclick="change(0)">
			<img id="images" onclick="change(1)">
			<br/>
			<br/>
		  </div>
		  <br/>
		  <br/>
		  <script src="https://cdn.jsdelivr.net/npm/canvas-confetti@1.5.1/dist/confetti.browser.min.js"></script>
			<script>
			text = "오늘 밤 주인공은 개야 개! 당신의 강아지를 골라주세요.";
			firstEndText= "16강 종료! 계속해서 골라주세요.";
			secondEndText= "8강 종료! 계속해서 골라주세요.";
			thirdEndText= "준결승 종료! 신중하게 골라볼까요?";
			lastEndText= "결승 종료! 당신의 강아지가 선정되었습니다!";
			
			var images = [];
			var sImages = [];
			
			var cnt=0;
			var num=0;
			var sNum=0;
			var cnt2=0;
			var count = 0;
			
			function show(){
				for(i=0; i<16; i++){
					images[i] = i + ".jpg";
				}
				images.sort(function(a,b){return 0.5 - Math.random()});
				showImg(num);
				
			}// end show
		
			show();
		
			function showImg(num){
				document.getElementById('image').src="WCImg/"+images[num];
				if(images.length > 1){
					document.getElementById('images').src="WCImg/"+images[num+1];
				}else{
					document.getElementById('images').style.display = "none";
				}
				cnt2++;
			}// end showImg
		
			function firework() {
				  var duration = 15 * 100;
				  var animationEnd = Date.now() + duration;
				  var defaults = { startVelocity: 25, spread: 360, ticks: 50, zIndex: 0 };
				  //  startVelocity: 범위, spread: 방향, ticks: 갯수

				  function randomInRange(min, max) {
				    return Math.random() * (max - min) + min;
				  }

				  var interval = setInterval(function () {
				    var timeLeft = animationEnd - Date.now();

				    if (timeLeft <= 0) {
				      return clearInterval(interval);
				    }

				    var particleCount = 50 * (timeLeft / duration);
				    // since particles fall down, start a bit higher than random
				    confetti(
				      Object.assign({}, defaults, {
				        particleCount,
				        origin: { x: randomInRange(0.1, 0.3), y: Math.random() - 0.2 }
				      })
				    );
				    confetti(
				      Object.assign({}, defaults, {
				        particleCount,
				        origin: { x: randomInRange(0.7, 0.9), y: Math.random() - 0.2 }
				      })
				    );
				  }, 250);
				}

			
			function change(n){
				if(cnt2 < 20){
					cnt++;
					if(n == 0){
						sImages[sNum++] = images[num];
					}else{
						sImages[sNum++] = images[num+1];
					}
					num+=2;
				}
				showImg(num);
				
				if(cnt == images.length/2){
					for(i=0; i<sImages.length; i++){
						images[i] = sImages[i];
						sImages[i] = null;
					}
					images.splice(cnt);
					cnt = 0;
					num = 0;
					sNum = 0;
					showImg(num);
					
					count++;
					
					if(count == 1){document.getElementById('cal').innerHTML=firstEndText;}
					if(count == 2){document.getElementById('cal').innerHTML=secondEndText;}
					if(count == 3){document.getElementById('cal').innerHTML=thirdEndText;}
					if(count == 4){document.getElementById('cal').innerHTML=lastEndText; firework();}
					
				}
			
			}// end change
			
			
			document.getElementById('cal').innerHTML=text;
			
			</script>
			
		</body>
		</html>
<%@ include file="../footer.jsp" %>