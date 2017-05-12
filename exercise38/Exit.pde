class Exit {
  int posX;
  int posY;
  int exitWidth = TILE_SIZE;
  int exitHeight = TILE_SIZE;

  Exit(int x, int y, int type) {
    posX = x * TILE_SIZE;
    posY = y * TILE_SIZE;
    if (type == 30) image(loadImage("30.png"), posX, posY);
    if (type == 31) image(loadImage("31.png"), posX, posY);
  }

  int getPosX() {
    return posX;
  }

  int getPosY() {
    return posY;
  }

  int getExitWidth() {
    return exitWidth;
  }

  int getExitHeight() {
    return exitHeight;
  }
}