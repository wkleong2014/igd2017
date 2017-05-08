class Monster {
  int hp = 2;
  int posX;
  int posY;
  int diameter = tileSize;
  
  Monster(int x, int y) {
    posX = x;
    posY = y;
  }
  
  void drawObj(){
    ellipseMode(CORNER);
    fill(0,0,255);
    ellipse(posX,posY,diameter,diameter);
  }
  
  void getHit(int damage){
    hp -= damage;
  }
}