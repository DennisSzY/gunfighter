public class Model {
    ArrayList<Platform> platforms;
    Platform deadPlatform;
    float lastPlatformProduceTime; // milliseconds
    float platformProduceInterval; // 平台生成的时间间隔为2000毫秒milliseconds
    
    Player playerBlue; //id = 1
    Player playerRed; //id = 2
    
    boolean gameStarted;
    boolean gameOver;
    int winner;//1:blue 2:red
    
    float platformFallSpeed = 2;
    
    Model() {
        resetGame();
    }
    
    void produceInitialPlatforms(){
        platforms.clear();
        Platform platform1 = new Platform(0, height / 1.5, width / 4, 20, floor, platformFallSpeed);
        Platform platform2 = new Platform(width / 4 * 3, height / 1.5, width / 4, 25, floor, platformFallSpeed);
        Platform platform3 = new Platform(250, height / 2 + 50, width / 2, 20, floor, platformFallSpeed);
        Platform platform4 = new Platform(0, height / 3, width / 4, 20,floor, platformFallSpeed);
        Platform platform5 = new Platform(width / 4 * 3, height / 3, width / 4, 25, floor, platformFallSpeed);
        Platform platform6 = new Platform(250, height / 3 - 100, width / 2, 25, floor, platformFallSpeed);
        platforms.add(platform1);
        platforms.add(platform2);
        platforms.add(platform3);
        platforms.add(platform4);
        platforms.add(platform5);
        platforms.add(platform6);
    }
    //produce the deadFloor
    void produceDeadFloor() {
        Platform platform = new Platform(0, height - 35, width, 35, deadFloor, 0);
        platform.display();
    }
    //produce the random platform periodly
    void producePlatforms() {
        if (millis() - lastPlatformProduceTime > platformProduceInterval) {
            float platformX = random(0,width-200);
            float platformY = 0; //从顶部开始产生platform
            float platformWidth = random(width / 4, width / 2);//随机生成平台的大小
            float platformHeight = 25;//每个平台固定高度
            
            Platform platform = new Platform(platformX, platformY, platformWidth, platformHeight, floor, platformFallSpeed);
            platforms.add(platform);
            lastPlatformProduceTime = millis();
        }
    }
    
    //update platform
    void updatePlatforms() {
        for (int i = platforms.size() - 1; i >= 0; i--) {
            Platform platform = platforms.get(i);
            platform.update();
            platform.display();
            // Remove platforms that have gone off the bottom of the screen
            if (platform.y > height) {
                platforms.remove(i);
            }
        }
    } 
    
    void updatePlayer(Player playerShooted, ArrayList<Platform> platforms, Player playerShooting) {
        playerShooted.update();
        
        //静止状态下随平台移动
        if (playerShooted.onPlatform) {
            playerShooted.fallSpeed = platforms.get(platforms.size()-1).moveSpeed;
            playerShooted.y += playerShooted.fallSpeed;
        }
        playerShooted.landOnPlatform(platforms);
        playerShooted.collideWithBullet(playerShooting.firedBullets);
        playerShooted.display();
    }
    
   void isGameOver() {
        if (playerBlue.y + playerBlue.h >= height - 35) {
            gameOver = true;
            winner = 2;
        } else if (playerRed.y + playerRed.h >= height - 35) {
            gameOver = true;
            winner = 1;
        }
    }
    
    void resetGame() {
        // Reset all variables and objects to their initial state
        platforms = new ArrayList<Platform>();
        platformProduceInterval = 3500;
        lastPlatformProduceTime = 0;
        
        gameStarted = false;
        gameOver = false;

        easy = new Rectangle(595, 262, 93, 55);
        easy.setFillColors(236, 138, 161);
        easy.setText(255, 20, "EASY", 615, 278);
        easy.isClicked = true;

        medium = new Rectangle(698, 262, 93, 55);
        medium.setFillColors(206, 81, 111);
        medium.setText(255, 20, "MEDIUM", 704, 278);

        hard = new Rectangle(802, 262, 93, 55);
        hard.setFillColors(181, 36, 71);
        hard.setText(255, 20, "HARD", 820, 278);
    } 
    
}
