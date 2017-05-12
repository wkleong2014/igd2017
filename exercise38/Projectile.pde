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

  final int ANIMATION_DURATION = 300; //every 300ms it will change animation frame
  int frame = 0; //frame count
  int frameMax = 7;  //maximum frame
  int ticksLastAnimation = 0; //last tick animation

  //constructor for projectile
  Projectile(float posX, float posY, int direction, int projectileSpeed, int projectileType, int projectileDamage, int fromPlayerID) {
    this.posX = posX;
    this.direction = direction;
    diameter = 12;
    this.posY = posY;
    this.projectileSpeed = projectileSpeed;
    this.projectileType = projectileType;
    this.projectileDamage = projectileDamage;
    this.fromPlayerID = fromPlayerID;
    ticksLastMovement = millis();
    updateOb();
  }

  //getter methods
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
  
  int getDirection() {
    return direction;
  }

  int getProjectileDamage() {
    return projectileDamage;
  }

  //method to draw projectile
  void updateOb() {
    imageMode(CENTER);
    PImage sprite = spriteSheet.get(800 + (frame * 32), 0 + (projectileType * 32), 32, 32); //get the sprite according to the projectile type and current frame
    image(sprite, posX, posY);
    if (millis() - ticksLastAnimation >= ANIMATION_DURATION) {
      frame++;
      if (frame >= frameMax) { 
        frame = 0;
      }     
      ticksLastAnimation += millis() - ticksLastAnimation;
    }
  }

  //increase the x coordinate of projectile with time fix
  void incPosX(int projectileSpeed) {
    posX += projectileSpeed * float(millis() - ticksLastMovement) * 0.001;
    ticksLastMovement = millis();
  }

  //decrease the x coordinate of projectile with time fix
  void decPosX(int projectileSpeed) {
    posX -= projectileSpeed * float(millis() - ticksLastMovement) * 0.001;
    ticksLastMovement = millis();
  }

  //increase the y coordinate of projectile with time fix
  void incPosY(int projectileSpeed) {
    posY += projectileSpeed * float(millis() - ticksLastMovement) * 0.001;
    ticksLastMovement = millis();
  }

  //decrease the x coordinate of projectile with time fix
  void decPosY(int projectileSpeed) {
    posY -= projectileSpeed * float(millis() - ticksLastMovement) * 0.001;
    ticksLastMovement = millis();
  }
}