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
      
      if (!hasPlayer1Joined) {
        fill(255,0,0);
        text("PLAYER 1\nPRESS 'X' TO JOIN!", 820, 260);
      }
      else if (hasPlayer1Joined && player1 == null)
      {
        fill(255,0,0);
        text("PLAYER 1\n< " + classes[classCounter1] +" >", 820, 260);
      }      
      else if (hasPlayer1Joined && player1 != null)
      {
        fill(255,0,0);
        text(classes[classCounter1] +"\nHP: XXX SCORE: XXX", 820, 260);
      }
      
      
      
      fill(0,255,0);
      text("PLAYER 2\nPRESS 'SPACE' TO JOIN!", 820, 367);
      
      fill(0,0,255);
      text("PLAYER 3\nPRESS 'M' TO JOIN!", 820, 473);
      
      fill(0,255,255);
      text("PLAYER 4\nPRESS 'ENTER' TO JOIN!", 820, 580);
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