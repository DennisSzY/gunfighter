import gifAnimation.*;

PImage floor;
PImage deadFloor;

Player player1;
Player player2;

boolean gameOver = false;
int winner;

Platform platform1;
Platform platform2;
Platform platform3;
Platform platform4;
Platform platform5;
Platform platform6;

Platform platform11;

ArrayList<Platform> platforms;
float platformProduceInterval = 1500; // milliseconds
float lastPlatformProduceTime = 0; // milliseconds

Gif BlueidleRight, RedidleRight;
Gif BlueidleLeft, RedidleLeft;
Gif BluerunRight, RedrunRight;
Gif BluerunLeft, RedrunLeft;
Gif BluejumpRight, RedjumpRight;
Gif BluejumpLeft, RedjumpLeft;
Gif BlueshootRight, RedshootRight;
Gif BlueshootLeft, RedshootLeft;

PImage bulletBlue;
PImage bulletBlueLeft;

PImage bulletRed;
PImage bulletRedLeft;

void setup(){
  size(800, 500);
  platforms = new ArrayList<Platform>();
  floor = loadImage("floor.jpg");
  deadFloor = loadImage("deadline.png");
  
  bulletBlue = loadImage("bulletBlue.png");
  bulletBlueLeft = loadImage("bulletBlueLeft.png");
  bulletRed = loadImage("bulletRed.png");
  bulletRedLeft = loadImage("bulletRedLeft.png");
  
  uploadGif();
  initialPlatform();
  player1 = new Player(30, height - 500, true, 1);
  player2 = new Player(width-30, height - 500, false, 2);
  
  
}

void draw(){
  background(255);
  isGameOver();
  produceDeadFloor();
  producePlatforms();
  updatePlatforms();
  //platform11.display();
  //updatePlatforms();
  isShooted();
  player1.update();
  player1.collide(platforms);
  player1.updateImage();
  player2.update();
  player2.collide(platforms);
  player2.updateImage();

  //isGameOver();
 
}


// is shooted
void isShooted(){
  for(int i = 0; i < player1.bullets.size(); i++){
    Bullet bullet = player1.bullets.get(i);
    if(player2.x <= bullet.x && player2.x + player2.w >= bullet.x + bullet.w && bullet.y >= player2.y && bullet.y + bullet.h <= player2.y + player2.h){
      if(bullet.x + bullet.w/2 > player2.x+player2.w/2){
        player2.x -= 70;
      }else{
        player2.x += 70;
      }
      player1.bullets.remove(i);
    }
  }
  
  for(int i = 0; i < player2.bullets.size(); i++){
    Bullet bullet = player2.bullets.get(i);
    if(player1.x <= bullet.x && player1.x + player1.w >= bullet.x + bullet.w && bullet.y >= player1.y && bullet.y + bullet.h <= player1.y + player1.h){
      if(bullet.x + bullet.w/2 > player1.x+player1.w/2){
        player1.x -= 70;
      }else{
        player1.x += 70;
      }
      player2.bullets.remove(i);
    }
  }
  
}

//is game over
void isGameOver(){
  if(player1.y+player1.h >= height-35){
    gameOver = true;
    winner = 2;
  }else if (player2.y+player2.h >= height-35){
    gameOver = true;
    winner = 1;
  }
  
  if(gameOver){
    background(0);
    fill(255);
    textAlign(CENTER, CENTER);
    textSize(32);
    text("Game Over!", width/2, height/2 - 50);
    String winnerCol;
    if(winner == 1){
      winnerCol = "blue";
    }else{
      winnerCol = "red";
    }
    text("Winner: " + winnerCol + "player" + winner, width/2, height/2);
    
    // Draw Restart button
    stroke(255);
    fill(0);
    rect(width/2 - 50, height/2 + 50, 100, 50);
    fill(255);
    textAlign(CENTER, CENTER);
    textSize(16);
    text("Restart", width/2, height/2 + 75);
  }
  
  
}

//reset game
void resetGame() {
  // Reset all variables and objects to their initial state
  player1 = new Player(30, height - 500, true, 1);
  player2 = new Player(width-30, height - 500, false, 2);
  platforms = new ArrayList<Platform>();
  initialPlatform();
  gameOver = false;
}

//push the reset game
void mousePressed() {
  if (gameOver && mouseX > width/2 - 50 && mouseX < width/2 + 50 && mouseY > height/2 + 50 && mouseY < height/2 + 100) {
    resetGame();
  }
}

//produce the deadFloor
void produceDeadFloor(){
  Platform platform = new Platform(0, height-35, width, 35, deadFloor);
  platform.display();
}

