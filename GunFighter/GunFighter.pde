import gifAnimation.*;

String player1Keys = "Player 1: Blue "; // Control keys for player 1
String player2Keys = "Player 2: Red "; 

View view;
Model model;
Controller controller;

void setup() {
    view = new View();
    model = new Model(view);
    size(800, 500);
}

void draw() {
    image(view.backgroundImage, 0, 0, width, height);
    if (!model.gameStarted) {
        notStart();
    } else{
        isGameOver();
        model.updatePlatforms();
        model.updatePlayer(model.playerBlue, model.platforms, model.playerRed);
        model.updatePlayer(model.playerRed, model.platforms, model.playerBlue);
    }
    
    //isGameOver();
    
}

void notStart() {
    view.homePage();
}


//is game over
void isGameOver() {
    if (model.gameOver) {
        view.gameOverPage();
    }
}

//reset game
//push the reset game
void mousePressed() {
    if (model.gameOver && mouseX > width / 2 - 50 && mouseX < width / 2 + 50 && mouseY > height / 2 + 50 && mouseY < height / 2 + 100) {
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
