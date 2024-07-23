export class Bar {
    constructor(x, canvasWidth, canvasHeight, level) {
        switch(level) {
            case 'easy':
                this.width = 100;
                break;
            case 'medium':
                this.width = 70;
                break;
            case 'hard':
                this.width = 40;
                break;
        }
        this.height = 20;
        
        this.x = x;
        this.y = canvasHeight - this.height;
        
        this.vx = 0;
        this.canvasWidth = canvasWidth;
        
        this.fillColor = "#A4A4A4";
    }
    
    draw(ctx){
        this.x += this.vx;

        if(this.x < 0){ this.x = 0; }
        if(this.x + this.width > this.canvasWidth){ this.x = this.canvasWidth - this.width; }
            
        ctx.fillStyle = this.fillColor;
        ctx.beginPath();
        ctx.fillRect(this.x, this.y, this.width, this.height);
    }
}