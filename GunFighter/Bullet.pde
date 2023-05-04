class Bullet {
    float x, y;
    float moveSpeed = 20;
    float fallSpeed = 2.1;
    float h = 8;
    float w = 40;
    PImage image;
    
        // Initial position + initial velocity, the velocity is a fixed value, here it is mainly for the given direction
    Bullet(float x, float y, int directionValue,float fallSpeed) {
        this.x = x;
        this.y = y;
        this.moveSpeed = directionValue * this.moveSpeed;
        this.fallSpeed = fallSpeed;
    }
    
    //Bullet location update
    void update() {
        this.x = this.x + this.moveSpeed;
        this.y = this.y + this.fallSpeed;
    }
    
    //Display of bullets
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
