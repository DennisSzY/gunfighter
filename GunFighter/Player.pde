public class Player {
    
    //默认y向下为正，向右为正...
    float x, y; //position,按照图片的右上角算起
    
    final float w = 50; //width
    final float h = 50; //height
    
    //player 的速度信息
    float moveSpeed = 0; //horizontal velocity,朝右为正，朝左为负
    final float maxMoveSpeed = 10;  //水平速度最大值, 是绝对值，使用的时候需要乘以方向系数...
    final float acc = 5; //horizontal acc，水平加速度 ，是绝对值，使用的时候需要乘以方向系数...
    float fallSpeed = 0;
    final float maxFallspeed = 8;
    final float gravity = 2;//vertical acc
    
    //player的状态信息
    //-位置信息
    boolean onPlatform;
    boolean facingRight;
    //射击状态
    boolean isShooting;
    boolean isShooted;
    //
    int id;
    //子弹数量,表示该玩家已经打出去的子弹数量
    ArrayList<Bullet> firedBullets = new ArrayList<>();
    float bulletProduceInterval = 400; // milliseconds
    float lastBulletProduceTime = 0; // milliseconds
    //player的操作键位
    char leftKey,rightKey,upKey,shootKey;
    public void setOpkeys(char leftKey, char rightKey, char upKey, char shootKey) {
        this.leftKey = leftKey;
        this.rightKey = rightKey;
        this.upKey = upKey;
        this.shootKey = shootKey;
    }
    Boolean pressLeftKey = false, pressRightKey = false, pressUpKey = false, pressShootKey = false;
    
    //构造函数
    Player(float x, float y, boolean facingRight, int id) {
        this.x = x;
        this.y = y;
        this.facingRight = facingRight;
        this.id = id;
    }
    
    
    
    void update() {
        if (pressLeftKey && !pressRightKey) {
            moveSpeed += -acc; //update speed
            if (moveSpeed <= -maxMoveSpeed) {moveSpeed = -maxMoveSpeed;} //限制最大速度
            //update position
            if (x + moveSpeed < 0) { x = 0;} //走出屏幕边界了....
            else{ x += moveSpeed;}
            facingRight = false; //update facing direction
        } 
        else if (pressRightKey && !pressLeftKey) {
            moveSpeed += acc;
            if (moveSpeed >= maxMoveSpeed) { moveSpeed = maxMoveSpeed;}
            //走出屏幕边界了....
            if (x + w + moveSpeed >= width) { x = width - w;} 
            else{ x += moveSpeed; }
            facingRight = true;
        }
        
        if (pressUpKey && onPlatform) {
            fallSpeed = -18; //给一个初始的向上跳的速度
            onPlatform = false;
        } else if (!onPlatform) {
            fallSpeed += gravity;
            if (fallSpeed >= maxFallspeed) {fallSpeed = maxFallspeed;}
            y += fallSpeed;
        }
        
        if (pressShootKey) {
            isShooting = true;
            Bullet bullet;
            int right = 1;
            int left = -1;
            if (millis() - lastBulletProduceTime > bulletProduceInterval) {
                if (facingRight) {
                    bullet = new Bullet(this.x + this.w / 2, this.y + 10, right); //这个数值是根据视觉效果在枪口处来调整的
                } else{
                    bullet = new Bullet(this.x + this.w / 2, this.y + 10, left);
                }
                firedBullets.add(bullet);
                lastBulletProduceTime = millis();
            }
        }
        firedBulletsUpdate();
    }
    
    void firedBulletsUpdate() {
        for (int i = firedBullets.size() - 1; i >= 0; i--) {
            Bullet bullet = firedBullets.get(i);
            bullet.update();
            if (bullet.x >= width || bullet.x <= 0) {
                firedBullets.remove(i); 
            }
            bullet.display(this);
        }
    }
    
    
    void landOnPlatform(ArrayList<Platform> platforms) {
        for (int i = 0; i < platforms.size(); i++) {
            Platform platform = platforms.get(i);
            //设计当人物只要有一点在平台上时，就算是在平台上,//添加十个像素，按照脚是否越界来算
            if(collide(platform.x, platform.y, platform.w, platform.h, platform.moveSpeed)){
                return;
            }
        }
        onPlatform = false;
    }  
    
    boolean collide(float platformX, float platformY, float platformWidth, float platformHeight, float platformSpeed) { 
        if (y + h >= platformY && y < platformY + platformHeight && x + w - 10 > platformX && x + 10 < platformX + platformWidth) { //这一帧会相撞
            if (fallSpeed >= platformSpeed) { // while falling
                if (y + h - platformY <= fallSpeed) {
                    //println("landing");
                    y = platformY - h;
                    fallSpeed = 0;
                    onPlatform = true;
                    return true;
                    //更新人物状态图像
                    // switch(id){
                    // case 1 : image = playerBlueDefault;
                    // case 2 : image = playerRedDefault;
                //}
                } 
            }
        }
        return false;
    }  
    
    void collideWithBullet(ArrayList<Bullet> firedBullets) {
        boolean flag = false;
        for (int i = 0; i < firedBullets.size(); i++) {
            Bullet bullet = firedBullets.get(i);
            if (bullet.moveSpeed > 0) {
                if (y + h >= bullet.y + bullet.h && y <= bullet.y && x <= bullet.x + bullet.w) {
                    // harmValue -= bullet.harmValue;
                    x += 70;//击退的值，暂定70//
                    firedBullets.remove(i);
                }
            } else{
                if (y + h >= bullet.y + bullet.h && y <= bullet.y && x + w >= bullet.x) {
                    // harmValue -= bullet.harmValue;
                    x -= 70; //击退
                    firedBullets.remove(i);
                }
            }
            
        }
    }
    
    
    void display() {
        //非射击状态
        if (!isShooting && facingRight) {
            //jump
            if (!onPlatform) {
                switch(id) {
                    case 1 : image(blueJumpRight,x, y, w, h); break;
                    case 2 : image(redJumpRight, x, y, w, h); break;
                }
            }
            //run
            else if (moveSpeed!= 0) {
                switch(id) {
                    case 1 : image(blueRunRight,x, y, w, h); break;
                    case 2 : image(redRunRight, x, y, w, h); break;
                }
            }
            // idle 
            else{  
                switch(id) {
                    case 1 : image(blueIdleRight,x, y, w, h); break;
                    case 2 : image(redIdleRight, x, y, w, h); break;
                }
            }
        } 
        else if (!isShooting && !facingRight) {
            //jump
            if (!onPlatform) {
                switch(id) {
                    case 1 : image(blueJumpLeft,x, y, w, h); break;
                    case 2 : image(redJumpLeft, x, y, w, h); break;
                }
            }
            // run
            else if (moveSpeed!= 0) {
                switch(id) {
                    case 1 : image(blueRunLeft,x, y, w, h); break;
                    case 2 : image(redRunLeft, x, y, w, h); break;
                }
            } 
            // idle
            else{ 
                switch(id) {
                    case 1 : image(blueIdleLeft,x, y, w, h); break;
                    case 2 : image(redIdleLeft, x, y, w, h); break;
                }
            }
            
        } 
        //射击状态
        else if (isShooting) {
            isShooting = false;
            if (facingRight) {
                switch(id) {
                    case 1 : image(blueShootRight,x, y, w, h); break;
                    case 2 : image(redShootRight, x, y, w, h); break;
                }
            } 
            else{
                switch(id) {
                    case 1 : image(blueShootLeft,x, y, w, h); break;
                    case 2 : image(redShootLeft, x, y, w, h); break;
                }
            }
        }
    }
    
}
