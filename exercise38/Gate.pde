class Gate { // This class draws the gates that can be unlocked with statues
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