class Projectile {
  float posX;
  float posY;
  int direction;
  int diameter;
  int projectileSpeed;
  int projectileType;                 //Stores the type of projectile (0 to 3 is players' projectiles and 7 is enemy projectile)
  int projectileDamage;               
  int ticksLastMovement;              //Timefix variable for projectile movement
  int fromPlayerID;                   //Stores the player who shot the projectile

  //Constructor for projectile
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

  //Getter methods
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

  //Method to draw projectile
  void updateOb() {
    imageMode(CENTER);
    PImage sprite = spriteSheet.get(768 + (direction * 32), 0 + (projectileType * 32), 32, 32); //get the sprite according to the projectile type and current frame
    image(sprite, posX, posY);
  }

  //Increase the x coordinate of projectile with time fix
  void incPosX(int projectileSpeed) {
    posX += projectileSpeed * float(millis() - ticksLastMovement) * 0.001;
  }

  //Decrease the x coordinate of projectile with time fix
  void decPosX(int projectileSpeed) {
    posX -= projectileSpeed * float(millis() - ticksLastMovement) * 0.001;
  }

  //Increase the y coordinate of projectile with time fix
  void incPosY(int projectileSpeed) {
    posY += projectileSpeed * float(millis() - ticksLastMovement) * 0.001;
  }

  //Decrease the y coordinate of projectile with time fix
  void decPosY(int projectileSpeed) {
    posY -= projectileSpeed * float(millis() - ticksLastMovement) * 0.001;
  }
  
  //Reset the timefix variable
  void setTicksLastMovement(){
    ticksLastMovement = millis();
  }   
}