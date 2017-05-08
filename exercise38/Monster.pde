class Monster {
  int hp = 2;
  float posX;
  float posY;
  int diameter = tileSize;
  Monster(int x, int y) {
    posX = x+16;
    posY = y+16;
  }
  
  void drawObj(){
    ellipseMode(CENTER);
    fill(0,0,255);
    ellipse(posX,posY,diameter,diameter);
  }
  
  void getHit(int damage){
    hp -= damage;
  }
}