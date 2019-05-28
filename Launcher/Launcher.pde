ArrayList<Displayable> thingsToDisplay;
ArrayList<Moveable> thingsToMove;
Pacman p;
PImage[] pImages;
int points;
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
          p = new Pacman(index, index.getX(), index.getY());
          p.img = loadImage("pacmanRight.png");
        }
        if (index.ghostHere()) {
          index.getGhost().img = loadImage("ghost" + ((int)random(3) + 1) + ".png");
          thingsToDisplay.add(index.getGhost());
          thingsToMove.add(index.getGhost());
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
  pImages = new PImage[4];
  pImages[0] = loadImage("pacmanUp.png");
  pImages[1] = loadImage("pacmanDown.png");
  pImages[2] = loadImage("pacmanLeft.png");
  pImages[3] = loadImage("pacmanRight.png");
}
void draw() {
  background(0, 0, 150);
  textSize(32);
  fill(0,0,150);
  noStroke();
  rect(100,100, 100, 100);
  fill(255,255,255);
  text(points, 150, 150);
  text("points", 100, 100);
  for (Displayable thing : thingsToDisplay) {
    thing.display();
  }
  p.display();
  for (Moveable thing : thingsToMove) {
    thing.move();
  }
}
void keyPressed() {
  if (key == 'w') {
    p.img = pImages[0];
    if (p.currentNode.hasUp() && p.getNode().up().canWalk()) {
      p.currentNode = p.currentNode.up();
      if(p.eat()){
        points += 1;
      }
      p.y = p.y - 50;
    }
  }
  if (key == 's') {
    p.img = pImages[1];
    if (p.currentNode.hasDown() && p.getNode().down().canWalk()) {
      p.currentNode = p.currentNode.down();
      if(p.eat()){
        points += 1;
      }
      p.y = p.y + 50;
    }
  }
  if (key == 'a') {
    p.img = pImages[2];
    if (p.currentNode.hasLeft() && p.getNode().left().canWalk()) {
      p.currentNode = p.currentNode.left();
      if(p.eat()){
        points += 1;
      }
      p.x = p.x - 50;
    }
  }
  if (key == 'd') {
    p.img = pImages[3];
    if (p.currentNode.hasRight() && p.getNode().right().canWalk()) {
      p.currentNode = p.currentNode.right();
      if(p.eat()){
        points += 1;
      }
      p.x = p.x + 50;
    }
  }
}
