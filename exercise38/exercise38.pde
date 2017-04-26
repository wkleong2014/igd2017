/* 
 Exercise 38: Make a Gauntlet-style game (Figure 4) for three (or more) simultanious player1s. Your implementation does not need to be (and should not be) a clone, 
 but an original and modern reinterpretation. Make a playable, interesting and finished game (include, at least, starting the game, winning/losing, score, 
 restart, 16 levels, various kinds of enemies). As the original, it is top-down 2D, non-splitscreen; the player1 characters have different abilities and 
 strengths, and use projectile weapons (not e.g. lasers) as distance weapons. Use one (or several) sprite sheet(s) for the graphics. 
 Save and load a hiscore list with ten entries. As stated above, use the time fix, and use classes and objects. Work in two-person teams
 
 Program Title: 
 Program Description: 
 
 Author: Leong Wei Kong & Nicholas Tan Joo Sin
 Reference: XXX
 Developer Notes: XXX
 */

PFont font1;
PFont font2;
Player player1;
Player player2;
PImage img1;
PImage img2;
int ticksLastUpdate = millis();
int[][] levelOne = {
    {0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 1}, 
    {1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
    {1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
    {1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
    {1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
    {1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
    {1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
    {1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
    {1, 1, 1, 1, 1, 1, 1, 1, 1, 1}
  };

void setup() {
  size(320, 320);
  img1 = loadImage("brick_brown5.png");
  img2 = loadImage("brick_brown6.png");
  //font1 = createFont("tamagotchi.ttf", 35);
  //font2 = createFont("tamagotchi.ttf", 35);
  player1 = new Player("Warrior");
  player2 = new Player("Wizard");
  //noStroke();
  //drawLevel();
  
}

void draw() {
  fill(100);
  rect(0,0,500,500);
  noStroke();
  drawLevel();
  fill(0);
  player1.updateMovement(ticksLastUpdate);
  player2.updateMovement(ticksLastUpdate);
  ticksLastUpdate = millis();
}

void drawLevel() {
  int tileSize = 32;
  for (int i=0; i<levelOne.length; i++) { //y axis
    for (int j=0; j<levelOne[i].length; j++) { //x axis
      switch(levelOne[i][j]) {
      case 0: //white = can move
        image(img1, j * tileSize, i * tileSize);
        //fill(255);
        //rect(j * tileSize, i * tileSize, tileSize, tileSize);
        break;
      case 1: //red = obstacle
        image(img2, j * tileSize, i * tileSize);
        //fill(255,0, 0);
        //rect(j * tileSize, i * tileSize, tileSize, tileSize);
        break;
      }
    }
  }
}

void keyPressed() {
  //Player 1
  if (char(keyCode) == 'W') {
    player1.moveUp();
  }
  if (char(keyCode) == 'S') {
    player1.moveDown();
  }
  if (char(keyCode) == 'A') {
    player1.moveLeft();
  }
  if (char(keyCode) == 'D') {
    player1.moveRight();
    //player1.direction = -1;
  }
  //Player 2
  if (char(keyCode) == UP) {
    player2.moveUp();
  }
  if (char(keyCode) == DOWN) {
    player2.moveDown();
  }
  if (char(keyCode) == LEFT) {
    player2.moveLeft();
  }
  if (char(keyCode) == RIGHT) {
    player2.moveRight();
    //player1.direction = -1;
  }
}

void keyReleased() {
  //Player 1
  if (char(keyCode) == 'W') {
    player1.resetUp();
  }
  if (char(keyCode) == 'S') {
    player1.resetDown();
  }
  if (char(keyCode) == 'A') {
    player1.resetLeft();
  }
  if (char(keyCode) == 'D') {
    player1.resetRight();
  }

  //Player 2
  if (char(keyCode) == UP) {
    player2.resetUp();
  }
  if (char(keyCode) == DOWN) {
    player2.resetDown();
  }
  if (char(keyCode) == LEFT) {
    player2.resetLeft();
  }
  if (char(keyCode) == RIGHT) {
    player2.resetRight();
  }
}