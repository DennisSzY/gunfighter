class Rectangle extends Shape{
 public Rectangle(int x, int y, int w, int h){
   this.x = x;
   this.y = y;
   this.w = w;
   this.h = h;
  }
  
  //overwrite the abstract display function
 @Override
 void display(){
  if(isHover()){
    fill(255,0,0);
  }
  else if(isClicked){
    fill(255,0,0);
  }
  else{
    if(hasFill){
      fill(Tricolor1, Tricolor2, Tricolor3, alpha);
    }else{
      noFill();
    }
  }
  if(hasStroke){
     stroke(strokeVal);
   }
   rect(x, y, w, h, radii);
   if(hasText){
     fill(textFill);
      textSize(textSize);
      text(textContent, textX, textY);
   }
 }

}
