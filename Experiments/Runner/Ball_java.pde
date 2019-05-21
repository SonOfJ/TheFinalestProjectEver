class Ball {
  int x;
  int y;
  Ball(int xcor, int ycor) {
    x = xcor;
    y = ycor;
  }
  void display() {
    fill(255, 0, 0);
    circle(x, y, 100);
  }
}
