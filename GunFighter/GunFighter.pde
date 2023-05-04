import gifAnimation.*;
import ddf.minim.*;

Model model;

//setup before draw
void setup() {
    uploadPic();
    uploadAudio();
    model = new Model();
    size(1280, 720);
}

void draw() {
    image(backgroundImage, 0, 0, width, height);
    if (!model.gameStarted) {
      //game not strat
        notStart();
        endsound.pause();
        endsound.rewind();
        startsound.play();
    } else{
      //game start
        startsound.pause();
        startsound.rewind();
        if (!model.gameOver) {
            model.produceDeadFloor();
            model.producePlatforms();
            model.updatePlatforms();
            model.updatePlayer(model.playerBlue, model.platforms, model.playerRed);
            model.updatePlayer(model.playerRed, model.platforms, model.playerBlue);
            model.isGameOver();
            fightingAudio();
        }
        else{
          //game over
            gameOverPage();
            playbackgroundstop();
            endsound.play();
        }
    }
}

void notStart() {
    homePage();
}
