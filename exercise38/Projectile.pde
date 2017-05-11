class Projectile {
  float posX;
  float posY;
  int direction;
  int diameter;
  int projectileSpeed;
  int projectileType;
  int projectileDamage;
  int ticksLastMovement;
  int fromPlayerID;

  final int ANIMATION_DURATION = 300; //in milliseconds
  int frame = 0;
  int frameMax = 7;  
  int ticksLastAnimation = 0;

  Projectile(float posX, float posY, int direction, int projectileSpeed, int projectileType, int projectileDamage, int fromPlayerID) {
    this.posX = posX;
    this.direction = direction;
    diameter = 16;
    this.posY = posY;
    this.projectileSpeed = projectileSpeed;
    this.projectileType = projectileType;
    this.projectileDamage = projectileDamage;
    this.fromPlayerID = fromPlayerID;
    ticksLastMovement = millis();
    updateOb();
  }

  int getFromPlayerID() {
    return  fromPlayerID;
  }

  int getProjectileType() {
    return projectileType;
  }

  int getProjectileSpeed() {
    return projectileSpeed;
  }

  int getProjectileDiameter() {
    return diameter;
  }

  float getPosX() {
    return posX;
  }

  float getPosY() {
    return posY;
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
    posX += projectileSpeed * float(millis() - ticksLastMovement) * 0.001;
    ticksLastMovement = millis();
  }

  void decPosX(int projectileSpeed) {
    posX -= projectileSpeed * float(millis() - ticksLastMovement) * 0.001;
    ticksLastMovement = millis();
  }

  void incPosY(int projectileSpeed) {
    posY += projectileSpeed * float(millis() - ticksLastMovement) * 0.001;
    ticksLastMovement = millis();
  }

  void decPosY(int projectileSpeed) {
    posY -= projectileSpeed * float(millis() - ticksLastMovement) * 0.001;
    ticksLastMovement = millis();
  }

  int getDirection() {
    return direction;
  }

  int getProjectileDamage() {
    return projectileDamage;
  }
}