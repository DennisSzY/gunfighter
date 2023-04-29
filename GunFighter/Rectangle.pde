class Rectangle extends Shape{
 public Rectangle(int x, int y, int w, int h){
   this.x = x;
   this.y = y;
   this.w = w;
   this.h = h;
  }
 @Override
 void display(){
   
   if(hasStroke){
     stroke(strokeVal);
   }
   if(hasFill){
     fill(Tricolor1, Tricolor2, Tricolor3, alpha);
   }else{
     noFill();
   }
   rect(x, y, w, h, radii);
   if(hasText){
     fill(textFill);
      textSize(textSize);
      text(textContent, textX, textY);
   }
 }
}
