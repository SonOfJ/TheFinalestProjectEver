class Dot {
  Node currentNode;
  boolean there;
  Dot(Node newCurrent) {
    currentNode = newCurrent;
    there = true;
  }
  void eat() {
    there = false;
  }
  boolean getState() {
    return there;
  }
}
