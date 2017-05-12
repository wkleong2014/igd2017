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
    
    if (displayStartScreen) // Display start screen
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
      // Display GUI which is located on the right side of the screen
      textAlign(CENTER, CENTER);
      textFont(titleFont);
      textSize(60);
      fill(255);
      text("Dungeon", 820, 50);
      text("Fungeon", 820, 110);
      textFont(guiFont);
      textSize(30);  
      
      // Level Indicator
      if (gameOver) { // However, if game is over, display game over
        text("GAME OVER", 820, 180);
      } else { // Dsplay level number
        text("LEVEL " + level.getLevelNo(), 820, 180);
      }
      textSize(20);      
      text("HIGHSCORE: " + highscore, 820, 220);           
      
      // Player 1's Board
      fill(255, 0, 0);
      if (level.getLevelNo() > 1 && !hasPlayer1Classed) // Did not join the game after level 1
      {        
        rectMode(CENTER);
        stroke(255, 0, 0);
        rect(820, 285, 230, 30);
        fill(0);
        text("JOIN THE NEXT GAME!", 820, 285);
      } else 
      {         
        rectMode(CENTER);
        stroke(255, 0, 0);
        noFill();
        text("W A S D + X", 820, 260);
        rect(820, 260, 120, 25);
        if (!hasPlayer1Joined) {  // Has not joined
          text("PLAYER 1\nPRESS 'X' TO JOIN!", 820, 300);
        } else if (hasPlayer1Joined && player1 == null) // Has joined and choosing class
        {
          text("PLAYER 1\n< " + classes[classCounter1] +" >", 820, 300);
        } else if (hasPlayer1Joined && player1 != null) // Has joined and chose a class.
        {
          text("PLAYER 1 (" + classes[classCounter1] +")\nHP: " + player1.getHP() + " SCORE: " + player1.getScore(), 820, 300);
        }
      }

      // Player 2's Board
      fill(0, 255, 0);
      if (level.getLevelNo() > 1 && !hasPlayer2Classed) // Did not join the game after level 1
      {        
        rectMode(CENTER);
        stroke(0, 255, 0);
        rect(820, 375, 230, 30);
        fill(0);
        text("JOIN THE NEXT GAME!", 820, 375);
      } else 
      {   
        text("G V B N + SPACE", 820, 355); 
        stroke(0, 255, 0);
        noFill();
        rect(820, 355, 180, 25);
        if (!hasPlayer2Joined) {  // Has not joined
          text("PLAYER 2\nPRESS 'SPACE' TO JOIN!", 820, 395);
        } else if (hasPlayer2Joined && player2 == null)// Has joined and choosing class
        {
          text("PLAYER 2\n< " + classes[classCounter2] +" >", 820, 395);
        } else if (hasPlayer2Joined && player2 != null) // Has joined and chose a class.
        {
          text("PLAYER 2 (" + classes[classCounter2] +")\nHP: " + player2.getHP() + " SCORE: " + player2.getScore(), 820, 395);
        }
      }

      // Player 3's Board
      fill(0, 0, 255);
      if (level.getLevelNo() > 1 && !hasPlayer3Classed)  // Did not join the game after level 1
      {        
        rectMode(CENTER);
        stroke(0, 0, 255);
        rect(820, 465, 230, 30);
        fill(0);
        text("JOIN THE NEXT GAME!", 820, 465);
      } else
      {   
        text("I J K L + M", 820, 445); 
        stroke(0, 0, 255);
        noFill();
        rect(820, 445, 110, 25);
        if (!hasPlayer3Joined) {// Has not joined
          text("PLAYER 3\nPRESS 'M' TO JOIN!", 820, 485);
        } else if (hasPlayer3Joined && player3 == null)// Has joined and choosing class
        {
          text("PLAYER 3\n< " + classes[classCounter3] +" >", 820, 485);
        } else if (hasPlayer3Joined && player3 != null) // Has joined and chose a class.
        {
          text("PLAYER 3 (" + classes[classCounter3] +")\nHP: " + player3.getHP() + " SCORE: " + player3.getScore(), 820, 485);
        }
      }

      // Player 4's Board
      fill(0, 255, 255);  
      if (level.getLevelNo() > 1 && !hasPlayer4Classed)   // Did not join the game after level 1
      {        
        rectMode(CENTER);
        stroke(0, 255, 255);
        rect(820, 555, 230, 30);
        fill(0);
        text("JOIN THE NEXT GAME!", 820, 555);
      } else
      {  
        text("^ v < > + ENTER", 820, 540);
        stroke(0, 255, 255);
        noFill();
        rect(820, 540, 175, 25);
        noStroke();
        if (!hasPlayer4Joined) { // Has not joined
          text("PLAYER 4\nPRESS 'ENTER' TO JOIN!", 820, 580);
        } else if (hasPlayer4Joined && player4 == null) // Has joined and choosing class
        {
          text("PLAYER 4\n< " + classes[classCounter4] +" >", 820, 580);
        } else if (hasPlayer4Joined && player4 != null) // Has joined and chose a class.
        {
          text("PLAYER 4 (" + classes[classCounter4] +")\nHP: " + player4.getHP() + " SCORE: " + player4.getScore(), 820, 580);
        }
      }
      noStroke();
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