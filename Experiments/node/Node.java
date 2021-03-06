
class Node {
  Node up;
  Node down;
  Node left;
  Node right;
  boolean path;
  boolean hasDot;
  boolean pacmanHere;
  boolean ghostHere;
  Dot dot;
  Node(Node newUp, Node newDown, Node newLeft, Node newRight, boolean patState) {
    //data = newData;
    up = newUp;
    down = newDown;
    left = newLeft;
    right = newRight;
    path = patState;
    if (patState) {
      hasDot = true;
    } else {
      hasDot = false;
    }
    pacmanHere = false;
    ghostHere = false;
    dot = new Dot(this);
  }
  Node(){
    dot = new Dot(this);
  }
  boolean hasDot(){
    return hasDot;
  }
  void removeDot(){
    dot = null;
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
  void display(int x, int y){
    rect(x, y, 100, 100);
  }
  
}
