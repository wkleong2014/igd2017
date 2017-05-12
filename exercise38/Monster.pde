class Monster {
  int hp = 2;
  PVector position;
  int diameter = TILE_SIZE;
  int direction = 4;
  int type;
  final int ANIMATION_DURATION = 300; //300ms for each animation frame
  int frame = 0;
  int frameMax = 2;  
  int ticksLastAnimation = 0;  
  int ticksLastShot;
  int projectileSpeed = 100;
  int projectileDamage = 10;
  int collisionDamage = 10;
  int ticksLastMovement = millis();

  //Constructor for monster
  Monster(int type, PVector position) {
    this.type = type;
    this.position = position;
  }

  //Getter methods
  int getCollisionDamage() {
    return collisionDamage;
  }

  int getDiameter() {
    return diameter;
  }

  float getPosX() {
    return position.x;
  }

  float getPosY() {
    return position.y;
  }
  
  int getHP() {
    return hp;
  }

  //Method that draws the monster
  void drawObj() {
    if (type == 7 && millis() - ticksLastShot >= 1000) { //Every 1s a monster can shoot a projectile
      shootProjectile();
      ticksLastShot += millis() - ticksLastShot;
    }
    imageMode(CENTER);   
    PImage sprite = spriteSheet.get((direction * 32) + (frame * 256), 0 + (type * 32), 32, 32);
    image(sprite, position.x, position.y);
    if (millis() - ticksLastAnimation >= ANIMATION_DURATION) {
      frame++;
      if (frame >= frameMax) { 
        frame = 0;
      }     
      ticksLastAnimation += millis() - ticksLastAnimation;
    }
  }

  //Reduce the hp of monster
  void getHit(int damage) {
    hp -= damage;
  }

  //Method that creates the monster's projectile
  void shootProjectile() {
    int offset = 20;
    Projectile proj;
    switch(direction) {
    //Check the direction of player and create a new projectile according to player's current direction
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

  //Methods to move the monster
  void incPosX() {
    position.x += 1;
  }

  void decPosX() {
    position.x -= 1;
  }

  void incPosY() {
    position.y += 1;
  }

  void decPosY() {
    position.y -= 1;
  }

  //Sets the direction of monster
  void setDirection(int direction) {
    this.direction = direction;
  }
}