import java.util.*;
import java.io.*;
interface Displayable {
  void display();
}
interface Moveable {
  void move();
}
ArrayList<Displayable> thingsToDisplay;
ArrayList<Moveable> thingsToMove;
void setup() {
  loadImgs();
  size(1200, 900);
  thingsToDisplay = new ArrayList<Displayable>();
  thingsToMove = new ArrayList<Moveable>();
  Maze m = new Maze();
  Node index = m.start();
  Node begin = m.start();
  int x = 0;
  int y = 0;
  while (index.hasDown()) {
    if (index.hasUp()) {
      index = index.down();
      begin = begin.down();
      y = y + 15;
    }
    if (index.canWalk()) {
      fill(0);
      rect(x, y, 15, 15);
    }
    while (index.hasRight()) {
      index = index.right();
      x = x + 15;
      if (index.canWalk()) {
        fill(0);
        rect(x, y, 15, 15);
      }
    }
    index = begin;
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

  
