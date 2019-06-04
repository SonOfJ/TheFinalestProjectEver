class Dot implements Displayable {
  Node currentNode;//Node the Dot is at
  boolean there; //Does the dot exist?
  float x;//x cor
  float y;//y cor
  Dot(float newX, float newY) {//contructor
    x = newX;//set x
    y = newY;//set y
    there = true; //Upon creation, the dot exists.
  }
  void eat() {//PacMan eats the Dot
    there = false; //The dot no longer exists.
  }
  void display() {//for the visuals
    if (there) { //Only if the dot exists shall it be displayed.
      fill(255, 255, 0);//yellow color
      ellipse(x, y, 10, 10);//small circle
    }
  }
}
