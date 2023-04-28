
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
    if (!model.gameStarted && mouseX > width / 2 - 175 && mouseX < width / 2 + 170 && mouseY > height / 2 - 100 - 35 && mouseY < height / 2 - 100 + 35) {
        // Start game button clicked
        model.gameStarted = true;
    }
    
    if (model.isGameOver() && mouseX > width / 2 - 50 && mouseX < width / 2 + 50 && mouseY > height / 2 + 50 && mouseY < height / 2 + 100) {
        // controller.resetGame();
    }
}

boolean isClicked(Shape shape){
  if(mouseX > shape.x && mouseX < shape.x+shape.w && mouseY > shape.y && mouseY < shape.y+shape.h){
    return true;
  }
  return false;
}
