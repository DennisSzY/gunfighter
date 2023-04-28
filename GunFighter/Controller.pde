
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

