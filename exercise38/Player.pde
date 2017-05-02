class Player {
  String[] playerClassList = {"Warrior", "Wizard", "Ranger", "Thief"}; //might need to change to int array
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
  String playerClass;
  int hp;
  int mana;

  Player(String playerClass) {
    this.playerClass = playerClass;
    switch(playerClass) { //set hp & mana
    case "Warrior":

      break;
    case "Wizard":
      break;
    case "Ranger":
      break;
    case "Thief":
      break;
    }
  }
  
  void resetPosition(){
    position = new PVector(32 + playerWidth/2, 32 + playerWidth/2);
  }

  void updateMovement(int ticksLastUpdate) {
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
    switch(playerClass) {
    case "Warrior":
      fill(255, 0, 0);
      ellipse(position.x, position.y, playerWidth, playerHeight);
      break;
    case "Wizard":
      fill(0, 255, 0);
      rect(position.x, position.y, playerWidth, playerHeight);
      break;
    case "Ranger":
      break;
    case "Thief":
      break;
    }
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