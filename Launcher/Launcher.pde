void setup() {
  size(1600, 900);
  Maze m = new Maze();
  Node index = m.start();
  Node begin = m.start();
  int x = 0;
  int y = 0;
  while (index.hasDown()) {
    if (index.hasUp()) {
      index = index.down();
      begin = begin.down();
      y = y + 50;
    }
    if (index.canWalk()) {
      fill(0);
      rect(x, y, 50, 50);
    }
    while (index.hasRight()) {
      index = index.right();
      x = x + 50;
      if (index.canWalk()) {
        fill(0);
        rect(x, y, 50, 50);
      }
    }
    //FIX THIS.
  }
}
/*void loadImgs(){
  pacImgs = loadImage("pacman.png");
  ghost1img = loadImage("ghost1.png");
  ghost2img = loadImage("ghost1.png");
  ghost3img = loadImage("ghost1.png");
  ghost4img = loadImage("ghost1.png");
}


void draw(){
  
}*/

  
