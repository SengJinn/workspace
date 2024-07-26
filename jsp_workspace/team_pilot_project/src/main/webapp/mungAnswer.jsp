<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>퀴즈 결과</title>
<style>
    @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap');
    @import url('https://fonts.googleapis.com/css2?family=Jua&display=swap');
    
	body{
		   font-family: font-family: "Noto Sans KR", sans-serif;
            line-height: 1.6;
            background-color: rgb(255,246,189);
            color: #333;
            margin: 0;
            padding: 0;
	}
	
	main{
		text-align:center;
	}
	

	button {
	    width: 130px;
	    height: 40px;
	    font-size: 15px;
	    border: 0;
	    border-radius: 5px;
	    padding-left: 10px;
	    background-color: rgb(245, 212, 46);
	    color: white;
	}

	button:active {
	    transform: scale(0.95);
	    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
	    background-color: FFCC00;
	    transition: 0.2s;
	}

	button:hover {
		    background-color: ffdc72;
		    cursor: pointer;
		}        
        
    
    .allBox{
    	 padding-top:30px;
    	 padding-bottom:0;
    	 margin-bottom:0;
         margin-left:550px;
         width:750px;
         height:330px;
         background-color: white;
         border-radius:20px;
    }
    
    h2{
    	font-family: "Jua", sans-serif;
    }
     
</style>


</head>
<body>     
<br/> <br/>
   <div class="allBox">
    <main>
    <br/>
     <h2>퀴즈 결과</h2>
     
        <%
            String answer1 = request.getParameter("question1");
            String answer2 = request.getParameter("question2");
            String answer3 = request.getParameter("question3");

            int score = 0;

            if ("4개".equals(answer1)) {
                score++;
            }
            if ("후각".equals(answer2)) {
                score++;
            }
            if ("동물병원".equals(answer3)) {
                score++;
            }
        %>
        <h2>당신의 점수는: <%= score %> / 3</h2>
        <%
            if (score == 3) {
        %>
            <p>축하합니다! 모든 질문에 정답을 맞추셨습니다.</p>
        <%
            } else {
        %>
            <p>아쉽지만, 더 공부하셔야겠네요.</p>
        <%
            }
        %>
        <button type="button" onclick="location.href='mungQuiz.jsp'">다시 도전하기</button>
    </main>
   </div>
<br/><br/>
</body>
</html>
<%@ include file="footer.jsp" %>