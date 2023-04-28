class Bullet {
    float x, y;
    float moveSpeed = 4;
    float h = 8;
    float w = 40;
    int harmValue = 2; //伤害值
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
    }
    
    //子弹的显示
    void display(View view, Player player) {
        if (moveSpeed > 0) {
            switch(player.id) {
                case 1 : image = view.bulletBlueRight;break;
                case 2 : image = view.bulletRedRight;break;
            }
        } else{
            switch(player.id) {
                case 1 : image = view.bulletBlueLeft;break;
                case 2 : image = view.bulletRedLeft;break;
            }
        }
        image(this.image, this.x, this.y, this.w, this.h);
    }
    
}
