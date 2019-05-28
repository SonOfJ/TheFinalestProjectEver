class Dot implements Displayable {
  Node currentNode;
  boolean there;
  int x;
  int y;
  Dot(int newX, int newY) {
    x = newX;
    y = newY;
    there = true;
  }
  void eat() {
    there = false;
  }
  boolean getState() {
    return there;
  }
  void display() {
    if (there) {
      fill(255, 255, 0);
      ellipse(x, y, 15, 15);
    }
  }
}
