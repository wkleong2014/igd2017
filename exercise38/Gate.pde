class Gate {
  int posX;
  int posY;
  Gate(int posX, int posY) {
    this.posX = posX;
    this.posY = posY;
    drawObj();
  }

  void drawObj() {
    imageMode(CORNER);
    image(gateSprite, posX, posY);
  }
}