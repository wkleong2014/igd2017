/* 
 Exercise 38: Make a Gauntlet-style game (Figure 4) for three (or more) simultanious player1s. Your implementation does not need to be (and should not be) a clone, 
 but an original and modern reinterpretation. Make a playable, interesting and finished game (include, at least, starting the game, winning/losing, score, 
 restart, 16 levels, various kinds of enemies). As the original, it is top-down 2D, non-splitscreen; the player1 characters have different abilities and 
 strengths, and use projectile weapons (not e.g. lasers) as distance weapons. Use one (or several) sprite sheet(s) for the graphics. 
 Save and load a hiscore list with ten entries. As stated above, use the time fix, and use classes and objects. Work in two-person teams
 
 Program Title: Dungeon Fungeon
 Program Description:  Dungeon Fungeon has 16 levels. Get to the deepest dungeon to win!
 
 Author: Leong Wei Kong & Nicholas Tan Joo Sin
  
 Classes:
 Giant attacks with hammer. 
 Knight attacks with sword.
 Mage attacks with fireball.
 Archer attacks with arrow.
 
 Controls:
 Up Left Down Right + Attack
 Player 1 - W A S D + X
 Player 2 - G V B N + SPACE
 Player 3 - I J K L + M
 Player 4 - ^ < v > + ENTER
 
 Credits:
 Title Font - Louisanne - http://www.dafont.com/louisianne.font
 GUI Font - Minecraft - http://www.dafont.com/minecraft.font
 Spritesheet - https://github.com/jakesgordon/javascript-gauntlet/blob/master/images/entities.png
 Tiles - https://opengameart.org/sites/default/files/crawl-tiles%20Oct-5-2010.zip
 
 Git: https://github.com/wkleong2014/pgd2017
*/

Level level;
GUI gui;

Player player1;
Player player2;
Player player3;
Player player4;

PImage spriteSheet;
PImage gateSprite;

PFont titleFont;
PFont guiFont;

int classCounter1 = 0;
int classCounter2 = 0;
int classCounter3 = 0;
int classCounter4 = 0;

final int TILE_SIZE = 32;

boolean isWPressed = false;
boolean isSPressed = false;
boolean isAPressed = false;
boolean isDPressed = false;
boolean isGPressed = false;
boolean isBPressed = false;
boolean isVPressed = false;
boolean isNPressed = false;
boolean isIPressed = false;
boolean isKPressed = false;
boolean isJPressed = false;
boolean isLPressed = false;
boolean isUpPressed = false;
boolean isDownPressed = false;
boolean isLeftPressed = false;
boolean isRightPressed = false;
boolean hasPlayer1Joined = false;
boolean hasPlayer2Joined = false;
boolean hasPlayer3Joined = false;
boolean hasPlayer4Joined = false;
boolean hasPlayer1Classed = false;
boolean hasPlayer2Classed = false;
boolean hasPlayer3Classed = false;
boolean hasPlayer4Classed = false;
boolean hasStartScreen = true;
boolean gameOver = false; 
boolean allDead = false;

// Variables to facilitate highscore feature
int totalScore;
int highscore;
HighScore highscores;
boolean newHighScore = false;
boolean enteredHighScore = false;
String name="";
int state = 0; 

void setup() {  
  size(1000, 640);
  spriteSheet = loadImage("sprites.png"); 
  gateSprite = loadImage("gate.png");
  titleFont = createFont("Louisianne.ttf", 32); 
  guiFont = createFont("Minecraft.ttf", 32);  
  level = new Level();
  gui = new GUI();
  highscores = new HighScore();
  highscore = highscores.getHighScore();
}

