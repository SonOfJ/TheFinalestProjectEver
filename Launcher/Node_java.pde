class Node implements Displayable {
  Node up; 
  Node down;
  Node left;
  Node right;
  boolean path; //Response to whether or not the node can be stepped on.
  boolean hasDot; 
  boolean ghostHere;
  boolean pacmanHere;
  float x;
  float y;
  Dot d;
  Ghost g;
  Node(Node newUp, Node newDown, Node newLeft, Node newRight, boolean patState) {
    up = newUp;
    down = newDown;
    left = newLeft;
    right = newRight;
    path = patState;
    hasDot = true; //There is a dot by default. It won't matter if the node cannot be stepped on.
    ghostHere = false; //There is no ghost by default.
  }
  void removeDot() {
    hasDot = false;
  }
  boolean hasUp() { //Is there a node above?
    return up != null;
  }
  boolean hasDown() { //Is there a node below?
    return down != null;
  }
  boolean hasLeft() { //Is there a node to the left?
    return left != null;
  }
  boolean hasRight() { //Is there a node to the right?
    return right != null;
  }
  void addGhost() {
    ghostHere = true;
  }
  void removeGhost() {
    ghostHere = false;
  }
  void setDown(Node other) { //Used for building the nodes.
    down = other;
  }
  void setRight(Node other) { //Used for building the nodes.
    right = other;
  }
  void display() {
    fill(0, 0, 0); //Black.
    rectMode(CORNER);
    rect(x, y, 37.5, 37.5);
  }
  void makeDot(float newX, float newY) {
    d = new Dot(newX, newY);
  }
  void addPacman() {
    pacmanHere = true;
  }
  void setX(float newX) {
    x = newX;
  }
  void setY(float newY) {
    y = newY;
  }
}
