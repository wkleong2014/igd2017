class Monster {
  int hp = 2;
  PVector position;
  int diameter = tileSize;
  int direction = 0;
  Monster(PVector position) {
    this.position = position;
  }
  
  void drawObj(){
    ellipseMode(CENTER);
    fill(0,0,255);
    ellipse(position.x,position.y,diameter,diameter);
  }
  
  void getHit(int damage){
    hp -= damage;
  }
}