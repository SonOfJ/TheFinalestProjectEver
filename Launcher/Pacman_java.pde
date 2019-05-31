class Pacman implements Displayable {
  PImage img;
  Node currentNode; //The Node that Pac-Man is currently on.
  int lives; //How many lives remaining.
  int x;
  int y;
  Pacman(Node newCurrent, int newX, int newY) {
    img = loadImage("pacmanRight.png"); //Start with Pac-Man facing to the right.
    currentNode = newCurrent; //Initialize node.
    lives = 3; //Start with three lives.
    x = newX;
    y = newY;
  }
  void display() {
    image(img, x, y, 50, 50);
  }
  boolean eat() { //Pac-Man eats the dot in the node it is currently at.
    if (currentNode.hasDot) { //If there is a dot at the node...
      currentNode.d.eat();
      currentNode.removeDot(); //Remove the dot.
      fill(0); //Visually remove the dot by drawing over it with a black node.
      rect(x, y, 50, 50);
      return true; //Eaten.
    } //There is no dot.
    return false;
  }
}
