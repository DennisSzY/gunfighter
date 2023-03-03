Boolean keyLeft = false, keyRight = false, keyDown = false, keyUp = false, keyShoot = false;
void keyPressed(){
      if(keyCode == LEFT){ keyLeft = true;}
      if(keyCode == RIGHT){ keyRight = true;}
      if(keyCode == UP){ keyUp = true;}
      if(keyCode == DOWN){ keyDown = true;}
      if(keyCode == SHIFT){ keyShoot = true;}
}

void keyReleased() {
      if(keyCode == LEFT){ keyLeft = false;}
      if(keyCode == RIGHT){ keyRight = false;}
      if(keyCode == UP){ keyUp = false;}
      if(keyCode == DOWN){ keyDown = false;}
      if(keyCode == SHIFT){ keyShoot = false;}
}
