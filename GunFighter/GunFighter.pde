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
        if (!model.isGameOver()) {
            model.produceDeadFloor();
            model.producePlatforms();
            model.updatePlatforms();
            model.updatePlayer(model.playerBlue, model.platforms, model.playerRed);
            model.updatePlayer(model.playerRed, model.platforms, model.playerBlue);
        }
        else{
            gameOverPage();
        }
    }
}

void notStart() {
    homePage();
}


//reset game
//push the reset game
void mousePressed() {
    if (model.isGameOver() && mouseX > width / 2 - 50 && mouseX < width / 2 + 50 && mouseY > height / 2 + 50 && mouseY < height / 2 + 100) {
        // controller.resetGame();
    }
}


//rect(width / 2, height / 2 - 100, 250, 70, 10);
//    fill(0);
//    text("START GAME", width / 2 - 50, height / 2 - 100);

void mouseClicked() {
    if (!model.gameStarted && mouseX > width / 2 - 175 && mouseX < width / 2 + 170 && mouseY > height / 2 - 100 - 35 && mouseY < height / 2 - 100 + 35) {
        // Start game button clicked
        model.gameStarted = true;
    }
}
