class Bullet {
  float x,y;
  float vx = 0;
  float vy = 1.1;
  float h = 8;
  float w = 40;
  int id; //blue / red
  //float g = 0.7;
  //float lifetime;

  Bullet(float x, float y, float vx, int id) {
    this.x = x;
    this.y = y;
    this.vx = vx;
    this.id = id;
    //this.lifetime = lifetime;
  }


  void update() {
    this.x = this.x+this.vx;
    this.y = this.y+this.vy;
  }

 void display() {
    if(vx > 0){
      if(id == 1){
          image(bulletBlue, x, y, w, h);
        }else{
          image(bulletRed, x, y, w, h);
        }
    }else{
      if(id == 1){
          image(bulletBlueLeft, x, y, w, h);
        }else{
          image(bulletRedLeft, x, y, w, h);
        }
    }
  }
}
