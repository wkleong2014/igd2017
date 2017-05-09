class Exit{
 int posX;
 int posY;
 int exitWidth = tileSize;
 int exitHeight = tileSize;
 
 Exit(int x, int y){
   posX = x * tileSize;
   posY = y * tileSize;
   image(loadImage("30.png"), posX, posY);
 }
}