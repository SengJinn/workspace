export class Ball {
    constructor(r, canvasWidth, canvasHeight, bar, blocks, updateScoreCallback, endGameCallback, speed) {
        this.x = 0;
        this.y = 0;
        this.r = r;

        this.canvasWidth = canvasWidth;
        this.canvasHeight = canvasHeight;

        this.vx = (Math.random() * 2 + 1) * speed / 5;
        this.vy = -speed;

        this.bar = bar;
        this.blocks = blocks;

        this.isGameStart = false;
        this.isGameOver = false;

        this.image = new Image();
        this.image.crossOrigin = "anonymous";
        this.image.src = 'https://storage.googleapis.com/sticker-prod/ZW1T6zYOaVZmvnKF1aHl/17-1.png'; 

        this.image.onload = () => {
            console.log("Image loaded successfully");
        };
        this.image.onerror = () => {
            console.error("Failed to load image");
        };

        this.updateScoreCallback = updateScoreCallback;
        this.endGameCallback = endGameCallback;
    }

    collisionBar() {
        const minX = this.bar.x - this.r;
        const maxX = this.bar.x + this.bar.width + this.r;
        const minY = this.bar.y - this.r;

        if (this.x >= minX && this.x <= maxX && this.y >= minY) {
            this.y = this.bar.y - this.r;
            this.vy *= -1;
        }
    }

    collisionCanvas() {
        if (this.x <= this.r) {
            this.x = this.r;
            this.vx *= -1;
        } else if (this.x + this.r >= this.canvasWidth) {
            this.x = this.canvasWidth - this.r;
            this.vx *= -1;
        }

        if (this.y <= this.r) {
            this.y = this.r;
            this.vy *= -1;
        }

        if (this.y + this.r >= this.canvasHeight) {
            this.isGameStart = false;
            this.isGameOver = true;
            this.endGameCallback();
        }
    }

    collisionBlock() {
        this.blocks = this.blocks.reduce((prev, block) => {
            const minX = block.x - this.r;
            const maxX = block.x + block.width + this.r;
            const minY = block.y - this.r;
            const maxY = block.y + block.height + this.r;

            if (this.x >= minX && this.x <= maxX && this.y >= minY && this.y <= maxY) {
                const distX = Math.min(Math.abs(this.x - minX), Math.abs(this.x - maxX));
                const distY = Math.min(Math.abs(this.y - minY), Math.abs(this.y - maxY));

                if (distX >= distY) {
                    this.vy *= -1;
                    this.y += this.vy;
                } else {
                    this.vx *= -1;
                    this.x += this.vy;
                }

                this.updateScoreCallback(5);
            } else {
                prev.push(block);
            }

            return prev;
        }, []);
    }

    draw(ctx, blocks) {
        if (!this.isGameStart) {
            this.x = this.bar.x + this.bar.width / 2;
            this.y = this.bar.y - this.r;
        } else {
            this.x += this.vx;
            this.y += this.vy;
        }

        if (!this.isGameOver) {
            this.collisionBar();
            this.collisionCanvas();
            this.collisionBlock();
        }

        const sizeMultiplier = 6;
        ctx.drawImage(this.image, this.x - this.r * sizeMultiplier, this.y - this.r * sizeMultiplier, this.r * 2 * sizeMultiplier, this.r * 2 * sizeMultiplier);

        this.blocks.forEach((block) => {
            block.draw(ctx);
        });
    }
}