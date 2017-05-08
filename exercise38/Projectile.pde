class Projectile {
  float posX;
  float posY;
  int direction;
  float diameter; //if need to increase ammo size
  int projectileSpeed;
  int projectileType;
  
  final int ANIMATION_DURATION = 300; //in milliseconds
  int frame = 0;
  int frameMax = 7;  
  int ticksLastAnimation = 0;

  Projectile(float posX, float posY, int direction, int projectileSpeed, int projectileType) {
    this.posX = posX;
    this.direction = direction; //determines if the ammo is shot facing right or left
    diameter = 10;
    this.posY = posY;
    this.projectileSpeed = projectileSpeed;
    this.projectileType = projectileType;
    updateOb();
  }

  int getProjectileSpeed() {
    return projectileSpeed;
  }

  void updateOb() {
    imageMode(CENTER);
    PImage sprite = spriteSheet.get(800 + (frame * 32), 0 + (projectileType * 32), 32, 32);
    image(sprite, posX, posY);
    if (millis() - ticksLastAnimation >= ANIMATION_DURATION) {
      frame++;
      if (frame >= frameMax) { 
        frame = 0;
      }     
      ticksLastAnimation += millis() - ticksLastAnimation;
    }    
  }

  void incPosX(int projectileSpeed) {
    posX += projectileSpeed;
  }

  void decPosX(int projectileSpeed) {
    posX -= projectileSpeed;
  }

  void incPosY(int projectileSpeed) {
    posY += projectileSpeed;
  }

  void decPosY(int projectileSpeed) {
    posY -= projectileSpeed;
  }

  int getDirection() {
    return direction;
  }
}