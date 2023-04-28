public class Model {
    ArrayList<Platform> platforms;
    Platform deadPlatform;
    float lastPlatformProduceTime; // milliseconds
    float platformProduceInterval; // 平台生成的时间间隔为2000毫秒milliseconds
    
    Player playerBlue; //id = 1
    Player playerRed; //id = 2
    
    boolean gameStarted;
    // boolean gameOver;
    int winner;//1:blue 2:red
    
    Model() {
        resetGame();
    }
    
    //produce the deadFloor
    void produceDeadFloor() {
        Platform platform = new Platform(0, height - 35, width, 35, deadFloor);
        platform.display();
    }
    //produce the random platform periodly
    void producePlatforms() {
        if (millis() - lastPlatformProduceTime > platformProduceInterval) {
            float platformX = random(0,width);
            float platformY = 0; //从顶部开始产生platform
            float platformWidth = random(width / 4, width / 2);//随机生成平台的大小
            float platformHeight = 25;//每个平台固定高度
            
            Platform platform = new Platform(platformX, platformY, platformWidth, platformHeight, floor);
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
            playerShooted.fallSpeed = platforms.get(0).moveSpeed;
            playerShooted.y += playerShooted.fallSpeed;
        }
        playerShooted.collideWithPlatform(platforms);
        playerShooted.collideWithBullet(playerShooting.firedBullets);
        playerShooted.display();
    }
    
    boolean isGameOver() {
        if (playerBlue.y + playerBlue.h >= height - 35) {
            // gameOver = true;
            winner = 2;
            return true;
        } else if (playerRed.y + playerRed.h >= height - 35) {
            // gameOver = true;
            winner = 1;
            return true;
        }
        return false;
    }
    
    void resetGame() {
        // Reset all variables and objects to their initial state
        platforms = new ArrayList<Platform>();
        platformProduceInterval = 8000;
        lastPlatformProduceTime = 0;
        Platform platform1 = new Platform(0, height / 1.5, width / 4, 20, floor);
        Platform platform2 = new Platform(width / 4 * 3, height / 1.5, width / 4, 25, floor);
        Platform platform3 = new Platform(250, height / 2 + 50, width / 2, 20, floor);
        Platform platform4 = new Platform(0, height / 3, width / 4, 20,floor);
        Platform platform5 = new Platform(width / 4 * 3, height / 3, width / 4, 25, floor);
        Platform platform6 = new Platform(250, height / 3 - 100, width / 2, 25, floor);
        platforms.add(platform1);
        platforms.add(platform2);
        platforms.add(platform3);
        platforms.add(platform4);
        platforms.add(platform5);
        platforms.add(platform6);
        //produce the player
        playerBlue = new Player(30, height - 500, true, 1); 
        playerRed = new Player(width - 30, height - 500, false, 2);
        playerBlue.setOpkeys('a', 'd', 'w', 'z');
        playerRed.setOpkeys('j', 'l', 'i', '.');
        boolean gameStarted = false;
        // boolean gameOver = false;
    } 
    
}
