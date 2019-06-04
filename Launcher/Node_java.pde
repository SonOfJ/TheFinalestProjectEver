class Node implements Displayable {
  Node up; //Node on the top
  Node down;//Node on the bottom
  Node left;//Node to the left
  Node right;//Node to the right
  boolean path; //Response to whether or not the node can be stepped on.
  boolean hasDot; //keeps track if there is Dot there
  boolean ghostHere;//is there a Ghost here
  boolean pacmanHere;//is PacMan here
  float x;//x cor
  float y;//y cor
  Dot d;//holds a Dot
  Ghost g;//Hold a Ghost
  Node(Node newUp, Node newDown, Node newLeft, Node newRight, boolean patState) {
    up = newUp;//set Node on top
    down = newDown;//set Node to the bottom
    left = newLeft;//set Node to the left
    right = newRight;//set Node to the right
    path = patState;
    hasDot = true; //There is a dot by default. It won't matter if the node cannot be stepped on.
    ghostHere = false; //There is no ghost by default.
  }
  void removeDot() {//remove the Dot. Dot no longer there
    hasDot = false;//set boolean to false
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
  void addGhost() {//Ghost is now at this Node
    ghostHere = true;//set boolean to true
  }
  void removeGhost() {//Ghost is no longer at this Node
    ghostHere = false;//set boolean to false
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
  void makeDot(float newX, float newY) {//make a new Dot at x and y coordinates specified
    d = new Dot(newX, newY);//create new object
  }
  void addPacman() {//PacMan is at this Node
    pacmanHere = true;//set boolean to true
  }
  void setX(float newX) {//change x cor
    x = newX;
  }
  void setY(float newY) {//change y cor
    y = newY;
  }
}
