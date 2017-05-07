class Player {
  final int ANIMATION_DURATION = 300; //in milliseconds
  int frame = 0;
  int frameMax = 2;
  int ticksLastUpdate = millis();
  int ticksLastAnimation = 0;
  int delta;
  int[] playerClassList = {0, 1, 2, 3};
  int playerWidth = 32;
  int playerHeight = 32;
  PVector position = new PVector(32 + playerWidth/2, 32 + playerWidth/2);
  PVector velocity = new PVector(0, 0);
  float walkSpeed = 200;
  int direction = 4;
  int moveLeft;
  int moveRight;
  int moveUp;
  int moveDown;
  int playerClass;
  int hp;
  int mana;  
  PImage spriteSheet;
  int projectileSpeed;

  Player(int playerClass) {
    spriteSheet = loadImage("sprites.png");
    this.playerClass = playerClass;
    switch(playerClass) { //set hp & mana
    case 0:
      projectileSpeed = 5;
      break;
    case 1:
      projectileSpeed = 3;
      break;
    case 2:
      break;
    case 3:
      break;
    }
  }

  void resetPosition() {
    position = new PVector(32 + playerWidth/2, 32 + playerWidth/2);
  }

  void updateMovement() {    
    rectMode(CENTER);
    ellipseMode(CENTER);
    velocity.x = walkSpeed * (moveLeft + moveRight) * float(millis() - ticksLastUpdate) * 0.001;
    velocity.y = walkSpeed * (moveUp + moveDown) * float(millis() - ticksLastUpdate) * 0.001;
    PVector nextPosition = new PVector(position.x, position.y);
    nextPosition.add(velocity);
    int[][] currentLayout = level.getCurrentTileLayout();
    float offset = 32 + playerWidth/2 -1;
    if (currentLayout != null) {
      if (currentLayout[int((nextPosition.y)/32)][int((nextPosition.x-playerWidth/2)/32)] != 49 && currentLayout[int((nextPosition.y)/32)][int((nextPosition.x+playerWidth/2)/32)] != 49 && 
        currentLayout[int((nextPosition.y-playerWidth/2)/32)][int((nextPosition.x)/32)] != 49 && currentLayout[int((nextPosition.y+playerWidth/2)/32)][int((nextPosition.x)/32)] != 49 && 
        currentLayout[int((nextPosition.y-playerWidth/2)/32)][int((nextPosition.x-playerWidth/2)/32)] != 49 && currentLayout[int((nextPosition.y-playerWidth/2)/32)][int((nextPosition.x+playerWidth/2)/32)] != 49 && 
        currentLayout[int((nextPosition.y+playerWidth/2)/32)][int((nextPosition.x-playerWidth/2)/32)] != 49 && currentLayout[int((nextPosition.y+playerWidth/2)/32)][int((nextPosition.x+playerWidth/2)/32)] != 49) {
        if (nextPosition.x > offset && nextPosition.x < (width - offset)) position.x = nextPosition.x;
        if (nextPosition.y > offset && nextPosition.y < (height - offset)) position.y = nextPosition.y;
      }
    }
    imageMode(CENTER);   
    PImage sprite = spriteSheet.get((direction * 32) + (frame * 32), 0 + (playerClass * 32), 32, 32);
    image(sprite, position.x, position.y);

    if (millis() - ticksLastAnimation >= ANIMATION_DURATION && (velocity.x != 0 || velocity.y != 0)) {
      frame++;
      if (frame >= frameMax) { 
        frame = 0;
      }     
      ticksLastAnimation += millis() - ticksLastAnimation;
    }
    ticksLastUpdate = millis();
  }

  void setDirection(int direction) {
    this.direction = direction;
  }

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
  
  void shootAmmo() {
    Projectile proj = new Projectile(position.x, position.y, direction, projectileSpeed, playerClass);
    level.projList.add(proj);
  }
}