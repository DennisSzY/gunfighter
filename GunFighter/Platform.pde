class Platform {
  float x,y,h,w;
  int type;
  Platform() {
    this.x = 600;
    this.y = 600; //中心点 的 坐标
    this.h = 20; //一半的高度
    this.w = 250;
    this.type=1; //类型1为可站立
  }
  void display(PImage image) {
    if (this.type==1) {
      imageMode(CENTER);//模式：CENTER
      image(image, x, y);
    } 
  }
}
