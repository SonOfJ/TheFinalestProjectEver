class Dot implements Displayable {
  Node currentNode;
  boolean there; //Does the dot exist?
  float x;
  float y;
  Dot(float newX, float newY) {
    x = newX;
    y = newY;
    there = true; //Upon creation, the dot exists.
  }
  void eat() {
    there = false; //The dot no longer exists.
  }
  void display() {
    if (there) { //Only if the dot exists shall it be displayed.
      fill(255, 255, 0);
      ellipse(x, y, 10, 10);
    }
  }
}