void draw() {
  fill(100);
  rect(0, 0, 500, 500);
  noStroke();
  gui.update(); // Draws GUI  
  
  // Start updating level when start screen is skipped
  if (!gui.getHasStartScreen()) {
    hasStartScreen = false;
    level.update();
  }

  // Level 1 instructions
  if (!gui.getHasStartScreen() && level.getLevelNo() == 1) 
  {
    fill(255);
    textAlign(CENTER, CENTER);
    textFont(guiFont);
    textSize(40);
    text("PLAYERS, GATHER NOW!", 320, height-130);
    textSize(20);
    text("Ensure all players have joined before entering the dungeon!\nRemember that the statues will unlock the gates\nand potions can save your lives!", 320, height-70);
  }

  // At level 2, clear players who have not joined or has not selected a class
  // NullPointerException is expected and is caught
  try
  {
    if (level.getLevelNo() > 1
      && (!hasPlayer1Joined || player1 == null || player1.getIsDead())
      && (!hasPlayer2Joined || player2 == null  || player2.getIsDead()) 
      && (!hasPlayer3Joined || player3 == null  || player3.getIsDead()) 
      && (!hasPlayer4Joined || player4 == null  || player4.getIsDead()))
    {
      allDead = true;
    }
  } 
  catch (Exception e)
  {
  }
  
  // If all players are dead, game is over
  if (allDead || level.hasEnded()) {
    rectMode(CORNERS);
    fill(0);
    rect(0, 0, 640, 640);
    fill(255);
    textAlign(CENTER, CENTER);
    textFont(guiFont);
    textSize(50);
    gameOver = true;
    text("GAME OVER", 320, 100);
    textSize(30);
  
    // Sum all players' scores
    totalScore = 0;
    if (player1 != null) totalScore += player1.score;
    if (player2 != null) totalScore += player2.score;
    if (player3 != null) totalScore += player3.score;
    if (player4 != null) totalScore += player4.score;

    // Check if player has a new high score (Must be > than the current high score)
    newHighScore = highscores.checkHighScore(totalScore);

    // If no high score is achieved, assume high score has been entered
    if (!newHighScore) 
    {
      enteredHighScore = true;
    }

    // Waits for player to enter his name
    if (newHighScore && !enteredHighScore)
    {
      switch (state) {
      case 0:
        fill(255);
        textAlign(CENTER, CENTER);
        text ("New High Score!\nEnter your team name and hit enter:\n"+name, 320, 260); 
        break;
      }
    } else
    {        
      textAlign(CENTER, CENTER);
      text("PRESS ANY KEY TO START A NEW GAME", 320, height-100);
      textSize(23);
      text(highscores.toString(), 320, 340);
    }
  }
}

