class Dot implements Displayable {
  Node currentNode;
  boolean there;
  int x;
  int y;
  Dot(int newX, int newY) {
    x = newX;
    y = newY;
  }
  void eat() {
    there = false;
  }
  boolean getState() {
    return there;
  }
  void display() {
    fill(255, 255, 0);
    ellipse(x, y, 15, 15);
  }
}
