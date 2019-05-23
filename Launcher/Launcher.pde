void setup() {
  size(1600, 900);
  background(0, 0, 150);
  Maze m = new Maze();
  Node index = m.start();
  Node begin = m.start();
  int x = 0;
  int y = 0;
  for (int i = 0; i < 18; i = i + 1) {
    index = begin;
    x = 0;
    for (int j = 0; j < 32; j = j + 1) {
      if (index.canWalk()) {
        fill(0);
        rect(x, y, 50, 50);
        if (index.hasDot()) {
          fill(255, 255, 0);
          ellipse(x + 25, y + 25, 15, 15);
        }
      }
      if (index.hasRight()) {
        index = index.right();
        x = x + 50;
      }
    }
    if (begin.hasDown()) {
      begin = begin.down();
      y = y + 50;
    }
  }
}
/*
void loadImgs(){
  pacImgs = loadImage("pacman.png");
  ghost1img = loadImage("ghost1.png");
  ghost2img = loadImage("ghost1.png");
  ghost3img = loadImage("ghost1.png");
  ghost4img = loadImage("ghost1.png");
}


void draw(){
  
}
*/

  
