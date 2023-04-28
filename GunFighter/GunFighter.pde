import gifAnimation.*;

String player1Keys = "Player 1: Blue "; // Control keys for player 1
String player2Keys = "Player 2: Red "; 

Model model;

void setup() {
    uploadPic();
    model = new Model();
    size(1280, 720);
}

void draw() {
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
