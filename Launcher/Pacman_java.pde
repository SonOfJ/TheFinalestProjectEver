class Pacman implements Displayable {
  PImage img;
  Node currentNode; //The Node that Pac-Man is currently on.
  int lives; //How many lives remaining.
  float x;
  float y;
  Pacman(Node newCurrent, float newX, float newY) {
    img = loadImage("pacmanRight.png"); //Start with Pac-Man facing to the right.
    currentNode = newCurrent; //Initialize node.
    lives = 3; //Start with three lives.
    x = newX;
    y = newY;
  }
  void display() {
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
