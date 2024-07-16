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
		
			*{
				 margin: 0;
  				 box-sizing: border-box;
  				 font-family: "Noto Sans KR", sans-serif;
			}	
			
			.box1 {
				text-align:center;
				background-color:rgb(255,246,189);
			}
		
			img {
				width:400px;
				height:400px;
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
		<body>
		  <div class="box1">
		  	<br/>
			<h1>♥멍상형 월드컵♥</h1>
			<br/>
			<p id="cal"></p>
			<br/>
			<img id="image" onclick="change(0)">
			<img id="images" onclick="change(1)">
			<br/>
			<br/>
		  </div>
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
					if(count == 4){document.getElementById('cal').innerHTML=lastEndText;}
					
				}
			
			}// end change
			
			
			document.getElementById('cal').innerHTML=text;
			
			</script>
			
		</body>
		</html>
<%@ include file="../footer.jsp" %>