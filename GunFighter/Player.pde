public class Player {
    
    //Default y down is positive, right is positive...
    float x, y; //position,按Top right corner
    
    final float w = 50; //width
    final float h = 50; //height
    
    //player 的速度信息
    float moveSpeed = 0; //horizontal velocity, Positive towards the right, negative towards the left
    final float maxMoveSpeed = 10;  //Maximum horizontal speed, absolute value, to be used by multiplying by the direction factor....
    final float acc = 5; //horizontal acc，The horizontal acceleration, which is an absolute value, needs to be multiplied by a direction factor when using...
    float fallSpeed = 0;
    final float maxFallspeed = 20;
    final float gravity = 3;//vertical acc
    
    //player status infomation
    //-position
    boolean onPlatform;
    boolean facingRight;
    //shoot status
    boolean isShooting;
    boolean isShooted;
    //
    int id;
    //Number of bullets, indicating the number of bullets the player has fired
    ArrayList<Bullet> firedBullets = new ArrayList<>();
    float bulletProduceInterval = 400; // milliseconds
    float lastBulletProduceTime = 0; // milliseconds
    float platformFallSpeed;
    //The player's operating keys
    char leftKey,rightKey,upKey,shootKey;
    public void setOpkeys(char leftKey, char rightKey, char upKey, char shootKey) {
        this.leftKey = leftKey;
        this.rightKey = rightKey;
        this.upKey = upKey;
        this.shootKey = shootKey;
    }
    Boolean pressLeftKey = false, pressRightKey = false, pressUpKey = false, pressShootKey = false;
    
    //constructor
    Player(float x, float y, boolean facingRight, int id, float platformFallSpeed) {
        this.x = x;
        this.y = y;
        this.facingRight = facingRight;
        this.id = id;
        this.platformFallSpeed = platformFallSpeed;
    }
    
    
    int distance = 0;
    void update() {
     
        if(isShooted){
          //if is shooted
            if(facingRight){
                x -= 30;
                distance += 30;
                if (x  < 0) { x = 0;}
                if (distance == 120) {
                    isShooted = false;
                    audioshooted = false;
                    distance = 0;
                }
            }else{ 
                x += 30;
                distance += 30;
                if (x + w >= width) { x = width - w;} 
                if (distance == 120) {
                    isShooted = false;
                    distance = 0;
                }
            }
        }else{
          //not be shooted
            if (pressLeftKey && !pressRightKey) {
              //towards left
                moveSpeed += -acc; //update speed
                if (moveSpeed <= -maxMoveSpeed) {moveSpeed = -maxMoveSpeed;} //限制最大速度
                //update position
                if (x + moveSpeed < 0) { x = 0;} //走出屏幕边界了....
                else{ x += moveSpeed;}
                facingRight = false; //update facing direction
            } 
            else if (pressRightKey && !pressLeftKey) {
              //towards right
                moveSpeed += acc;
                if (moveSpeed >= maxMoveSpeed) { moveSpeed = maxMoveSpeed;}
                //走出屏幕边界了....
                if (x + w + moveSpeed >= width) { x = width - w;} 
                else{ x += moveSpeed; }
                facingRight = true;
            }
            
            if (pressUpKey && onPlatform) {
              //press up key - jump
                fallSpeed = -40; //Give an initial upward jump speed
                onPlatform = false;
            } else if (!onPlatform) {
                fallSpeed += gravity;
                if (fallSpeed >= maxFallspeed) {fallSpeed = maxFallspeed;}
                y += fallSpeed;
            }
            
            if (pressShootKey) {
              //shoo
                isShooting = true;
                Bullet bullet;
                int right = 1;
                int left = -1;
                if (millis() - lastBulletProduceTime > bulletProduceInterval) {
                    if (facingRight) {
                        bullet = new Bullet(this.x + this.w / 2, this.y + 10, right, platformFallSpeed+0.1); //This value is adjusted according to the visual effect at the muzzle
                    } else{
                        bullet = new Bullet(this.x + this.w / 2, this.y + 10, left, platformFallSpeed+0.1);
                    }
                    firedBullets.add(bullet);
                    lastBulletProduceTime = millis();
                }
            }
            firedBulletsUpdate();
        }
    }
    
    //bullet status update
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
    
    
    //check it is land on the platform
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
    
    //check it is collide - player is land on the platform
    boolean collide(float platformX, float platformY, float platformWidth, float platformHeight, float platformSpeed) { 
        if (y + h >= platformY && y < platformY + platformHeight && x + w - 10 > platformX && x + 10 < platformX + platformWidth) { //这一帧会相撞
            if (fallSpeed >= platformSpeed) { // while falling
                if (y + h - platformY <= fallSpeed) {
                    //println("landing");
                    y = platformY - h;
                    fallSpeed = platformSpeed;
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
    
    //check player is shooted
    void collideWithBullet(ArrayList<Bullet> firedBullets) {
        //boolean flag = false;
        for (int i = 0; i < firedBullets.size(); i++) {
            Bullet bullet = firedBullets.get(i);
            if (bullet.moveSpeed > 0) {
                if (y + h >= bullet.y + bullet.h && y <= bullet.y && x <= bullet.x + bullet.w) {
                    isShooted = true;
                    audioshooted = true;
                    facingRight = false;
                    // x += 70;//向右击退,脸朝左，暂定70//
                    //加载向左的击退图像
                    firedBullets.remove(i);
                }
            } else{
                if (y + h >= bullet.y + bullet.h && y <= bullet.y && x + w >= bullet.x) {
                    isShooted = true;
                    facingRight = true;
                    // x -= 70; //向左击退
                    firedBullets.remove(i);
                }
            }
            
        }
    }
    
    
    void display() {
        //State of being hit
        if (isShooted) {
            if (facingRight) {
                switch(id) {
                    case 1 : image(playerBlueShooted, x, y, w, h); break;
                    case 2 : image(playerRedShooted, x, y, w, h); break;
                }
            } else{
                switch(id) {
                    case 1 : image(playerBlueShootedLeft, x, y, w, h); break;
                    case 2 : image(playerRedShootedLeft, x, y, w, h); break;
                }
            }
        }
        //Non-shooting status
        else if (!isShooting && facingRight) {
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
        //shooting status
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
