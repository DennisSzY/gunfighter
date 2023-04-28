abstract class Shape{
  int x, y, w, h;
  int Tricolor1, Tricolor2, Tricolor3; //rgb colours
  int alpha = 255; // opacity of the fill, default opaque
  int textSize;
  String textContent;
  int textFill;
  int textX, textY;
  boolean hasFill = false;
  boolean hasText = false;

  void setFillColors(int Tricolor1, int Tricolor2, int Tricolor3){
    this.Tricolor1 = Tricolor1;
    this.Tricolor2 = Tricolor2;
    this.Tricolor3 = Tricolor3;
    this.hasFill = true;
  }
  
  void setOpacity(int alpha){
   this.alpha = alpha; 
  }
  
  void setText(int textFill, int textSize, String textContent, int textX, int textY){
    this.textFill = textFill;
    this.textSize = textSize;
    this.textContent = textContent;
    this.textX = textX;
    this.textY = textY;
    this.hasText = true;
  }
  
  abstract void display();
}
