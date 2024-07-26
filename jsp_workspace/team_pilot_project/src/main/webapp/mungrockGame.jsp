<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>피하기 게임</title>
    <style>
 
.gameArea{
	margin:0;
	padding: 0;
	background-color:rgb(255,246,189);
}    
   
#gameArea {
    width: 800px;
    height: 600px;
    border: 1px solid #000;
    position: relative;
    overflow: hidden;
    background-image: url('grass.png'); 
    background-size: cover;
	margin-left: 550px;
	
}

#dog {
    width: 70px;
    height: 70px;
    position: absolute;
    bottom: 10px;
    left: 375px;
    background-image: url('mungdog.png'); 
    background-size: cover;
}

.rock, .bone {
    width: 70px;
    height: 70px;
    position: absolute;
    top: 0;
}

.rock {
    background-image: url('cage.png'); 
    background-size: cover;
}

.bone {
    background-image: url('mungbone.png'); 
    background-size: cover;
}

#score {
    position: absolute;
    top: 10px;
    left: 10px;
    font-size: 24px;
    font-weight: bold;
}

#timer { 
    position: absolute;
    top: 10px;
    right: 10px;
    font-size: 24px;
    font-weight: bold;
}
</style>
</head>
<br/>
<br/>
<br/>
<body class="gameArea">
    <div id="gameArea">
        <div id="dog"></div>
        <div id="score">점수: 0</div>
        <div id="timer">남은 시간: 60</div> <!-- 남은 시간을 표시할 div 추가 -->
    </div>
    <br/>
    <br/>
    <br/>
</body>

<script>
let gameArea = document.getElementById('gameArea');
let dog = document.getElementById('dog');
let scoreElement = document.getElementById('score');
let timerElement = document.getElementById('timer'); // 남은 시간을 표시할 요소
let score = 0;
let gameInterval;
let objectInterval;
let timerInterval;

// 속도 조정
let fallingSpeed = 20; // 떨어지는 속도 증가
let createObjectInterval = 350; // 객체 생성 간격을 500ms로 줄임
let gameDuration = 60; // 게임 지속 시간 60초
let remainingTime = gameDuration; // 남은 시간 초기화

document.addEventListener('mousemove', (event) => {
    let gameAreaRect = gameArea.getBoundingClientRect();
    let dogWidth = dog.offsetWidth;
    let mouseX = event.clientX - gameAreaRect.left;

    if (mouseX < 0) mouseX = 0;
    if (mouseX > gameAreaRect.width - dogWidth) mouseX = gameAreaRect.width - dogWidth;

    dog.style.left = mouseX + 'px';
});

function startGame() {
    gameInterval = setInterval(updateGame, 20);
    objectInterval = setInterval(createFallingObject, createObjectInterval);
    timerInterval = setInterval(updateTimer, 1000); // 1초마다 타이머 업데이트
}

function updateGame() {
    let objects = document.querySelectorAll('.rock, .bone');
    objects.forEach((object) => {
        let objectRect = object.getBoundingClientRect();
        let dogRect = dog.getBoundingClientRect();

        if (objectRect.bottom >= dogRect.top &&
            objectRect.right >= dogRect.left &&
            objectRect.left <= dogRect.right) {

            if (object.classList.contains('rock')) {
                gameOver();
            } else if (object.classList.contains('bone')) {
                score += 10;
                scoreElement.innerText = '점수: ' + score;
                object.remove();
            }
        }

        if (objectRect.top >= gameArea.offsetHeight) {
            object.remove();
        } else {
            object.style.top = (object.offsetTop + fallingSpeed) + 'px'; // 떨어지는 속도 적용
        }
    });
}

function createFallingObject() {
    let object = document.createElement('div');
    if (Math.random() < 0.7) {
        object.classList.add('rock');
    } else {
        object.classList.add('bone');
    }
    object.style.left = Math.random() * (gameArea.offsetWidth - 30) + 'px';
    gameArea.appendChild(object);
}

function updateTimer() {
    remainingTime--;
    timerElement.innerText = '남은 시간: ' + remainingTime;
    if (remainingTime <= 0) {
        gameOver();
    }
}

function gameOver() {
    clearInterval(gameInterval);
    clearInterval(objectInterval);
    clearInterval(timerInterval);
    let username = prompt("게임 오버! 사용자 이름을 입력하세요:");
    if (username) {
        saveScore(username, score);
    } else {
        alert('점수가 저장되지 않았습니다.');
        window.location.reload();
    }
}

function saveScore(username, score) {
    let xhr = new XMLHttpRequest();
    xhr.open("POST", "saveScore.jsp", true);
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xhr.onreadystatechange = function() {
        if (xhr.readyState === 4 && xhr.status === 200) {
            alert("점수가 저장되었습니다.");
            location.replace('mungRanking.jsp');
        }
    };
    xhr.send("username=" + encodeURIComponent(username) + "&score=" + score);
}

startGame();
</script>
</html>

<%@ include file="footer.jsp"%>