
void keyPressed() {
    if (Character.toLowerCase(key) == model.playerRed.leftKey) { model.playerRed.pressLeftKey = true;}
    if (Character.toLowerCase(key) == model.playerRed.rightKey) { model.playerRed.pressRightKey = true;}
    if (Character.toLowerCase(key) == model.playerRed.upKey) { model.playerRed.pressUpKey = true;}
    if (Character.toLowerCase(key) == model.playerRed.shootKey) { model.playerRed.pressShootKey = true;}
    
    if (Character.toLowerCase(key) == model.playerBlue.leftKey) { model.playerBlue.pressLeftKey = true;}
    if (Character.toLowerCase(key) == model.playerBlue.rightKey) { model.playerBlue.pressRightKey = true;}
    if (Character.toLowerCase(key) == model.playerBlue.upKey) { model.playerBlue.pressUpKey = true;}
    if (Character.toLowerCase(key) == model.playerBlue.shootKey) { model.playerBlue.pressShootKey = true;}
}

void keyReleased() {
    if (Character.toLowerCase(key) == model.playerRed.leftKey) { model.playerRed.pressLeftKey = false;}
    if (Character.toLowerCase(key) == model.playerRed.rightKey) { model.playerRed.pressRightKey = false;}
    if (Character.toLowerCase(key) == model.playerRed.upKey) { model.playerRed.pressUpKey = false;}
    if (Character.toLowerCase(key) == model.playerRed.shootKey) { model.playerRed.pressShootKey = false;}
    
    if (Character.toLowerCase(key) == model.playerBlue.leftKey) { model.playerBlue.pressLeftKey = false;}
    if (Character.toLowerCase(key) == model.playerBlue.rightKey) { model.playerBlue.pressRightKey = false;}
    if (Character.toLowerCase(key) == model.playerBlue.upKey) { model.playerBlue.pressUpKey = false;}
    if (Character.toLowerCase(key) == model.playerBlue.shootKey) { model.playerBlue.pressShootKey = false;}
}
//打包鼠标点击页面的地方
void mouseClicked() {
    if (!model.gameStarted && isHover(play)) {
        // Start game button clicked
        model.gameStarted = true;
    }
    
    if (!model.gameStarted && isHover(easy)) {
        model.platformFallSpeed = 2;
        model.platformProduceInterval = 3500;
    }
    
    if (!model.gameStarted && isHover(medium)) {
        model.platformFallSpeed = 3;
        model.platformProduceInterval = 2000;

    }
    
    if (!model.gameStarted && isHover(hard)) {
        model.platformFallSpeed = 4;
        model.platformProduceInterval = 1500;
    }
    
    if (model.gameOver && mouseX > width / 2 - 50 && mouseX < width / 2 + 50 && mouseY > height / 2 + 50 && mouseY < height / 2 + 100) {
        model.resetGame();
    }
}

boolean isHover(Shape shape){
  if(mouseX > shape.x && mouseX < shape.x+shape.w && mouseY > shape.y && mouseY < shape.y+shape.h){
    shape.setFillColors(255,0,0);
    shape.display();
    return true;
  }
  return false;
}