void keyPressed() {  
  // Skip start screen
  if (hasStartScreen) 
  {
    gui.removeStartScreen();
  }

  //Player 1's movement controls
  if (player1 != null) {
    if (char(keyCode) == 'W') {
      player1.moveUp();
      isWPressed = true;
      player1.setDirection(0);
    }
    if (char(keyCode) == 'S') {
      player1.moveDown();
      isSPressed = true;
      player1.setDirection(4);
    }
    if (char(keyCode) == 'A') {
      player1.moveLeft();
      isAPressed = true;
      player1.setDirection(6);
    }
    if (char(keyCode) == 'D') {
      player1.moveRight();
      isDPressed = true;
      player1.setDirection(2);
    }
    if (char(keyCode) == 'A' && isWPressed || char(keyCode) == 'W' && isAPressed) player1.setDirection(7);
    if (char(keyCode) == 'D' && isWPressed || char(keyCode) == 'W' && isDPressed) player1.setDirection(1);
    if (char(keyCode) == 'A' && isSPressed || char(keyCode) == 'S' && isAPressed) player1.setDirection(5);
    if (char(keyCode) == 'D' && isSPressed || char(keyCode) == 'S' && isDPressed) player1.setDirection(3);
  }

  //Player 2's movement controls
  if (player2 != null) {
    if (char(keyCode) == 'G') {
      player2.moveUp();
      isGPressed = true;
      player2.setDirection(0);
    }
    if (char(keyCode) == 'B') {
      player2.moveDown();
      isBPressed = true;
      player2.setDirection(4);
    }
    if (char(keyCode) == 'V') {
      player2.moveLeft();
      isVPressed = true;
      player2.setDirection(6);
    }
    if (char(keyCode) == 'N') {
      player2.moveRight();
      isNPressed = true;
      player2.setDirection(2);
    }
    if (char(keyCode) == 'V' && isGPressed || char(keyCode) == 'G' && isVPressed) player2.setDirection(7);
    if (char(keyCode) == 'N' && isGPressed || char(keyCode) == 'G' && isNPressed) player2.setDirection(1);
    if (char(keyCode) == 'V' && isBPressed || char(keyCode) == 'B' && isVPressed) player2.setDirection(5);
    if (char(keyCode) == 'N' && isBPressed || char(keyCode) == 'B' && isNPressed) player2.setDirection(3);
  }

  //Player 3's movement controls
  if (player3 != null) {
    if (char(keyCode) == 'I') {
      player3.moveUp();
      isIPressed = true;
      player3.setDirection(0);
    }
    if (char(keyCode) == 'K') {
      player3.moveDown();
      isKPressed = true;
      player3.setDirection(4);
    }
    if (char(keyCode) == 'J') {
      player3.moveLeft();
      isJPressed = true;
      player3.setDirection(6);
    }
    if (char(keyCode) == 'L') {
      player3.moveRight();
      isLPressed = true;
      player3.setDirection(2);
    }
    if (char(keyCode) == 'J' && isIPressed || char(keyCode) == 'I' && isJPressed) player3.setDirection(7);
    if (char(keyCode) == 'L' && isIPressed || char(keyCode) == 'I' && isLPressed) player3.setDirection(1);
    if (char(keyCode) == 'J' && isKPressed || char(keyCode) == 'K' && isJPressed) player3.setDirection(5);
    if (char(keyCode) == 'L' && isKPressed || char(keyCode) == 'K' && isLPressed) player3.setDirection(3);
  }

  //Player4's movement controls
  if (player4 != null) {
    if (char(keyCode) == UP) {
      player4.moveUp();
      isUpPressed = true;
      player4.setDirection(0);
    }
    if (char(keyCode) == DOWN) {
      player4.moveDown();
      isDownPressed = true;
      player4.setDirection(4);
    }
    if (char(keyCode) == LEFT) {
      player4.moveLeft();
      isLeftPressed = true;
      player4.setDirection(6);
    }
    if (char(keyCode) == RIGHT) {
      player4.moveRight();
      isRightPressed = true;
      player4.setDirection(2);
    }
    if (char(keyCode) == LEFT && isUpPressed || char(keyCode) == UP && isLeftPressed) player4.setDirection(7);
    if (char(keyCode) == RIGHT && isUpPressed || char(keyCode) == UP && isRightPressed) player4.setDirection(1);
    if (char(keyCode) == LEFT && isDownPressed || char(keyCode) == DOWN && isLeftPressed) player4.setDirection(5);
    if (char(keyCode) == RIGHT && isDownPressed || char(keyCode) == DOWN && isRightPressed) player4.setDirection(3);
  }
  
  // Start a new game
  if (enteredHighScore && gameOver) 
  {     
    newGame();
  }
  
  // If game is over and a new high score has been achieved
  if (gameOver && newHighScore) 
  {
    if (enteredHighScore == false)
    {
      // Confirmation for entered name for high score by hitting enter
      if (key==ENTER||key==RETURN || keyCode==10)      
      {       
        highscores.overWrite(name, totalScore);
        enteredHighScore = true;
      } else
      {
        // Backspace to clear the last character in the entered name
        if (keyCode == 8 && name.length() > 0)
        {        
          name = name.substring (0, max(0, name.length()-1));
        } else if ((key >= 'A' && key <= 'z') && name.length() <= 10) // Typing of name for high score
        {
          name+=key;
        }
      }
    }
  }
}

