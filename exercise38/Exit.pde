class Exit{
 int posX;
 int posY;
 int exitWidth = tileSize;
 int exitHeight = tileSize;
 
 Exit(int x, int y){
   posX = x * tileSize;
   posY = y * tileSize;
   image(loadImage("exit.png"), posX, posY);
 }
}