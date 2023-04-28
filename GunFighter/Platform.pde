class Platform {
    private float x, y;//platform的初始位置x,y(左上角的点)
    private float w, h;//platform的宽度，高度
    private float moveSpeed; //move speed,1 by default.方向向下
    private PImage image; //platform的显示图像
    
    Platform(float x, float y, float w, float h, PImage image) {
        moveSpeed = 1; 
        this.x = x;
        this.y = y;
        this.w = w;
        this.h = h;
        this.image = image;
    }
    
    void display() {
        image(this.image, this.x, this.y, this.w, this.h);
    }
    
    void update() {
        this.y += moveSpeed; //向上移动，更新y的位置
    }
    
    void setmoveSpeed(int moveSpeed) {
        this.moveSpeed = moveSpeed;
    }
}
