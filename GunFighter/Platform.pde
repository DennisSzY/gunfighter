class Platform {
  float x,y,h,w;
  int type;
  Platform(float x, float y, float h, float w, int type) {
    this.x = x;
    this.y = y; //中心点 的 坐标
    this.h = h; //一半的高度
    this.w = w;
    this.type=type; //类型1为可站立
  }
  void display(PImage image) {
    if (this.type==1) {
      imageMode(CENTER);//模式：CENTER
      image(image, x, y);
    } 
  }
}
