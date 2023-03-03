class Bullet {
   float x,y;
  float vx = 0;
  float vy = 0;
  float h = 25;
  float w = 25;
  float g = 0.7;
  float lifetime;

  Bullet(float x, float y, float vx, float vy, float lifetime) {
    this.x = x;
    this.y = y;
    this.vx = vx;
    this.vy = vy;
    this.lifetime = lifetime;
    this.h=4;
    this.w=20;
  }

 //isOver(px,py,pw,ph) {
 //   // condition for overlap
 //   return (this.y+this.h>=py && this.y<=py+ph && this.x+this.w>=px && this.x<=px+pw);
 // }

  void update() {
    this.x = this.x+this.vx;
    this.y = this.y+this.vy;
    this.lifetime--;
  }

 void display(PImage bulletImage) {
    image(bulletImage, x, y );
  }
}
