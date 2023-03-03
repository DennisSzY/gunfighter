import gifAnimation.*;

//String[] playerBlueImages = new String[]{
//    "bulletBlue.png", "bulletBlueLeft.png",
//    "playerBlueDefault.gif","playerBlueFacingLeft.gif",
//    "playerBlueJump.gif","playerBlueJumpFacingLeft.gif","playerBlueJumpLeft.gif","playerBlueJumpRight.gif",
//    "playerBlueMoveLeft.gif","playerBlueMoveRight.gif",
//    "playerBlueShoot.gif","playerBlueShootFacingLeft.gif"
//}
//String[] playerRedImages = new String[]{
//    "bulletRed.png", "bulletRedLeft.png",
//    "playerRedDefault.gif","playerRedFacingLeft.gif",
//    "playerRedJump.gif","playerRedJumpFacingLeft.gif","playerRedJumpLeft.gif","playerRedJumpRight.gif",
//    "playerRedMoveLeft.gif","playerRedMoveRight.gif",
//    "playerRedShoot.gif","playerRedShootFacingLeft.gif"
//}

PImage floor;

PImage bulletBlueImage;
PImage bulletBlue;
PImage bulletBlueLeft;
Gif playerBlueImage;
Gif playerBlueDefault;
Gif playerBlueFacingLeft;
Gif playerBlueJump;
Gif playerBlueJumpFacingLeft;
Gif playerBlueJumpLeft;
Gif playerBlueJumpRight;
Gif playerBlueMoveLeft;
Gif playerBlueMoveRight;
Gif playerBlueShoot;
Gif playerBlueShootFacingLeft;

Platform p;
ArrayList<Bullet> bullets;
final float keypressRespondSpeed = 5;
Player playerBlue = new Player(600,552,true);
Player playerRed = new Player(600,552,false);

void setup(){
    size(1920,1080);
    frameRate(60);
    
    p = new Platform();
    bullets = new ArrayList();
    bulletBlue = loadImage("bulletBlue.png");
    bulletBlueLeft = loadImage("bulletBlueLeft.png");
    floor = loadImage("floor.jpg");
    floor.resize(500,40);
    bulletBlue.resize(10,10);
    bulletBlueLeft.resize(10,10);
    
    playerBlueDefault = new Gif(this, "playerBlueDefault.gif");
    playerBlueFacingLeft = new Gif(this, "playerBlueFacingLeft.gif");
    playerBlueJump = new Gif(this,"playerBlueJump.gif");
    playerBlueJumpFacingLeft = new Gif(this,"playerBlueJumpFacingLeft.gif");
    playerBlueJumpLeft = new Gif(this,"playerBlueJumpLeft.gif");
    playerBlueJumpRight = new Gif(this,"playerBlueJumpRight.gif");
    playerBlueMoveLeft = new Gif(this,"playerBlueMoveLeft.gif");
    playerBlueMoveRight = new Gif(this,"playerBlueMoveRight.gif");
    
    playerBlueShootFacingLeft = new Gif(this,"playerBlueShootFacingLeft.gif");
    playerBlueShoot = new Gif(this,"playerBlueShoot.gif");
    
    playerBlueDefault.loop();
    playerBlueFacingLeft.loop();
    playerBlueJump.loop();
    playerBlueJumpFacingLeft.loop();
    playerBlueJumpLeft.loop();
    playerBlueJumpRight.loop();
    playerBlueMoveLeft.loop();
    playerBlueMoveRight.loop();
    //playerBlueShoot.loop();
    playerBlueImage = playerBlueDefault;
}

void draw(){
  background(255);
  //playerBlueImage = playerBlueDefault;
  line(0,580,1200,580);
  line(0,600,1200,600);
  p.display(floor);
  playerBlue.update();
  playerBlue.display(playerBlueImage); 
  playerBlue.collide(600,600,250,20,1);
  
  if(bullets.size( ) != 0){
       bullets.get(bullets.size()-1).display(bulletBlueImage);
       bullets.get(bullets.size()-1).update();
   }
}
