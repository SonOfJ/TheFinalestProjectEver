class Node implements Displayable {
  Node up; 
  Node down;
  Node left;
  Node right;
  boolean path; //Response to whether or not the node can be stepped on.
  boolean hasDot; 
  boolean ghostHere;
  boolean pacmanHere;
  int x;
  int y;
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
  boolean hasUp() {
    return up != null;
  }
  boolean hasDown() {
    return down != null;
  }
  boolean hasLeft() {
    return left != null;
  }
  boolean hasRight() {
    return right != null;
  }
  void addGhost() {
    ghostHere = true;
  }
  void removeGhost() {
    ghostHere = false;
  }
  void setUp(Node other) {
    up = other;
  }
  void setDown(Node other) {
    down = other;
  }
  void setLeft(Node other) {
    left = other;
  }
  void setRight(Node other) {
    right = other;
  }
  boolean canWalk() {
    return path;
  }
  void display() {
    fill(0);
    rect(x, y, 50, 50);
  }
  void setX(int newX) {
    x = newX;
  }
  void setY(int newY) {
    y = newY;
  }
  int getX() {
    return x;
  }
  int getY() {
    return y;
  }
  void makeDot(int newX, int newY) {
    d = new Dot(newX, newY);
  }
  Dot getDot() {
    return d;
  }
  void addPacman() {
    pacmanHere = true;
  }
  boolean pacmanHere() {
    return pacmanHere;
  }
}
