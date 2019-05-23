class Node implements Displayable {
  Node up;
  Node down;
  Node left;
  Node right;
  boolean path;
  boolean hasDot;
  boolean pacmanHere;
  boolean ghostHere;
  int x;
  int y;
  Dot d;
  Node(Node newUp, Node newDown, Node newLeft, Node newRight, boolean patState) {
    up = newUp;
    down = newDown;
    left = newLeft;
    right = newRight;
    path = patState;
    hasDot = true;
    pacmanHere = false;
    ghostHere = false;
  }
  boolean hasDot(){
    return hasDot;
  }
  void removeDot(){
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
  Node up() {
    return up;
  }
  Node down() {
    return down;
  }
  Node left() {
    return left;
  }
  Node right() {
    return right;
  }
  boolean pacmanHere(){
    return pacmanHere;
  }
  void addPacman(){
    removeDot();
    pacmanHere = true;
  }
  void removePacman(){
    pacmanHere = false;
  }
  boolean ghostHere() {
    return ghostHere;
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
}
