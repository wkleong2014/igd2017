class Monster {
  int hp = 0;
  int posX;
  int posY;
  Monster(int x, int y) {
    posX = x;
    posY = y;
  }
  
  void drawObj(){
    rectMode(CORNER);
    fill(0,0,255);
    rect(posX,posY,tileSize,tileSize);
  }
}