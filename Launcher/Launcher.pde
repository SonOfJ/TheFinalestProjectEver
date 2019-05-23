void setup() {
  size(1600, 900);
  background(0, 0, 150);
  Maze m = new Maze();
  Node index = m.start();
  Node begin = m.start();
  for (int i = 0; i < 18; i = i + 1) {
    index = begin;
    for (int j = 0; j < 32; j = j + 1) {
      if (index.canWalk()) {
        index.display();
        if (index.hasDot()) {
          index.getDot().display();
        }
      }
      if (index.hasRight()) {
        index = index.right();
      }
    }
    if (begin.hasDown()) {
      begin = begin.down();
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

  
