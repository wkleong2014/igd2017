class GUI
{ 
  PImage startScreen = loadImage("start_screen.png");
  boolean displayStartScreen;

  GUI() 
  {
    displayStartScreen = true;
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
      textSize(40);
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
      text("PLAYER 1\nPRESS 'X' TO JOIN!", 820, 260);
      
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