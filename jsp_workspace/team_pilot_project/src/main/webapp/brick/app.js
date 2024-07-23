import { Block } from "./block.js";
import { Bar } from "./bar.js";
import { Ball } from "./ball.js";

class App {
    constructor(level) {
        this.level = level; // 난이도 저장
        this.canvas = document.getElementById("gameCanvas");
        this.ctx = this.canvas.getContext("2d");

        this.showInstructions = true; // 게임 설명 표시 여부
        this.startTime = null; // 게임 시작 시간

        this.initializeGame();
        
        const moveSpeed = 10;

        window.addEventListener('keydown', (e) => {
            // 오른쪽
            if (e.key === "ArrowRight") { this.bar.vx = moveSpeed; }
            // 왼쪽
            if (e.key === "ArrowLeft") { this.bar.vx = -moveSpeed; }
            // 스페이스바
            if (e.key === " ") { 
                this.ball.isGameStart = true;
                this.showInstructions = false; // 게임 설명 숨김
                if (!this.startTime) { // 게임 시작 시간 기록
                    this.startTime = new Date().getTime();
                }
            }
        });

        window.addEventListener('keyup', (e) => {
            if (e.key === "ArrowRight" || e.key === "ArrowLeft") { this.bar.vx = 0; }
        });

        window.requestAnimationFrame(this.animate.bind(this));
    }

    initializeGame() {
        const blockWidth = 50;
        const blockHeight = 20;

        this.blocks = [];
        for (let i = 0; i <= this.canvas.width - blockWidth; i += blockWidth) {
            for (let j = 50; j <= 200; j += blockHeight) {
                this.blocks.push(new Block(i, j));
            }
        }

        this.bar = new Bar(100, this.canvas.width, this.canvas.height, this.level);

        this.score = 0;
        this.isGameOver = false;

        // 난이도에 따라 공의 스피드 설정
        let ballSpeed;
        switch(this.level) {
            case 'easy':
                ballSpeed = 7; // 초수
                break;
            case 'medium':
                ballSpeed = 10; // 중수
                break;
            case 'hard':
                ballSpeed = 11; // 고수
                break;
            default:
                ballSpeed = 7; // 기본값
        }

        this.ball = new Ball(10, this.canvas.width, this.canvas.height, this.bar, this.blocks, this.updateScore.bind(this), this.endGame.bind(this), ballSpeed);
    }

    draw() {
        this.ctx.fillStyle = "#070B19"; // 배경색
        this.ctx.fillRect(0, 0, this.canvas.width, this.canvas.height);

        this.bar.draw(this.ctx);
        this.ball.draw(this.ctx);

        // 점수 표시
        this.ctx.fillStyle = "#FFFFFF";
        this.ctx.font = "16px Arial";
        this.ctx.fillText("Score: " + this.score, 10, 20);

        // 게임 설명 표시
        if (this.showInstructions) {
            this.ctx.fillStyle = "#FFFFFF";
            this.ctx.font = "14px Arial"; // 글자 크기 줄임
            this.ctx.fillText("스페이스바를 누르면 벽돌 깨기 게임이 시작됩니다.", 50, this.bar.y - 60); // 위치를 조금 더 위로
            this.ctx.fillText("화살표 좌우 키를 이용해 바를 움직여보세요!", 60, this.bar.y - 40); // 위치를 조금 더 위로
        }
    }

    animate() {
        this.draw();
        if (!this.isGameOver) {
            window.requestAnimationFrame(this.animate.bind(this));
        }
    }

    updateScore(points) {
        this.score += points;
    }

    endGame() {
        this.isGameOver = true;
        this.ctx.fillStyle = "#FFFFFF";
        this.ctx.font = "24px Arial";
        this.ctx.fillText("Game Over", this.canvas.width / 2 - 60, this.canvas.height / 2);
        this.ctx.fillText("Your Score: " + this.score, this.canvas.width / 2 - 70, this.canvas.height / 2 + 30);

        // 게임 종료 시간 계산
        const endTime = new Date().getTime();
        const elapsedTime = ((endTime - this.startTime) / 1000).toFixed(2); // 경과 시간 (초 단위)

        this.ctx.fillText("Time: " + elapsedTime + " seconds", this.canvas.width / 2 - 70, this.canvas.height / 2 + 60);

        // RESTART
        const restartButton = document.createElement("button");
        restartButton.id = "restartButton";
        restartButton.innerText = "RESTART";
        restartButton.style.position = "absolute";
        restartButton.style.top = `${this.canvas.height / 2 + 90}px`;
        restartButton.style.left = `${this.canvas.width / 2 - 50}px`;
        restartButton.style.padding = "10px 20px";
        restartButton.style.fontSize = "16px";
        restartButton.style.cursor = "pointer";
        restartButton.style.backgroundColor = "transparent";
        restartButton.style.color = "white";
        restartButton.style.fontWeight = "bold";
        restartButton.style.border = "none";
        restartButton.style.transition = "background-color 0.5s";
        restartButton.onmouseover = () => restartButton.style.backgroundColor = "rgba(255, 255, 255, 0.2)";
        restartButton.onmouseout = () => restartButton.style.backgroundColor = "transparent";

        document.body.appendChild(restartButton);

        restartButton.addEventListener('click', () => {
            document.body.removeChild(restartButton);
            this.startTime = null; // 게임 시작 시간 초기화
            this.initializeGame();
            window.requestAnimationFrame(this.animate.bind(this));
        });
    }
}

window.onload = () => {
    const urlParams = new URLSearchParams(window.location.search);
    const level = urlParams.get('level');

    if (level) {
        new App(level);
    }
}