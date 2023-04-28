public class Controller{
    Model model;
    
    Controller(Model model) {
        this.model = model;
    }
    
    void producePlatforms() {
        //返回自游戏启动后的毫秒数，           
        if (millis() - model.lastPlatformProduceTime > model.platformProduceInterval) {
            model.producePlatforms();
            model.lastPlatformProduceTime = millis();
        }
    }
    
    //  void keyPressed(Player player) {
    //  if (key == player.leftKey) { player.pressLeftKey = true;}
    //  if (key == player.rightKey) { player.pressRightKey = true;}
    //  if (key == player.upKey) { player.pressUpKey = true;}
    //  if (key == player.shootKey) { player.pressShootKey = true;}
// }
    
    //  void keyReleased(Player player) {
    //  if (key == player.leftKey) { player.pressLeftKey = false;}
    //  if (key == player.rightKey) { player.pressRightKey = false;}
    //  if (key == player.upKey) { player.pressUpKey = false;}
    //  if (key == player.shootKey) { player.pressShootKey = false;}
// }
    //打包鼠标点击页面的地方
}
