class Node {
  E data;
  Node up;
  Node down;
  Node left;
  Node right;
  boolean hasDot;
  boolean pacmanHere;
  Node(E newData, Node newUp, Node newDown, Node newLeft, Node newRight) {
    data = newData;
    up = newUp;
    down = newDown;
    left = newLeft;
    right = newRight;
    hasDot = true;
    pacmanHere = false;
  }
  E getData() {
    return data;
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
    pacmanHere = true;
  }
  void removePacman(){
    pacmanHere = false;
  }
  E setData(E i) {
    E K = data;
    data = i;
    return K;
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
  String toString() {
    String K = "" + data;
    return K;
  }
}
