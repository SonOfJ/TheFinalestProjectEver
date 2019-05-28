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
  boolean eat() {
    if (currentNode.hasDot()) { // If there is a dot at the node...
      currentNode.d.eat();
      currentNode.removeDot(); // Remove the dot.
      fill(0);
      rect(x, y, 50, 50);
      return true;
    }
    return false;
  }
  void damage() {
    lives = lives - 1;
  }
  Node getNode() {
    return currentNode;
  }
}