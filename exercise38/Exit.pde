class Exit{
 int posX;
 int posY;
 int exitWidth = tileSize;
 int exitHeight = tileSize;
 
 Exit(int x, int y){
   posX = x * tileSize;
   posY = y * tileSize;
   image(spriteSheet.get(384, 288, tileSize, tileSize), posX, posY);
 }
}