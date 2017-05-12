
class HighScore
{
  // Persisted data which loads from a text file
  String[] highScores = loadStrings("highscores.txt");
  String[] names;
  int[] scores;
  final int NO_OF_HIGHSCORES = 10;
  
  // Splits the String list into names array and scores array respectively. The order of the names/scores can be identified by their indexes. 
  HighScore()
  {    
    names = new String[NO_OF_HIGHSCORES];
    scores = new int[NO_OF_HIGHSCORES];
    
    for (int i = 0; i < highScores.length; i++) 
    {
      String line = highScores[i];
      names[i] = line.substring(0,line.indexOf(','));
      scores[i] = Integer.valueOf(line.substring(line.indexOf(',')+1));
      
    }
  }
  
  // Check if the score is a new high score
  boolean checkHighScore(int score)
  {
    return score > scores[NO_OF_HIGHSCORES - 1];
  }
  
  // Insert the new high score, push the lower scores down, and remove the lowest score if necessary
  void overWrite(String name, int score)
  {
    int indexOverWrote = 9; 
    String prevName = "";
    int prevScore = 0;
    for (int i = 0; i < NO_OF_HIGHSCORES; i++)
    {
      if (score > scores[i]) 
      {
        indexOverWrote = i + 1;
        prevName = names[i];
        prevScore = scores[i];
        names[i] = name;
        scores[i] = score;
        break;
      }
    }    
   
    String nameToRmb = "";
    int scoreToRmb = 0;
    if (indexOverWrote < 9)
    {
     for (int i = indexOverWrote; i < NO_OF_HIGHSCORES; i++)
      { 
          nameToRmb = names[i];
          scoreToRmb = scores[i];
          names[i] = prevName;
          scores[i] = prevScore;
          prevName = nameToRmb;
          prevScore = scoreToRmb;
      }      
    }    
    save();
  }
  
  // Save the current String List to the text file
  void save()
  {
    for (int i = 0; i < NO_OF_HIGHSCORES; i++)
    {
       highScores[i] = names[i] + "," + scores[i];     
    }
    saveStrings("highscores.txt", highScores);
  }
  
  // Pretty print the names and highscores and return it as a string
  String toString()
  {
    String result = "";
    for (int i = 0; i < NO_OF_HIGHSCORES; i++)
    {
      result += names[i] + " - " + scores[i] + "\n";
    }
    return result;
  }
  
  int getHighScore()
  {
    return scores[0];    
  }
}