<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<%@ include file="header.jsp" %>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>상식 퀴즈</title>
    <style>
    @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap');
    @import url('https://fonts.googleapis.com/css2?family=Jua&display=swap');
    
        .quizBody {
            font-family: font-family: "Noto Sans KR", sans-serif;
            line-height: 1.6;
            background-color: rgb(255,246,189);
            color: #333;
            margin: 0;
            padding: 0;
        }
        
        h2{
        	font-family: "Jua", sans-serif;
        }
        
        main {
            padding: 20px;
            text-align:center;
        }
        
        .quiz-question {
            display: none;
            margin-bottom: 20px;
        }
        
        .quiz-question.active {
            display: block;
        }
        
        .answer1{
        	padding-right:200px
        }
        
        .answer2{
        	padding-right:630px
        }
        
        .answer3{
        	padding-right:360px
        }
        
        .allBox{
        	margin-left:550px;
        	width:750px;
        	background-color: white;
        	border-radius:20px;
        }
        
	button {
	    width: 100px;
	    height: 40px;
	    font-size: 15px;
	    border: 0;
	    border-radius: 5px;
	    padding-left: 10px;
	    background-color: rgb(245, 212, 46);
	    color: white;
	}

	.next:active {
	    transform: scale(0.95);
	    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
	    background-color: FFCC00;
	    transition: 0.2s;
	}

	.next:hover {
		    background-color: ffdc72;
		    cursor: pointer;
		}        
        
    </style>
</head>
<body class="quizBody">
<br/><br/>
    <div class="allBox">
      <main>
      <br/>
       <h2>♥ 멍멍 퀴즈존 ♥</h2>
        <form id="quiz-form" action="mungAnswer.jsp" method="post">
            <div class="quiz-question active">
                <p>1. 정상적인 강아지의 다리 개수는?</p>
             	<div class="answer1">
               	 <label for="q1a1"><input type="radio" name="question1" value="2개" id="q1a1" required>
               	 2개</label><br>
               	 <label for="q1a2"><input type="radio" name="question1" value="3개" id="q1a2">
               	 3개</label><br>
               	 <label for="q1a3"><input type="radio" name="question1" value="4개" id="q1a3">
               	 4개</label><br>
               	 <label for="q1a4"><input type="radio" name="question1" value="5개" id="q1a4">
               	 5개</label>
                </div>
            </div>

            <div class="quiz-question">
                <p>2. 강아지는 무엇으로 시간을 느끼고, 사람의 상태도 알아 볼 수 있을까요?(가장 뛰어난 감각기관)</p>
                <div class="answer2">
               	 <label for="q2a1"><input type="radio" name="question2" value="시각" id="q2a1" required>
               	 시각</label><br>
               	 <label for="q2a2"><input type="radio" name="question2" value="후각" id="q2a2">
               	 후각</label><br>
               	 <label for="q2a3"><input type="radio" name="question2" value="미각" id="q2a3">
               	 미각</label><br>
               	 <label for="q2a4"><input type="radio" name="question2" value="촉각" id="q2a4">
               	 촉각</label>
                </div>
            </div>

            <div class="quiz-question">
                <p>3. 강아지가 평소와 달리 이상증세를 보이면 데려가야 할 곳은?</p>
                <div class="answer3">
              	  <label for="q3a1"><input type="radio" name="question3" value="공원산책" id="q3a1" required>
               	공원산책</label><br>
               	  <label for="q3a2"><input type="radio" name="question3" value="애견카페" id="q3a2">
               	애견카페</label><br>
               	 <label for="q3a3"><input type="radio" name="question3" value="친구네집" id="q3a3">
               	 친구네집</label><br>
               	  <label for="q3a4"><input type="radio" name="question3" value="동물병원" id="q3a4">
               	동물병원</label>
                </div>
            </div>

            <button type="button" onclick="showNextQuestion()" class="next">다음</button>
        </form>
      </main>
      <br/>
    </div>
<br/><br/>
    <script>
        let currentQuestion = 0;

        function showNextQuestion() {
            const questions = document.querySelectorAll('.quiz-question');
            if (currentQuestion < questions.length - 1) {
                questions[currentQuestion].classList.remove('active');
                currentQuestion++;
                questions[currentQuestion].classList.add('active');
            } else {
            	alert('모든 퀴즈를 완료했습니다!');
                document.getElementById('quiz-form').submit();
            }
        }
    </script>
</body>
</html>
<%@ include file="footer.jsp" %>