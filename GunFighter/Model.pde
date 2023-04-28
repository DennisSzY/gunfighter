public class Model {
    private ArrayList<Platform> platforms;
    float lastPlatformProduceTime; // milliseconds
    public void setLastPlatformProduceTime(float lastPlatformProduceTime) {
        this.lastPlatformProduceTime = lastPlatformProduceTime;
    }
    float platformProduceInterval; // 平台生成的时间间隔为2000毫秒milliseconds
    
    Player playerBlue; 
    Player playerRed;
    
    View view;
    boolean gameStarted = false;
    boolean gameOver = false;
    int winner;
    
    Model(View view) {
        this.view = view;
        resetGame();
    }
    
    //produce the random platform periodly
    void producePlatforms() {
        float platformX = random(0,width);
        float platformY = 0; //从顶部开始产生platform
        float platformWidth = random(width / 4, width / 2);//随机生成平台的大小
        float platformHeight = 25;//每个平台固定高度
        
        Platform platform = new Platform(platformX, platformY, platformWidth, platformHeight, view.floor);
        platforms.add(platform);
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
        playerShooted.collideWithPlatform(platforms);
        playerShooted.collideWithBullet(playerShooting.firedBullets);
        playerShooted.display(view);
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
        platformProduceInterval = 2000;
        lastPlatformProduceTime = 0;
        Platform platform1 = new Platform(0, height / 1.5, width / 4, 20, view.floor);
        Platform platform2 = new Platform(width / 4 * 3, height / 1.5, width / 4, 25, view.floor);
        Platform platform3 = new Platform(250, height / 2 + 50, width / 2, 20, view.floor);
        Platform platform4 = new Platform(0, height / 3, width / 4, 20, view.floor);
        Platform platform5 = new Platform(width / 4 * 3, height / 3, width / 4, 25, view.floor);
        Platform platform6 = new Platform(250, height / 3 - 100, width / 2, 25, view.floor);
        platforms.add(platform1);
        platforms.add(platform2);
        platforms.add(platform3);
        platforms.add(platform4);
        platforms.add(platform5);
        platforms.add(platform6);
        //produce the deadFloor
        Platform platform = new Platform(0, height - 35, width, 35, view.deadFloor);
        platform.display();
        //produce the player
        playerBlue = new Player(30, height - 500, true, 1); 
        playerRed = new Player(width - 30, height - 500, false, 2);
        //playerBlue.setOpkeys("a", "d", "w", "g");
        //playerRed.setOpkeys("LEFT", "RIGHT", "UP", "SPACE");
        gameOver = false;
    } 
    
}
