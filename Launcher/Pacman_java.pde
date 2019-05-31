class Pacman implements Displayable {
  PImage img;//pacman image
  Node currentNode;//the Node that PacMan is currently on
  int lives;//how many lives remaining
  int x;//x cor
  int y;//y cor
  Pacman(Node newCurrent, int newX, int newY) {
    img = loadImage("pacmanRight.png");//start PacMan facing to the right
    currentNode = newCurrent;//initialize value
    lives = 3;//start with three lives
    x = newX;//initialize value
    y = newY;//initialize value
  }
  void display() {
    image(img, x, y, 50, 50); 
  }
  boolean eat() {//PacMan eats the Dot in the Node it is currently at
    if (currentNode.hasDot) { // If there is a dot at the node...
      currentNode.d.eat();
      currentNode.removeDot(); // Remove the dot.
      fill(0);//visually remove the dot by drawing over it with a black dot
      rect(x, y, 50, 50);
      return true;
    }
    return false;
  }
  Node getNode() {//accessor method
    return currentNode;
  }
}
