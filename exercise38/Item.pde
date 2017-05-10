class Item {
  int type;
  int posX;
  int posY;
  int itemWidth = tileSize;
  int itemHeight = tileSize;
  Item(int type, int posX, int posY) {
    this.type = type;
    this.posX = posX;
    this.posY = posY;
    drawObj();
  }

  void drawObj() {
    imageMode(CORNER);
    image(loadImage("switch.png"), posX, posY);
  }

  int getPosX() {
    return posX;
  }

  int getPosY() {
    return posY;
  }

  int getItemWidth() {
    return itemWidth;
  }

  int getItemHeight() {
    return itemHeight;
  }
}