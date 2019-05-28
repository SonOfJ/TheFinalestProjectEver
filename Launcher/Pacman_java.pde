class Pacman implements Displayable {
  PImage img;
  Node currentNode;
  int lives;
  int x;
  int y;
  Pacman(Node newCurrent, int newX, int newY) {
    currentNode = newCurrent;
    lives = 3;
    x = newX;
    y = newY;
  }
  void display() {
    image(img, x, y, 50, 50); 
  }

  public void eat(){
    if(currentNode.hasDot()){//if there is a Dot at the node
      currentNode.removeDot();//remove the Dot
    }
  }
  void damage() {
    lives = lives - 1;
  }
  Node getNode() {
    return currentNode;
  }
}
