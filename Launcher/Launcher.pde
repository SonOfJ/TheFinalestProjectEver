ArrayList<Displayable> thingsToDisplay;
ArrayList<Moveable> thingsToMove;
Pacman p;
void setup() {
  size(1600, 900);
  thingsToDisplay = new ArrayList<Displayable>();
  thingsToMove = new ArrayList<Moveable>();
  Maze m = new Maze();
  Node index = m.start();
  Node begin = m.start();
  for (int i = 0; i < 18; i = i + 1) {
    index = begin;
    for (int j = 0; j < 32; j = j + 1) {
      if (index.canWalk()) {
        thingsToDisplay.add(index);
        if (index.hasDot()) {
          thingsToDisplay.add(index.getDot());
        }
        if (index.pacmanHere()) {
          index.getPac().img = loadImage("pacmanRight.png");
          thingsToDisplay.add(index.getPac());
        }
        if (index.ghostHere()) {
          index.getGhost().img = loadImage("ghost" + ((int)random(3) + 1) + ".png");
          thingsToDisplay.add(index.getGhost());
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
void draw() {
  background(0, 0, 150);
  for (Displayable thing : thingsToDisplay) {
    thing.display();
  }
  for (Moveable thing : thingsToMove) {
    thing.move();
  }
}
void keyPressed() {
  if (key == 'w') {
    p.setDir("UP");
    p.move();
    //println("going up");
    //println(p.getX());
    //println(p.getY());
  }
  if (key == 's') {
    p.setDir("DOWN");
    p.move();
    //println("going down");
    //println(p.getX());
    //println(p.getY());
  }
  if (key == 'a') {
    p.setDir("LEFT");
    p.move();
    //println("going left");
    //println(p.getX());
    //println(p.getY());
  }
  if (key == 'd') {
    p.setDir("RIGHT");
    p.move();
    //println("going right");
    //println(p.getX());
    //println(p.getY());
  }
}
