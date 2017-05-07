class Projectile {
  float posX;
  float posY;
  int direction;
  float diameter; //if need to increase ammo size
  int projectileSpeed;
  int projectileType;

  Projectile(float posX, float posY, int direction, int projectileSpeed, int projectileType) {
    this.posX = posX;
    this.direction = direction; //determines if the ammo is shot facing right or left
    diameter = 10;
    this.posY = posY;
    this.projectileSpeed = projectileSpeed;
    this.projectileType = projectileType;
    updateOb();
  }
  
  int getProjectileSpeed(){
   return projectileSpeed; 
  }

  void updateOb() {
    switch(projectileType){
      case 0:
        fill(139, 69, 19);
        ellipse(posX, posY, diameter, diameter);
        break;
      case 1:
        fill(139, 0, 19);
        ellipse(posX, posY, diameter, diameter);
        break;
      case 2:
        break;
      case 3:
        break;
    }
    
  }
  
  void incPosX(int projectileSpeed){
    posX += projectileSpeed;
  }
  
  void decPosX(int projectileSpeed){
    posX -= projectileSpeed;
  }
  
  void incPosY(int projectileSpeed){
    posY += projectileSpeed;
  }
  
  void decPosY(int projectileSpeed){
    posY -= projectileSpeed;
  }
  
  int getDirection(){
    return direction;
  }
}