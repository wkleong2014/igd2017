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
    switch(type){
      case 0:
        image(loadImage("switch.png"), posX, posY);
        break;
      case 1:
        image(loadImage("potion.png"), posX, posY);
        break;
    }
    
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