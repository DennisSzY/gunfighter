abstract class Shape{
  int x, y, w, h;
  int Tricolor1, Tricolor2, Tricolor3; //rgb colours
  int alpha = 255; // opacity of the fill, default opaque
  int textSize;
  String textContent;
  int textFill;
  int textX, textY;
  boolean hasFill = false;  //whether need fill
  boolean hasText = false;  //whether need text
  boolean hasStroke = false;  //whether need sttroke
  int strokeVal;  //stroke value
  int radii = 0;  //radii of angle 
  boolean isClicked = false;  

  void setFillColors(int Tricolor1, int Tricolor2, int Tricolor3){
    this.Tricolor1 = Tricolor1;
    this.Tricolor2 = Tricolor2;
    this.Tricolor3 = Tricolor3;
    this.hasFill = true;
  }
  
  void setOpacity(int alpha){
   this.alpha = alpha; 
  }
  
  void setStrokeVal(int strokeVal){
    this.strokeVal = strokeVal;
  }
  
  void setText(int textFill, int textSize, String textContent, int textX, int textY){
    this.textFill = textFill;
    this.textSize = textSize;
    this.textContent = textContent;
    this.textX = textX;
    this.textY = textY;
    this.hasText = true;
  }
  
  void setRad(int rad){
    this.radii = rad;
  }

  //check it is hover
  boolean isHover(){
    if (mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h){
      return true;
    }
      return false;
  }
  
  abstract void display();
}
