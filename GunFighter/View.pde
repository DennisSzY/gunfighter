PImage floor;
PImage deadFloor;
Gif blueIdleRight, redIdleRight;
Gif blueIdleLeft, redIdleLeft;
Gif blueRunRight, redRunRight;
Gif blueRunLeft, redRunLeft;
Gif blueJumpRight, redJumpRight;
Gif blueJumpLeft, redJumpLeft;
Gif blueShootRight, redShootRight;
Gif blueShootLeft, redShootLeft;
Gif playerBlue, playerRed;
Gif playerBlueShooted, playerRedShooted;
Gif playerBlueShootedLeft, playerRedShootedLeft;
PImage bulletBlueRight;
PImage bulletBlueLeft;
PImage bulletRedRight;
PImage bulletRedLeft;
PImage backgroundImage;
PFont myFont;

Shape play;
Shape hard;
Shape medium;
Shape easy;

void uploadPic() {
    floor = loadImage("floor.jpg");
    deadFloor = loadImage("deadline.png");
    
    bulletBlueRight = loadImage("bulletBlueRight.png");
    bulletBlueLeft = loadImage("bulletBlueLeft.png");
    bulletRedRight = loadImage("bulletRedRight.png");
    bulletRedLeft = loadImage("bulletRedLeft.png");
    backgroundImage = loadImage("background.jpg");

    playerBlue = new Gif (this, "playerBlue.gif");
    playerBlue.loop();
    playerRed = new Gif (this, "playerRed.gif");
    playerRed.loop();
    
    playerBlueShooted = new Gif (this, "playerBlueShooted.gif");
    playerBlueShooted.loop();
    playerRedShooted = new Gif (this, "playerRedShooted.gif");
    playerRedShooted.loop();

    playerBlueShootedLeft = new Gif (this, "playerBlueShootedLeft.gif");
    playerBlueShootedLeft.loop();
    playerRedShootedLeft = new Gif (this, "playerRedShootedLeft.gif");
    playerRedShootedLeft.loop();
    
    blueIdleRight = new Gif (this, "playerBlueDefault.gif");
    blueIdleRight.loop();
    blueIdleLeft = new Gif (this, "playerBlueFacingLeft.gif");
    blueIdleLeft.loop();
    blueRunLeft = new Gif (this, "playerBlueMoveLeft.gif");
    blueRunLeft.loop();
    blueRunRight = new Gif (this, "playerBlueMoveRight.gif");
    blueRunRight.loop();
    blueJumpRight = new Gif (this, "playerBlueJump.gif");
    blueJumpRight.loop();
    blueJumpLeft = new Gif (this, "playerBlueJumpFacingLeft.gif");
    blueJumpLeft.loop();
    blueShootRight = new Gif (this, "playerBlueShoot.gif");
    blueShootRight.loop();
    blueShootLeft = new Gif (this, "playerBlueShootFacingLeft.gif");
    blueShootLeft.loop();   
    
    redIdleRight = new Gif (this, "playerRedDefault.gif");
    redIdleRight.loop();
    redIdleLeft = new Gif (this, "playerRedFacingLeft.gif");
    redIdleLeft.loop();
    redRunRight = new Gif (this, "playerRedMoveRight.gif");
    redRunRight.loop();
    redRunLeft = new Gif (this, "playerRedMoveLeft.gif");
    redRunLeft.loop();
    redJumpRight = new Gif (this, "playerRedJump.gif");
    redJumpRight.loop();
    redJumpLeft = new Gif (this, "playerRedJumpFacingLeft.gif");
    redJumpLeft.loop();
    redShootRight = new Gif (this, "playerRedShoot.gif");
    redShootRight.loop();
    redShootLeft = new Gif (this, "playerRedShootFacingLeft.gif");
    redShootLeft.loop();
}


public void gameOverPage() {
    
}

public void homePage() {
  noStroke();
  fill(0, 0, 0, 100);
  rect(0, 0, width, height);
  textAlign(LEFT, TOP);
  myFont = createFont("Arial", 80);
  // 设置当前字体
  textFont(myFont);
  //textSize(80);
   fill(255, 172, 74, 200);
  text("Gun Fighter", 415, 37);
  fill(255, 255, 255);
  text("Gun Fighter", 412, 31);
  textSize(40);
  text("TUTORAL", 195, 185);
  text("DIFFICITY", 629, 185);
  textSize(30);

  text("SHOOT", 101, 420);
  text("MOVE", 408, 416);

  noStroke();
  
  
  blueButton(124, 305, 60, 60, "Z");
  blueButton(426, 280, 60, 60, "W");
  blueButton(389, 345, 60, 60, "A");
  blueButton(467, 345, 60, 60, "D");
  
  redButton(124, 498, 60, 60, ".");
  redButton(426, 458, 60, 60, "I");
  redButton(389, 523, 60, 60, "J");
  redButton(467, 523, 60, 60, "L");

  roleDisplay(235,290, 110,110, playerBlue);
  roleDisplay(235,473, 110,110, playerRed);
  

  easy.display();
  medium.display();
  hard.display();
  
  fill(255);
  rect(595, 327, 300, 268);
  
  
  //noStroke();
  play = new Rectangle(949, 379, 262, 75);
  play.setFillColors(255,255,255);
  play.setText(121, 40, "PLAY", 1054, 394);
  play.setRad(28);
  play.display();
  
  PImage playPig = loadImage("play.png");
  image(playPig, 996, 391, 44, 51);
  
  stroke(199, 64, 102, 255);
  strokeWeight(4);
  fill(255,255,255,0);
  rect(955, 382, 250, 69, 22);
}

void roleDisplay(int x, int y, int w, int h, Gif imageName){
    fill(255, 255, 255, 150);
    rect(x-10, y-10, w+20, h+20);
    rect(x, y, w, h);
    image(imageName, x, y+10, w, h-20);
}

void blueButton(int x, int y, int w, int h, String textContent){
    fill(78, 140, 246, 150);
    rect(x+4, y+4, w, h);
    fill(213, 213, 213, 255);
    rect(x, y, w, h);
    textSize(30);
    fill(0, 0, 0);
    text(textContent, x+21, y+13);
}
  
  void redButton(int x, int y, int w, int h, String textContent){
    fill(234, 92, 92, 150);
    rect(x+4, y+4, w, h);
    fill(213, 213, 213, 255);
    rect(x, y, w, h);
    textSize(30);
    fill(0, 0, 0);
    text(textContent, x+21, y+13);
  }
