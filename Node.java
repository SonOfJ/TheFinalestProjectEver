class Node {
  E data;
  Node up;
  Node down;
  Node left;
  Node right;
  Node(E newData, Node newUp, Node newDown, Node newLeft, Node newRight) {
    data = newData;
    up = newUp;
    down = newDown;
    left = newLeft;
    right = newRight;
  }
  E getData() {
    return data;
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
