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
PImage bulletBlueRight;
PImage bulletBlueLeft;
PImage bulletRedRight;
PImage bulletRedLeft;
PImage backgroundImage;

void uploadPic() {
    floor = loadImage("floor.jpg");
    deadFloor = loadImage("deadline.png");
    
    bulletBlueRight = loadImage("bulletBlueRight.png");
    bulletBlueLeft = loadImage("bulletBlueLeft.png");
    bulletRedRight = loadImage("bulletRedRight.png");
    bulletRedLeft = loadImage("bulletRedLeft.png");
    backgroundImage = loadImage("background.jpg");
    
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
    background(0);
    fill(255);
    textAlign(CENTER, CENTER);
    textSize(32);
    text("Game Over!", width / 2, height / 2 - 50);
    String winnerCol;
    if (model.winner == 1) {
        winnerCol = "blue";
    } else{
        winnerCol = "red";
    }
    text("Winner: " + winnerCol + "player" + model.winner, width / 2, height / 2);
    
    // Draw Restart button
    stroke(255);
    fill(0);
    rect(width / 2, height / 2 + 75, 100, 50);
    fill(255);
    textAlign(CENTER, CENTER);
    textSize(16);
    text("Restart", width / 2, height / 2 + 75);
}

public void homePage() {
    
    rectMode(CENTER);
    textSize(25);
    fill(255,0,0);
    rect(width / 2, height / 2 - 100, 250, 70, 10);
    fill(0);
    text("START GAME", width / 2 - 60, height / 2 - 90);
    
    // Display control keys
    fill(220);
    rect(width / 2, height / 2 + 70, 400, 200, 10);
    textSize(22);
    
    textSize(22);
    fill(1);
    text("Control Keys", width / 2 - 50, height / 2);
    fill(0, 0, 255);
    text(player1Keys, 250, height / 2 + 50);
    text("left: 'a'",250, height / 2 + 75);
    text("right: 'd'", 250, height / 2 + 100);
    text("jump: 'w'", 250, height / 2 + 125);
    text("shoot: 'z'", 250, height / 2 + 150);
    fill(255, 0, 0);
    textSize(22);
    text(player2Keys, width - 350, height / 2 + 50);
    text("left: 'j'", width - 350, height / 2 + 75);
    text("right: 'l'", width - 350, height / 2 + 100);
    text("jump: 'i'", width - 350, height / 2 + 125);
    text("shoot: '.'", width - 350, height / 2 + 150);
}

public void heartValue(Player player) {
    
}
