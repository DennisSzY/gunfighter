import gifAnimation.*;


Model model;

void setup() {
    uploadPic();
    model = new Model();
    size(1280, 720);
}

void draw() {
    //println(model.platformFallSpeed);
    image(backgroundImage, 0, 0, width, height);
    if (!model.gameStarted) {
        notStart();
    } else{
        if (!model.gameOver) {
            model.produceDeadFloor();
            model.producePlatforms();
            model.updatePlatforms();
            model.updatePlayer(model.playerBlue, model.platforms, model.playerRed);
            model.updatePlayer(model.playerRed, model.platforms, model.playerBlue);
            model.isGameOver();
        }
        else{
            gameOverPage();
        }
    }
}

void notStart() {
    homePage();
}
