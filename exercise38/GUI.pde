class GUI
{ 
  PImage startScreen = loadImage("start_screen.png");
  boolean displayStartScreen;
  String[] classes; 
  
  GUI() 
  {
    displayStartScreen = true;
    classes = new String[]{"GIANT", "KNIGHT", "MAGE", "ARCHER"};    
  }

  void update()
  {
    background(0);
    if (displayStartScreen)
    {
      imageMode(CORNER);
      image(startScreen, 0, 0);
      textAlign(CENTER, CENTER);
      textFont(guiFont);
      textSize(30);
      fill(255);
      text("Press Any Key to Start", width/2, height-50);
    } else
    {     
      textAlign(CENTER, CENTER);
      textFont(titleFont);
      textSize(60);
      fill(255);
      text("Dungeon", 820, 50);
      text("Fungeon", 820, 110);
      textFont(guiFont);
      textSize(20);      
     
      text("HIGHSCORE: " + highscore,820,200);
      
      fill(255,0,0);
      if (!hasPlayer1Joined) {
        text("PLAYER 1\nPRESS 'X' TO JOIN!", 820, 260);
      }
      else if (hasPlayer1Joined && player1 == null)
      {
        text("PLAYER 1\n< " + classes[classCounter1] +" >", 820, 260);
      }      
      else if (hasPlayer1Joined && player1 != null)
      {
        text("PLAYER 1 (" + classes[classCounter1] +")\nHP: " + player1.getHP() + " SCORE: " + player1.getScore(), 820, 260);
      }
      
      fill(0,255,0);
      if (!hasPlayer2Joined) {
        text("PLAYER 2\nPRESS 'SPACE' TO JOIN!", 820, 367);
      }
      else if (hasPlayer2Joined && player2 == null)
      {
        text("PLAYER 2\n< " + classes[classCounter2] +" >", 820, 367);
      }      
      else if (hasPlayer2Joined && player2 != null)
      {
        text("PLAYER 2 (" + classes[classCounter2] +")\nHP: " + player2.getHP() + " SCORE: " + player2.getScore(), 820, 367);
      }
      
      fill(0,0,255);
      if (!hasPlayer3Joined) {
        text("PLAYER 3\nPRESS 'M' TO JOIN!", 820, 473);
      }
      else if (hasPlayer3Joined && player3 == null)
      {
        text("PLAYER 3\n< " + classes[classCounter3] +" >", 820, 473);
      }      
      else if (hasPlayer3Joined && player3 != null)
      {
        text("PLAYER 3 (" + classes[classCounter3] +")\nHP: " + player3.getHP() + " SCORE: " + player3.getScore(), 820, 473);
      }
      
      fill(0,255,255);
      if (!hasPlayer4Joined) {
        text("PLAYER 4\nPRESS 'ENTER' TO JOIN!", 820, 580);
      }
      else if (hasPlayer4Joined && player4 == null)
      {
        text("PLAYER 4\n< " + classes[classCounter4] +" >", 820, 580);
      }      
      else if (hasPlayer4Joined && player4 != null)
      {
        text("PLAYER 4 (" + classes[classCounter4] +")\nHP: " + player4.getHP() + " SCORE: " + player4.getScore(), 820, 580);
      }
    }
  }

  void displayStartScreen()
  {
    displayStartScreen = true;
  }

  void removeStartScreen()
  {
    displayStartScreen = false;
  }

  boolean getHasStartScreen()
  {
    return displayStartScreen;
  }
}