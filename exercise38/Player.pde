class Player {
  int durationOneFrame = 100; //in milliseconds
  int frame = 0;
  int frameMax = 2;
  int ticksLastUpdate = millis();
  int[] playerClassList = {0, 1, 2, 3};
  int playerWidth = 32;
  int playerHeight = 32;
  PVector position = new PVector(32 + playerWidth/2, 32 + playerWidth/2);
  float direction = 0; //set the direction of player
  PVector velocity = new PVector(0, 0);
  float walkSpeed = 200;
  int moveLeft;
  int moveRight;
  int moveUp;
  int moveDown;
  int playerClass;
  int hp;
  int mana;  
  PImage spriteSheet;

  Player(int playerClass) {
    spriteSheet = loadImage("sprites.png");
    this.playerClass = playerClass;
    switch(playerClass) { //set hp & mana
    case 0:
      break;
    case 1:
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
    switch(playerClass) {
    case 0:
      //fill(255, 0, 0);
      //ellipse(position.x, position.y, playerWidth, playerHeight);
      PImage f = spriteSheet.get(0 + (frame * 32), 0, 32, 23);
      image(f, position.x, position.y);
      break;
    case 1:
      fill(0, 255, 0);
      rect(position.x, position.y, playerWidth, playerHeight);
      break;
    case 2:
      break;
    case 3:
      break;
    }
    int delta = millis() - ticksLastUpdate;
    if (delta >= durationOneFrame)
    {
      frame++;
      if (frame >= frameMax) { 
        frame = 0;
      }
      //ticksLast = millis(); //adds up time overshooting error
      ticksLastUpdate += delta; //avoids adding up error
    }
    ticksLastUpdate += millis() - ticksLastUpdate;
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
}