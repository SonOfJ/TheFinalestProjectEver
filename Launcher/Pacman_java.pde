class Pacman implements Displayable {
  PImage img;//image to be displayed
  Node currentNode; //The Node that Pac-Man is currently on.
  float x;//x cor
  float y;//y cor
  Pacman(Node newCurrent, float newX, float newY) {
    img = loadImage("pacmanRight.png"); //Start with Pac-Man facing to the right.
    currentNode = newCurrent; //Initialize node.
    x = newX;//set x
    y = newY;//set y
  }
  void display() {//display for visuals
    image(img, x, y, 37.5, 37.5);
  }
  boolean eat() { //Pac-Man eats the dot in the node it is currently at.
    if (currentNode.hasDot) { //If there is a dot at the node...
      currentNode.d.eat();
      currentNode.removeDot(); //Remove the dot.
      return true; //Eaten.
    } //There is no dot.
    return false;
  }
}