//produce the random platform periodly
void producePlatforms() {
  if (millis() - lastPlatformProduceTime > platformProduceInterval) {
    float platformX = random(width-100);
    float platformY = 0;
    float platformWidth = random(width/4, width/2);
    float platformHeight = 25;
    Platform platform = new Platform(platformX, platformY, platformWidth, platformHeight, floor);
    platforms.add(platform);
    lastPlatformProduceTime = millis();
  }
}

//update the platform
void updatePlatforms() {
  for (int i = platforms.size() - 1; i >= 0; i--) {
    Platform platform = platforms.get(i);
    platform.move();
    platform.display();
    // Remove platforms that have gone off the bottom of the screen
    if (platform.y > height) {
      platforms.remove(i);
    }
  }
}


void uploadGif(){
  BlueidleRight = new Gif(this, "playerBlueDefault.gif");
  BlueidleRight.loop();
  BlueidleLeft = new Gif(this, "playerBlueFacingLeft.gif");
  BlueidleLeft.loop();
  BluerunRight = new Gif(this, "playerBlueMoveLeft.gif");
  BluerunRight.loop();
  BluerunLeft = new Gif(this, "playerBlueMoveRight.gif");
  BluerunLeft.loop();
  BluejumpRight = new Gif(this, "playerBlueJump.gif");
  BluejumpRight.loop();
  BluejumpLeft = new Gif(this, "playerBlueJumpFacingLeft.gif");
  BluejumpLeft.loop();
  BlueshootRight = new Gif(this, "playerBlueShoot.gif");
  BlueshootRight.loop();
  BlueshootLeft = new Gif(this, "playerBlueShootFacingLeft.gif");
  BlueshootLeft.loop();
  

  RedidleRight = new Gif(this, "playerRedDefault.gif");
  RedidleRight.loop();
  RedidleLeft = new Gif(this, "playerRedFacingLeft.gif");
  RedidleLeft.loop();
  RedrunRight = new Gif(this, "playerRedMoveLeft.gif");
  RedrunRight.loop();
  RedrunLeft = new Gif(this, "playerRedMoveRight.gif");
  RedrunLeft.loop();
  RedjumpRight = new Gif(this, "playerRedJump.gif");
  RedjumpRight.loop();
  RedjumpLeft = new Gif(this, "playerRedJumpFacingLeft.gif");
  RedjumpLeft.loop();
  RedshootRight = new Gif(this, "playerRedShoot.gif");
  RedshootRight.loop();
  RedshootLeft = new Gif(this, "playerRedShootFacingLeft.gif");
  RedshootLeft.loop();
}


void initialPlatform(){
  platform1 = new Platform(0, height/1.5, width/4, 20, floor);
  platform2 = new Platform(width/4*3, height/1.5, width/4, 25, floor);
  platform3 = new Platform(250, height/2+50, width/2, 20, floor);
  platform4 = new Platform(0, height/3, width/4, 20, floor);
  platform5 = new Platform(width/4*3, height/3, width/4, 25, floor);
  platform6 = new Platform(250, height/3 - 100, width/2, 25, floor);

  platforms.add(platform1);
  platforms.add(platform2);
  platforms.add(platform3);
  platforms.add(platform4);
  platforms.add(platform5);
  platforms.add(platform6);
}


void keyPressed(){
      if(key == 'a'){ player1.keyLeft = true;}
      if(key == 'd'){ player1.keyRight = true;}
      if(key == 'w'){ player1.keyUp = true;}
      //if(key == 'z'){ keyDown = true;}
      if(key == 'z'){ player1.keyShoot = true;}
      
      if(key == 'j'){ player2.keyLeft = true;}
      if(key == 'l'){ player2.keyRight = true;}
      if(key == 'i'){ player2.keyUp = true;}
      //if(key == 'z'){ keyDown = true;}
      if(key == '.'){ player2.keyShoot = true;}
}

void keyReleased() {
      if(key == 'a'){ player1.keyLeft = false;}
      if(key == 'd'){ player1.keyRight = false;}
      if(key == 'w'){ player1.keyUp = false;}
      //if(key == 'z'){ keyDown = false;}
      if(key == 'z'){ player1.keyShoot = false;}
      
      if(key == 'j'){ player2.keyLeft = false;}
      if(key == 'l'){ player2.keyRight = false;}
      if(key == 'i'){ player2.keyUp = false;}
      //if(key == 'z'){ keyDown = false;}
      if(key == '.'){ player2.keyShoot = false;}
}
