
void keyPressed() {
    if (Character.toLowerCase(key) == model.playerRed.leftKey) { model.playerRed.pressLeftKey = true;}
    if (Character.toLowerCase(key) == model.playerRed.rightKey) { model.playerRed.pressRightKey = true;}
    if (Character.toLowerCase(key) == model.playerRed.upKey) { model.playerRed.pressUpKey = true;}
    if (Character.toLowerCase(key) == model.playerRed.shootKey) { model.playerRed.pressShootKey = true;audioplayershoot = true;}
    
    if (Character.toLowerCase(key) == model.playerBlue.leftKey) { model.playerBlue.pressLeftKey = true;}
    if (Character.toLowerCase(key) == model.playerBlue.rightKey) { model.playerBlue.pressRightKey = true;}
    if (Character.toLowerCase(key) == model.playerBlue.upKey) { model.playerBlue.pressUpKey = true;}
    if (Character.toLowerCase(key) == model.playerBlue.shootKey) { model.playerBlue.pressShootKey = true;audioplayershoot = true;}
}

void keyReleased() {
    if (Character.toLowerCase(key) == model.playerRed.leftKey) { model.playerRed.pressLeftKey = false;}
    if (Character.toLowerCase(key) == model.playerRed.rightKey) { model.playerRed.pressRightKey = false;}
    if (Character.toLowerCase(key) == model.playerRed.upKey) { model.playerRed.pressUpKey = false;}
    if (Character.toLowerCase(key) == model.playerRed.shootKey) { model.playerRed.pressShootKey = false;audioplayershoot = false;}
    
    if (Character.toLowerCase(key) == model.playerBlue.leftKey) { model.playerBlue.pressLeftKey = false;}
    if (Character.toLowerCase(key) == model.playerBlue.rightKey) { model.playerBlue.pressRightKey = false;}
    if (Character.toLowerCase(key) == model.playerBlue.upKey) { model.playerBlue.pressUpKey = false;}
    if (Character.toLowerCase(key) == model.playerBlue.shootKey) { model.playerBlue.pressShootKey = false;audioplayershoot = false;}
}
//打包鼠标点击页面的地方
void mouseClicked() {
    if (!model.gameStarted && play.isHover()) {
        // Start game button clicked
        model.gameStarted = true;
        clickEvent();
        //produce the player
        model.playerBlue = new Player(30, height - 600, true, 1, model.platformFallSpeed); 
        model.playerRed = new Player(width - 30, height - 600, false, 2, model.platformFallSpeed);
        model.playerBlue.setOpkeys('a', 'd', 'w', 'z');
        model.playerRed.setOpkeys('j', 'l', 'i', '.');
    }
    
    if (!model.gameStarted && easy.isHover()) {
        easy.isClicked = true;
        hard.isClicked = false;
        medium.isClicked = false;
    }
    
    if (!model.gameStarted && medium.isHover()) {
        medium.isClicked = true;
        easy.isClicked = false;
        hard.isClicked = false;
    }
    
    if (!model.gameStarted && hard.isHover()) {
        hard.isClicked = true;
        easy.isClicked = false;
        medium.isClicked = false;
    }
    
    if (model.gameOver && reset.isHover()) {
        model.resetGame();
    }
}

void clickEvent(){
    if(easy.isClicked){
        model.platformFallSpeed = 2;
        model.platformProduceInterval = 3500;
        model.produceInitialPlatforms();
        // println("size:" + model.platforms.size());
    }
    if(medium.isClicked){
        model.platformFallSpeed = 3;
        model.platformProduceInterval = 2000;
        model.produceInitialPlatforms();
    }
    if(hard.isClicked){
        model.platformFallSpeed = 8;
        model.platformProduceInterval = 1500;
        model.produceInitialPlatforms();
    }
}
