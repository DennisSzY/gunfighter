class Platform {
  float x, y, w, h, speed;
  PImage image;

  Platform(float x, float y, float w, float h, PImage image) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.image = image;
  }

  void display() {
    image(this.image, this.x, this.y, this.w, this.h);
  }

  void move() {
    this.y += 1;
  }
  
}
