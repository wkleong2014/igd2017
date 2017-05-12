class Player {
  int id;
  final int ANIMATION_DURATION = 300; //300ms for each animation frame
  int frame = 0;
  int frameMax = 2;
  int ticksLastUpdate = millis();
  int ticksLastAnimation = 0;  
  int[] playerClassList = {0, 1, 2, 3};
  int playerWidth = TILE_SIZE;
  int playerHeight = TILE_SIZE;
  PVector position;
  PVector velocity = new PVector(0, 0);
  float walkSpeed;
  int direction = 4;
  int moveLeft;
  int moveRight;
  int moveUp;
  int moveDown;
  int playerClass;
  int hp;
  int mana;  
  int projectileSpeed;
  int projectileDamage;
  int score;
  boolean isDead;
  int lastProjectileShot;                //Stores the time that the last projectile was shot

  //Constructor for Player
  Player(int playerClass, int id) {
    isDead = false;
    this.playerClass = playerClass;
    this.id = id;
    score = 0;
    position = level.getSpawnLocation();
    switch(playerClass) { 
    //Set player's stats according to their class [0 is giant, 1 is knight, 2 is mage, 3 is archer]
    case 0:
      hp = 600;
      projectileSpeed = 200;
      projectileDamage = 1;
      walkSpeed = 150;
      break;
    case 1:
      hp = 500;
      projectileSpeed = 250;
      projectileDamage = 1;
      walkSpeed = 160;
      break;
    case 2:
      hp = 300;
      projectileSpeed = 250;
      projectileDamage = 2;
      walkSpeed = 170;
      break;
    case 3:
      hp = 400;
      projectileSpeed = 300;
      projectileDamage = 1;
      walkSpeed = 180;
      break;
    }
  }

  //Method to reset the position of player
  void resetPosition() {
    position = level.getSpawnLocation();
  }

  //Draws the player after updating its movement
  void updateMovement() {
    if (hp > 0) { 
      // Alive
      velocity.x = walkSpeed * (moveLeft + moveRight) * float(millis() - ticksLastUpdate) * 0.001; //Update x coordinate in velocity vector
      velocity.y = walkSpeed * (moveUp + moveDown) * float(millis() - ticksLastUpdate) * 0.001; //Update y coordinate in velocity vector
      PVector nextPosition = new PVector(position.x, position.y); //Initialise new PVector so original position is not immediately updated
      nextPosition.add(velocity); //Update nextPosition with velocity
      int[][] currentLayout = level.getCurrentTileLayout(); //Retrieve the 2d array of tiles
      float offset = 32 + playerWidth/2; //Sets the maximum screen offset
      if (currentLayout != null) {
        //Checks if 8 points (N,S,E,W,NE,NW,SE,SW) of the nextPosition is colliding into walls
        if (!(currentLayout[int((nextPosition.y)/32)][int((nextPosition.x+1-playerWidth/2)/32)] <= 15) && !(currentLayout[int((nextPosition.y)/32)][int((nextPosition.x-1+playerWidth/2)/32)] <= 15) && 
          !(currentLayout[int((nextPosition.y+1-playerWidth/2)/32)][int((nextPosition.x)/32)] <= 15) && !(currentLayout[int((nextPosition.y-1+playerWidth/2)/32)][int((nextPosition.x)/32)] <= 15) && 
          !(currentLayout[int((nextPosition.y+1-playerWidth/2)/32)][int((nextPosition.x+1-playerWidth/2)/32)] <= 15) && !(currentLayout[int((nextPosition.y+1-playerWidth/2)/32)][int((nextPosition.x-1+playerWidth/2)/32)] <= 15) && 
          !(currentLayout[int((nextPosition.y-1+playerWidth/2)/32)][int((nextPosition.x+1-playerWidth/2)/32)] <= 15) && !(currentLayout[int((nextPosition.y-1+playerWidth/2)/32)][int((nextPosition.x-1+playerWidth/2)/32)] <= 15)) {
          if (nextPosition.x > offset && nextPosition.x < (width - offset)) position.x = nextPosition.x;
          if (nextPosition.y > offset && nextPosition.y < (height - offset)) position.y = nextPosition.y;
        }
      }
      imageMode(CENTER);  
      image(spriteSheet.get((direction * 32) + (frame * 256), 0 + (playerClass * 32), 32, 32), position.x, position.y); //Retrieve the animation from the spritesheet
    } else
    {    
      // Dead
      isDead = true;
      velocity.x = 0; //Ensures that dead body is not moving
      velocity.y = 0; //Ensures that dead body is not moving
      imageMode(CENTER);  
      image(spriteSheet.get(1024, 0, 32, 32), position.x, position.y);
    }
    if (millis() - ticksLastAnimation >= ANIMATION_DURATION && (velocity.x != 0 || velocity.y != 0)) {
      frame++;
      if (frame >= frameMax) { 
        frame = 0;
      }     
      ticksLastAnimation += millis() - ticksLastAnimation;
    }
    ticksLastUpdate = millis();
  }

  //Sets the direction of player
  void setDirection(int direction) {
    this.direction = direction;
  }

  //Helper methods to ensure fluid movement of player
  void moveRight() {
    moveRight = 1;
  }

  void moveLeft() {
    moveLeft = -1;
  }

  void moveUp() {
    moveUp = -1;
  }

  void moveDown() {
    moveDown = 1;
  }

  void resetRight() {
    moveRight = 0;
  }

  void resetLeft() {
    moveLeft = 0;
  }

  void resetUp() {
    moveUp = 0;
  }

  void resetDown() {
    moveDown = 0;
  }
  
  //Method when player is shooting projectile
  void shootProjectile() {
    if (!isDead && millis() - lastProjectileShot >= 300) //Checks if last projectile shot is more than 300ms and player is not dead
    {
      int offset = 20;
      Projectile proj;
      switch(direction) { //Check the direction of player and create a new projectile according to player's current direction
      default:
        proj = new Projectile(position.x, position.y, direction, projectileSpeed, playerClass, projectileDamage, id);
      case 0:
        proj = new Projectile(position.x, position.y - offset, direction, projectileSpeed, playerClass, projectileDamage, id);
        break;
      case 1:
        proj = new Projectile(position.x + offset, position.y - offset, direction, projectileSpeed, playerClass, projectileDamage, id);
        break;
      case 2:
        proj = new Projectile(position.x + offset, position.y, direction, projectileSpeed, playerClass, projectileDamage, id);
        break;
      case 3:
        proj = new Projectile(position.x + offset, position.y + offset, direction, projectileSpeed, playerClass, projectileDamage, id);
        break;
      case 4:
        proj = new Projectile(position.x, position.y + offset, direction, projectileSpeed, playerClass, projectileDamage, id);
        break;
      case 5:
        proj = new Projectile(position.x - offset, position.y + offset, direction, projectileSpeed, playerClass, projectileDamage, id);
        break;
      case 6:
        proj = new Projectile(position.x - offset, position.y, direction, projectileSpeed, playerClass, projectileDamage, id);
        break;
      case 7:
        proj = new Projectile(position.x - offset, position.y - offset, direction, projectileSpeed, playerClass, projectileDamage, id);
        break;
      }
      level.addProjectile(proj);
      lastProjectileShot = millis();
    }
  }

  //Getter methods
  int getHP()
  {
    return hp;
  }

  int getScore() {
    return score;
  }

  float getPosX() {
    return position.x;
  }

  float getPosY() {
    return position.y;
  }
  
  boolean getIsDead()
  {
    return isDead;
  }
  
  //Method to pick up item that changes player's stats
  void pickUpItem(int itemType) {
    switch(itemType) {
    case 1:
      hp += 50;
      break;
    }
  }

  //Method to add player's score
  void addScore(int number) {
    score += number;
  }

  //Method to reduce player's health when colliding with projectile
  void getHit(int projectileDamage) {
    hp -= projectileDamage;
    if (hp < 0 ) hp = 0;
  }
  
  //Method to set player's status to dead
  void die()
  {
    isDead = true;
  }
}