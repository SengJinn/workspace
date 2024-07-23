<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<%@ include file="header.jsp" %>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>상식 퀴즈</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            background-color: #f8f8f8;
            color: #333;
            margin: 0;
            padding: 0;
        }
        header {
            background-color: #333;
            color: #fff;
            text-align: center;
            padding: 10px 0;
        }
        main {
            padding: 20px;
        }
        .quiz-question {
            display: none;
            margin-bottom: 20px;
        }
        .quiz-question.active {
            display: block;
        }
        button {
            padding: 10px 20px;
            background-color: #333;
            color: #fff;
            border: none;
            cursor: pointer;
        }
        button:hover {
            background-color: #555;
        }
    </style>
</head>
<body>
    <header>
        <h1>멍멍 퀴즈존</h1>
    </header>
    <main>
        <form id="quiz-form" action="mungAnswer.jsp" method="post">
            <div class="quiz-question active">
                <p>1. 대한민국의 수도는?</p>
                <input type="radio" name="question1" value="서울" id="q1a1" required>
                <label for="q1a1">서울</label><br>
                <input type="radio" name="question1" value="부산" id="q1a2">
                <label for="q1a2">부산</label><br>
                <input type="radio" name="question1" value="대구" id="q1a3">
                <label for="q1a3">대구</label><br>
                <input type="radio" name="question1" value="인천" id="q1a4">
                <label for="q1a4">인천</label>
            </div>

            <div class="quiz-question">
                <p>2. 지구의 자전 주기는?</p>
                <input type="radio" name="question2" value="24시간" id="q2a1" required>
                <label for="q2a1">24시간</label><br>
                <input type="radio" name="question2" value="12시간" id="q2a2">
                <label for="q2a2">12시간</label><br>
                <input type="radio" name="question2" value="36시간" id="q2a3">
                <label for="q2a3">36시간</label><br>
                <input type="radio" name="question2" value="48시간" id="q2a4">
                <label for="q2a4">48시간</label>
            </div>

            <div class="quiz-question">
                <p>3. 태양계의 행성 중 가장 큰 행성은?</p>
                <input type="radio" name="question3" value="목성" id="q3a1" required>
                <label for="q3a1">목성</label><br>
                <input type="radio" name="question3" value="토성" id="q3a2">
                <label for="q3a2">토성</label><br>
                <input type="radio" name="question3" value="지구" id="q3a3">
                <label for="q3a3">지구</label><br>
                <input type="radio" name="question3" value="화성" id="q3a4">
                <label for="q3a4">화성</label>
            </div>

            <button type="button" onclick="showNextQuestion()">다음</button>
        </form>
    </main>

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