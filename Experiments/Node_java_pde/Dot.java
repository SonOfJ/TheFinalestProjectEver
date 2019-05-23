
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
  void display(int x, int y) {
    //fill(255, 255, 0); //Set to yellow.
    ellipse(x, y, 10, 10);
  }
}
