class Player {
  float x, y; //position
  float w = 50; //width
  float h = 50; //height
  float vx = 5; //horizontal acc
  float moveSpeed = 0; //horizontal velocity
  float fallspeed = 4;
  float gravity = 0.5;
  float vy = 0;
  boolean onplatform = false;
  boolean facingRight;
  boolean shooting = false;
  Boolean keyLeft = false, keyRight = false, keyDown = false, keyUp = false, keyShoot = false;
  int id;
  ArrayList<Bullet> bullets = new ArrayList<>();
  
  float bulletProduceInterval = 400; // milliseconds
  float lastBulletProduceTime = 0; // milliseconds
  
  Player(float x, float y, boolean facingRight, int id){
    this.x = x;
    this.y = y;
    this.facingRight = facingRight;
    this.id = id;
  }
  
  
  void update(){
    if(keyLeft && !keyRight){
      moveSpeed = -vx;
      if(x + moveSpeed < 0){
        this.x = 0;
      }else{
        this.x += moveSpeed;
      }
      facingRight = false;
    }else if(keyRight && !keyLeft){
      moveSpeed = vx;
      if(x + w + moveSpeed >= width){
        this.x = width - w;
      }else{
        this.x += moveSpeed;
      }
      facingRight = true;
    }
    
    if(keyUp && onplatform){
      this.vy = -14;
      this.onplatform = false;
    }
    
    if(!onplatform){
      //collide(platforms);
      this.vy += gravity;
      if(this.vy >= 0){
        this.vy = fallspeed;
      }
      this.y += this.vy;
    }else{
      this.vy = 1;
      this.y += this.vy;
    }
    
    if(keyShoot){
      shooting = true;
      Bullet bullet;
      
      if(bullets.size() <= 8 && millis() - lastBulletProduceTime > bulletProduceInterval){
        if(facingRight){
          bullet = new Bullet(this.x + this.w/2, this.y + 10, 4, this.id);
        }else{
          bullet = new Bullet(this.x + this.w/2, this.y + 10, -4, this.id);
        }
      
        bullets.add(bullet);
        lastBulletProduceTime = millis();
      }
      
    }
    
    bulletUpdate();
    
  }
  
  void bulletUpdate(){
    for(int i = bullets.size()-1; i >= 0; i--){
      Bullet bullet = bullets.get(i);
      bullet.update();
      if(bullet.x >= width || bullet.x <= 0){
       bullets.remove(i); 
      }
      bullet.display();
      
    }
  }
  
  
  void collide(ArrayList<Platform> platforms){
    boolean flag = false;
    for(int i = 0; i < platforms.size(); i++){
      Platform platform = platforms.get(i);
      if(y + h >= platform.y - 1 && y + h <= platform.y + 1 && x + w >= platform.x && x <= platform.x + platform.w && vy > 0){
        y = platform.y - h;
        onplatform = true;
        flag = true;
      }
    }
    
    if(!flag){
      onplatform = false;
    }
  }
  
  
  void updateImage(){
     if (vy == 1 && !shooting) {
      // idle
      if (facingRight) {
        if(id == 1){
          image(BlueidleRight, x, y, w, h);
        }else{
          image(RedidleRight, x, y, w, h);
        }
      } else {
        if(id == 1){
          image(BlueidleLeft, x, y, w, h);
        }else{
          image(RedidleLeft, x, y, w, h);
        }
      }
    } else if (moveSpeed != 0 && vy == 1 && !shooting) {
      // run
      if (facingRight) {
        if(id == 1){
          image(BluerunRight, x, y, w, h);
        }else{
          image(RedrunRight, x, y, w, h);
        }
      } else {
        if(id == 1){
          image(BluerunLeft, x, y, w, h);
        }else{
          image(RedrunLeft, x, y, w, h);
        }
      }
    } else if (vy != 1 && !shooting) {
      // jump
      if (facingRight) {
        if(id == 1){
          image(BluejumpRight, x, y, w, h);
        }else{
          image(RedjumpRight, x, y, w, h);
        }
      } else {
        if(id == 1){
          image(BluejumpLeft, x, y, w, h);
        }else{
          image(RedjumpLeft, x, y, w, h);
        }
      }
    } else if (shooting) {
      // shooting
      shooting = false;
      if (facingRight) {
        if(id == 1){
          image(BlueshootRight, x, y, w, h);
        }else{
          image(RedshootRight, x, y, w, h);
        }
      } else {
        if(id == 1){
          image(BlueshootLeft, x, y, w, h);
        }else{
          image(RedshootLeft, x, y, w, h);
        }
      }
    }
  }
  
  
}

  

  

  
