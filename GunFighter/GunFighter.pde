import gifAnimation.*;
import ddf.minim.*;
import processing.sound.*;

Model model;

void setup() {
    uploadPic();
    uploadAudio();
    model = new Model();
    size(1280, 720);
}

void draw() {
    //println(model.platformFallSpeed);
    image(backgroundImage, 0, 0, width, height);
    if (!model.gameStarted) {
        notStart();
        endsound.pause();
        endsound.rewind();
        startsound.play();
    } else{
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
            gameOverPage();
            playbackgroundstop();
            endsound.play();
        }
    }
}

void notStart() {
    homePage();
}
