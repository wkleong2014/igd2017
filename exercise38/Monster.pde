class Monster {
  int hp = 2;
  PVector position;
  int diameter = tileSize;
  int direction = 0;
  int type;
  final int ANIMATION_DURATION = 300; //in milliseconds
  int frame = 0;
  int frameMax = 2;  
  int ticksLastAnimation = 0;  

  Monster(int type, PVector position) {
    this.type = type;
    this.position = position;
  }

  void drawObj() {
    imageMode(CENTER);   
    PImage sprite = spriteSheet.get((direction * 32) + (frame * 256), 0 + (type * 32), 32, 32);
    image(sprite, position.x, position.y);
  }

  void getHit(int damage) {
    hp -= damage;
  }
}