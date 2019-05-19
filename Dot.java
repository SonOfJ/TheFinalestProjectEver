class Dot {
  Node currentNode;
  boolean eaten;
  Dot(Node newCurrent, boolean newState) {
    currentNode = newCurrent;
    eaten = newState;
  }
  display(int x, int y) {
    fill(255, 255, 0); //Set to yellow.
    circle(x, y, 10);
  }
}
