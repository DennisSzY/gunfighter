//画布大小1920 X 1080 P
final int scrollConstrainX = 1920;
final int scrollConstrainY  = 1080;

// 每个player都是长宽为50px 的实体
//向上为负，向下为正
class Player
{
  float x,y; //显示位置, gif 物理中心点
  float vx = 0; //横向移动速度 
  float vy = 0; //纵向移动速度
  float g = 0.7; //纵向加速度
  float maxSpeed = 4; //主要是保证纵向最大下落速度
  float h = 25; //实体的高度/2
  float w = 25; //实体的宽度/2
  float cooldown = 0;
  float cooldownTime = 20;
  //初始状态
  boolean facingRight;
  boolean onPlatform = true;
  
  //构造函数-初始化位置、朝向
  Player(float x, float y, boolean facingRight){
    this.x = x;
    this.y = y;
    this.facingRight = facingRight;
  }
  //显示（图片+ 位置）
  void display(Gif image){
    imageMode(CENTER);
    image(image, x, y);
  }  
  //判断实体之间是否重叠
  boolean isOverlap(float platformX,float platformY,float platformW,float platformH){
    // condition for overlap 重叠
    //实体底部低于平台顶部，顶部高于平台底部
    //右面超过平台的左边，左边超过平台的右边
    //
    return ((this.y + this.h >= platformY - platformH && this.y - this.h <=  platformY + platformH )&&
              this.x + this.w -10 >=  platformX - platformW && this.x - this.w + 10 <=  platformX + platformW); //添加十个像素，按照脚是否越界来算
  }
  //与平台的关系？ 是否单独新增类
  void collide(float platformX,float platformY,float platformW,float platformH,int platformType) {
    if (platformType == 2){ // exit type
        //nextLevel = true; //死亡？？？
        return;
     }
    // condition for overlap 和平台交叉
    if (this.isOverlap(platformX,platformY,platformW,platformH)) { //这一帧会相撞
      if (this.vy >= 0) { // while falling
          // the condition for the previous frame being above the platfom 判断前一帧在平台上方，则是正常掉落，否则则为撞击边缘
          if ((this.y + this.h) -(platformY - platformH) <= this.vy) {
            //println("landing");
            this.y = platformY - platformH - this.h;
            this.vy = 0;
            this.onPlatform = true;
            //更新人物状态图像
            playerBlueImage = playerBlueDefault;
          }else { // hitting side of platform while falling 撞到边了 
            // println("falling side");
            this.vx = 0; // stop sideways motion
            if (this.x < platformX) {
              this.x = platformX -platformW - this.w; // left side collide
            }else {
              this.x = platformX + platformW + this.w; // right side collide
            }
          }
        }else { // while rising
          // bumping under platform, stop
          if ((platformY + platformH) - (this.y - this.h) < -this.vy) {
            //println("head bump");
            this.vy = 0;
            this.y = platformY + platformH + 1;
          } else { // hitting side of platform while rising
            //println("rising side");
            this.vx = 0;
            if (this.x < platformX) this.x =  platformX - this.w - 1; // left side collide
            else this.x = platformX + platformW + 1; // right side collide
          }
       
      } 
    }
  }
  
  //运动状态更新
  void update(){
     // left right motion
    if (keyLeft && !keyRight) {
      this.facingRight = false;
      this.vx = constrain(this.vx - 1, -this.maxSpeed, 0);
      this.x = constrain(this.x + this.vx, 0, scrollConstrainX);
      playerBlueImage = playerBlueMoveLeft;
    } else if (keyRight && !keyLeft) {
      this.facingRight = true;
      this.vx = constrain(this.vx + 1, 0, this.maxSpeed);
      this.x = constrain(this.x + this.vx, 0, scrollConstrainX);
      playerBlueImage = playerBlueMoveRight;
    } else{
      if (abs(this.vx) > 0.5) this.vx *= 0.5;
      else this.vx = 0;
      if(!facingRight){
        playerBlueImage = playerBlueFacingLeft;
      }else{
        playerBlueImage = playerBlueDefault;
      }
    }
    if (keyUp && this.onPlatform) {
      this.vy = -15;
      this.onPlatform = false;
    }
    if (!this.onPlatform) {
      if(keyRight && !keyLeft){
        playerBlueImage = playerBlueJumpRight;
      }else if(!keyRight && keyLeft){
        playerBlueImage = playerBlueJumpLeft;
      }else if(!facingRight){
        playerBlueImage = playerBlueJumpFacingLeft;
      }else{
        playerBlueImage = playerBlueJump;
      }  
      this.vy += this.g;
    }
    //y=constrain(y+vy,0,height-h);
    this.y = this.y + this.vy;

    // shooting
    if (keyShoot ) {
      this.cooldown = this.cooldownTime;
      if (this.facingRight) {
        bulletBlueImage = bulletBlue;
        playerBlueImage = playerBlueShoot;
        bullets.add(new Bullet(this.x + 18, this.y -7, 20, 0, 15));
      }
      else {
        bulletBlueImage = bulletBlueLeft;
        playerBlueImage = playerBlueShootFacingLeft;
        bullets.add(new Bullet(this.x - 18, this.y -7, -20, 0, 15));
      }
    } 
  }
}
