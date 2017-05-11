class Monster {
  int hp = 2;
  PVector position;
  int diameter = tileSize;
  int direction = 4;
  int type;
  final int ANIMATION_DURATION = 300; //in milliseconds
  int frame = 0;
  int frameMax = 2;  
  int ticksLastAnimation = 0;  
  int ticksLastShot;
  int projectileSpeed = 100;
  int projectileDamage = 10;
  int collisionDamage = 10;
  int ticksLastMovement = millis();

  Monster(int type, PVector position) {
    this.type = type;
    this.position = position;
  }
  
  int getCollisionDamage(){
    return collisionDamage;
  }
  
  int getDiameter(){
   return diameter; 
  }
  
  float getPosX(){
   return position.x; 
  }
  
  float getPosY(){
   return position.y; 
  }

  void drawObj() {
    if (type == 7 && millis() - ticksLastShot >= 1000) {
      shootProjectile();
      ticksLastShot += millis() - ticksLastShot;
    }
    imageMode(CENTER);   
    PImage sprite = spriteSheet.get((direction * 32) + (frame * 256), 0 + (type * 32), 32, 32);
    image(sprite, position.x, position.y);
  }

  void getHit(int damage) {
    hp -= damage;
  }
  
  void shootProjectile() {
    int offset = 20;
    Projectile proj;
    switch(direction) {
    default:
      proj = new Projectile(position.x, position.y, direction, projectileSpeed, type, projectileDamage, 0);
    case 0:
      proj = new Projectile(position.x, position.y - offset, direction, projectileSpeed, type, projectileDamage, 0);
      break;
    case 1:
      proj = new Projectile(position.x + offset, position.y - offset, direction, projectileSpeed, type, projectileDamage, 0);
      break;
    case 2:
      proj = new Projectile(position.x + offset, position.y, direction, projectileSpeed, type, projectileDamage, 0);
      break;
    case 3:
      proj = new Projectile(position.x + offset, position.y + offset, direction, projectileSpeed, type, projectileDamage, 0);
      break;
    case 4:
      proj = new Projectile(position.x, position.y + offset, direction, projectileSpeed, type, projectileDamage, 0);
      break;
    case 5:
      proj = new Projectile(position.x - offset, position.y + offset, direction, projectileSpeed, type, projectileDamage, 0);
      break;
    case 6:
      proj = new Projectile(position.x - offset, position.y, direction, projectileSpeed, type, projectileDamage, 0);
      break;
    case 7:
      proj = new Projectile(position.x - offset, position.y - offset, direction, projectileSpeed, type, projectileDamage, 0);
      break;
    }
    level.projList.add(proj);
  }
  
  void incPosX(int moveSpeed) {
    position.x += moveSpeed * float(millis() - ticksLastMovement) * 0.001;
  }

  void decPosX(int moveSpeed) {
    position.x -= moveSpeed * float(millis() - ticksLastMovement) * 0.001;
  }

  void incPosY(int moveSpeed) {
    position.y += moveSpeed * float(millis() - ticksLastMovement) * 0.001;
  }

  void decPosY(int moveSpeed) {
    position.y -= moveSpeed * float(millis() - ticksLastMovement) * 0.001;
  }
  
  void setLastMovementTicks(){
   ticksLastMovement = millis(); 
  }
  
  void setDirection(int direction){
    this.direction = direction;
  }
  
  int getHP(){
   return hp; 
  }
}