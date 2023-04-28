class Bullet {
    float x, y;
    float moveSpeed = 15;
    float fallSpeed = 1.1;
    float h = 8;
    float w = 40;
    PImage image;
    
    //初始化初始位置+初始速度，速度是定值，这里主要是为了给定方向
    Bullet(float x, float y, int directionValue) {
        this.x = x;
        this.y = y;
        this.moveSpeed = directionValue * this.moveSpeed;
    }
    
    //子弹的位置更新
    void update() {
        this.x = this.x + this.moveSpeed;
        this.y = this.y + this.fallSpeed;
    }
    
    //子弹的显示
    void display(Player player) {
        if (moveSpeed > 0) {
            switch(player.id) {
                case 1 : image = bulletBlueRight;break;
                case 2 : image = bulletRedRight;break;
            }
        } else{
            switch(player.id) {
                case 1 : image = bulletBlueLeft;break;
                case 2 : image = bulletRedLeft;break;
            }
        }
        image(this.image, this.x, this.y, this.w, this.h);
    }
    
}
