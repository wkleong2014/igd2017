class Player {
  String[] playerClassList = {"Warrior", "Wizard", "Ranger", "Thief"}; //might need to change to int array
  PVector position = new PVector(width/2, width/2);
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

  void updateMovement(int ticksLastUpdate) {
    rectMode(CENTER);
    velocity.x = walkSpeed * (moveLeft + moveRight) * float(millis() - ticksLastUpdate) * 0.001;
    velocity.y = walkSpeed * (moveUp + moveDown) * float(millis() - ticksLastUpdate) * 0.001;
    PVector nextPosition = new PVector(position.x, position.y);
    nextPosition.add(velocity);
    float offset = 10;
    if (nextPosition.x > offset && nextPosition.x < (width - offset)) position.x = nextPosition.x;
    if (nextPosition.y > offset && nextPosition.y < (height - offset)) position.y = nextPosition.y;

    switch(playerClass) {
    case "Warrior":
      ellipse(position.x, position.y, 20, 20);
      break;
    case "Wizard":
      rect(position.x, position.y, 20, 20);
      break;
    case "Ranger":
      break;
    case "Thief":
      break;
    }
    rectMode(CORNERS);
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