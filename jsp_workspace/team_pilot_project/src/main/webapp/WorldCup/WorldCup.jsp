<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!--  contentType에 charset=UTF-8 이 지정되어있으면  
		pageEncoding="UTF-8" 은 필요없다.-->
		<!DOCTYPE html>
		<html>
		<head>
		<meta charset="UTF-8">
		<title>멍상형 월드컵</title>
		<style>		
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
				color:white;
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
			<h1>멍상형 월드컵</h1>
			<p id="cal"></p>
			<img id="image" onclick="change(0)">
			<img id="images" onclick="change(1)">
		  </div>
			<script>
			text = "";
			var images = [];
			var sImages = [];
			
			var cnt=0;
			var num=0;
			var sNum=0;
			var cnt2=0;
			
			function show(){
				for(i=0; i<16; i++){
					images[i] = i + ".jpg";
				}
				images.sort(function(a,b){return 0.5 - Math.random()});
				showImg(num);
				
			}// end show
		
			show();
		
			function showImg(num){
				document.getElementById('image').src="../WCImg/"+images[num];
				if(images.length > 1){
					document.getElementById('images').src="../WCImg/"+images[num+1];
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
				}
		
			}// end change
		
			document.getElementById('cal').innerHTML=text;
			
			</script>
			
		</body>
		</html>