void keyReleased() {
  // Player controls for movement
  // Movement is fluid and keyReleased needs to be detected to enable the resetting of movement when a directional button is released
  // Player 1
  if (player1 != null) { // Player has been initialized, controls are used for movement and shooting projectiles
    // Movement controls, 8 directional
    if (char(keyCode) == 'W') {
      player1.resetUp();  
      isWPressed = false;
      if (isSPressed) player1.setDirection(4);
      if (isAPressed) player1.setDirection(6);
      if (isDPressed) player1.setDirection(2);
    }
    if (char(keyCode) == 'S') {
      player1.resetDown();
      isSPressed = false;
      if (isWPressed) player1.setDirection(0);
      if (isAPressed) player1.setDirection(6);
      if (isDPressed) player1.setDirection(2);
    }
    if (char(keyCode) == 'A') {
      player1.resetLeft();
      isAPressed = false;
      if (isDPressed) player1.setDirection(2);
      if (isWPressed) player1.setDirection(0);
      if (isSPressed) player1.setDirection(4);
    }
    if (char(keyCode) == 'D') {
      player1.resetRight();
      isDPressed = false;
      if (isAPressed) player1.setDirection(6);
      if (isWPressed) player1.setDirection(0);
      if (isSPressed) player1.setDirection(4);
    }
    if (char(keyCode) == 'X') {
      player1.shootProjectile();
    }
  } else { // Player has not been initialized, hence controls are used to join game and toggle class selection
    if (char(keyCode) == 'A') 
    {
      if (classCounter1 == 0) 
      {
        classCounter1 = 3;
      } else
      {
        classCounter1--;
      }
    }
    if (char(keyCode) == 'D') 
    {
      if (classCounter1 == 3) 
      {
        classCounter1 = 0;
      } else
      {
        classCounter1++;
      }
    }
    if (char(keyCode) == 'X' && !hasPlayer1Joined && level.getLevelNo() == 1) {  // Join game
      hasPlayer1Joined = true;
    } else if (char(keyCode) == 'X' && hasPlayer1Joined && level.getLevelNo() == 1) {  // Select class
      player1 = new Player(classCounter1, 1);
      hasPlayer1Classed = true;
    }
  }

  //Player 2
  if (player2 != null) {// Player has been initialized, controls are used for movement and shooting projectiles
    // Movement controls, 8 directional
    if (char(keyCode) == 'G') {
      player2.resetUp();
      isGPressed = false;
      if (isBPressed) player2.setDirection(4);
      if (isVPressed) player2.setDirection(6);
      if (isNPressed) player2.setDirection(2);
    }
    if (char(keyCode) == 'B') {
      player2.resetDown();
      isBPressed = false;
      if (isGPressed) player2.setDirection(0);
      if (isVPressed) player2.setDirection(6);
      if (isNPressed) player2.setDirection(2);
    }
    if (char(keyCode) == 'V') {
      player2.resetLeft();
      isVPressed = false;
      if (isNPressed) player2.setDirection(2);
      if (isGPressed) player2.setDirection(0);
      if (isBPressed) player2.setDirection(4);
    }
    if (char(keyCode) == 'N') {
      player2.resetRight();
      isNPressed = false;
      if (isVPressed) player2.setDirection(6);
      if (isGPressed) player2.setDirection(0);
      if (isBPressed) player2.setDirection(4);
    }
    if (char(keyCode) == ' ') {
      player2.shootProjectile();
    }
  } else { // Player has not been initialized, hence controls are used to join game and toggle class selection
    if (char(keyCode) == 'V') 
    {
      if (classCounter2 == 0) 
      {
        classCounter2 = 3;
      } else
      {
        classCounter2--;
      }
    }
    if (char(keyCode) == 'N') 
    {
      if (classCounter2 == 3) 
      {
        classCounter2 = 0;
      } else
      {
        classCounter2++;
      }
    }
    if (char(keyCode) == ' ' && !hasPlayer2Joined && level.getLevelNo() == 1) {  // Join game
      hasPlayer2Joined = true;
    } else if (char(keyCode) == ' ' && hasPlayer2Joined  && level.getLevelNo() == 1) { // Select class
      player2 = new Player(classCounter2, 2);
      hasPlayer2Classed = true;
    }
  }

  //Player 3
  if (player3 != null) { // Player has been initialized, controls are used for movement and shooting projectiles
    // Movement controls, 8 directional
    if (char(keyCode) == 'I') {
      player3.resetUp();
      isIPressed = false;
      if (isKPressed) player3.setDirection(4);
      if (isJPressed) player3.setDirection(6);
      if (isLPressed) player3.setDirection(2);
    }
    if (char(keyCode) == 'K') {
      player3.resetDown();
      isKPressed = false;
      if (isIPressed) player3.setDirection(0);
      if (isJPressed) player3.setDirection(6);
      if (isLPressed) player3.setDirection(2);
    }
    if (char(keyCode) == 'J') {
      player3.resetLeft();
      isJPressed = false;
      if (isLPressed) player3.setDirection(2);
      if (isIPressed) player3.setDirection(0);
      if (isKPressed) player3.setDirection(4);
    }
    if (char(keyCode) == 'L') {
      player3.resetRight();
      isLPressed = false;
      if (isJPressed) player3.setDirection(6);
      if (isIPressed) player3.setDirection(0);
      if (isKPressed) player3.setDirection(4);
    }
    if (char(keyCode) == 'M') {
      player3.shootProjectile();
    }
  } else { // Player has not been initialized, hence controls are used to join game and toggle class selection
    if (char(keyCode) == 'J') 
    {
      if (classCounter3 == 0) 
      {
        classCounter3 = 3;
      } else
      {
        classCounter3--;
      }
    }
    if (char(keyCode) == 'L') 
    {
      if (classCounter3 == 3) 
      {
        classCounter3 = 0;
      } else
      {
        classCounter3++;
      }
    }
    if (char(keyCode) == 'M' && !hasPlayer3Joined && level.getLevelNo() == 1) {  // Join game
      hasPlayer3Joined = true;
    } else if (char(keyCode) == 'M' && hasPlayer3Joined  && level.getLevelNo() == 1) { // Select class
      player3 = new Player(classCounter3, 3);
      hasPlayer3Classed = true;
    }
  }

  //Player4
  if (player4 != null) { // Player has been initialized, controls are used for movement and shooting projectiles
    // Movement controls, 8 directional
    if (char(keyCode) == UP) {
      player4.resetUp();
      isUpPressed = false;
      if (isDownPressed) player4.setDirection(4);
      if (isLeftPressed) player4.setDirection(6);
      if (isRightPressed) player4.setDirection(2);
    }
    if (char(keyCode) == DOWN) {
      player4.resetDown();
      isDownPressed = false;
      if (isUpPressed) player4.setDirection(0);
      if (isLeftPressed) player4.setDirection(6);
      if (isRightPressed) player4.setDirection(2);
    }
    if (char(keyCode) == LEFT) {
      player4.resetLeft();
      isLeftPressed = false;
      if (isRightPressed) player4.setDirection(2);
      if (isUpPressed) player4.setDirection(0);
      if (isDownPressed) player4.setDirection(4);
    }
    if (char(keyCode) == RIGHT) {
      player4.resetRight();
      isRightPressed = false;
      if (isLeftPressed) player4.setDirection(6);
      if (isUpPressed) player4.setDirection(0);
      if (isDownPressed) player4.setDirection(4);
    }
    if (key == ENTER) {
      player4.shootProjectile();
    }
  } else { // Player has not been initialized, hence controls are used to join game and toggle class selection
    if (char(keyCode) == LEFT) 
    {
      if (classCounter4 == 0) 
      {
        classCounter4 = 3;
      } else
      {
        classCounter4--;
      }
    }
    if (char(keyCode) == RIGHT) 
    {
      if (classCounter4 == 3) 
      {
        classCounter4 = 0;
      } else
      {
        classCounter4++;
      }
    }
    if (key == ENTER && !hasPlayer4Joined && level.getLevelNo() == 1) {  // Join game
      hasPlayer4Joined = true;
    } else if (key == ENTER && hasPlayer4Joined && level.getLevelNo() == 1) { // Select class
      player4 = new Player(classCounter4, 4);
      hasPlayer4Classed = true;
    }
  }
}

void mouseClicked()
{
  // Skip start screen
  if (hasStartScreen) 
  {
    gui.removeStartScreen();
  }

  // Start a new game
  if (enteredHighScore && gameOver) 
  { 
    newGame();
  }
}

// Resets the variables for a new game
void newGame()
{ 
  gameOver = false;
  highscores = new HighScore();
  enteredHighScore = false;
  name = "";
  player1 = null;
  player2 = null;
  player3 = null;
  player4 = null;
  hasPlayer1Joined = false;
  hasPlayer2Joined = false;
  hasPlayer3Joined = false;
  hasPlayer4Joined = false;
  level.restart();
  allDead = false; 
  level = new Level();
  highscore = highscores.getHighScore();
}