ArrayList<Displayable> thingsToDisplay;
ArrayList<Displayable> movingDisplay;
ArrayList<Moveable> thingsToMove;
Pacman p;
PImage[] pImages;
int points;
int lives;
boolean gamePlay;
int lastFrame;
boolean startGame;
void setup() {
  size(1600, 900);
  startGame = false;
  thingsToDisplay = new ArrayList<Displayable>();
  thingsToMove = new ArrayList<Moveable>();
  movingDisplay = new ArrayList<Displayable>();
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
        }
        if (index.ghostHere()) {
          Ghost g = new Ghost(index, index.x, index.y);
          movingDisplay.add(g);
          thingsToMove.add(g);
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
  lives = 3;
  pImages = new PImage[4];
  pImages[0] = loadImage("pacmanUp.png");
  pImages[1] = loadImage("pacmanDown.png");
  pImages[2] = loadImage("pacmanLeft.png");
  pImages[3] = loadImage("pacmanRight.png");
  gamePlay = true;
  startGame = false;
}
void draw() {
  if(!startGame){
    startScreen();
  }else{
    clear();
    pointsLives();
    for (Displayable thing : thingsToDisplay) {
      thing.display();
    }
    for (Displayable thing : movingDisplay) {
      thing.display();
    }
    p.display();
    for (Moveable thing : thingsToMove) {
      thing.move();
    }
    pacManDamage();
    if (!gamePlay) {
      clear();
      textSize(100);
      fill(255, 0, 0);
      text("GAME OVER", 400, 300);
    }
  }
}

void startScreen(){
  background(0,0,0);
  PImage logoimg = loadImage("pacmanlogo.png");
  image(logoimg, 400, 100, 820, 222);
}

void pointsLives(){
 background(0, 0, 150);
  textSize(32);
  fill(0, 0, 150);
  noStroke();
  rect(100, 100, 100, 100);
  fill(255, 255, 255);
  text(points, 150, 150);
  text("points", 100, 100);
  text(lives, 150, 250);
  text("lives", 100, 200); 
}
void keyPressed() {
  if(key == ' '){
    startGame = true;
  }
  if (frameCount - lastFrame >= 10) {
    if (key == 'w') {
      p.img = pImages[0];
      if (p.currentNode.hasUp() && p.getNode().up().canWalk()) {
        p.currentNode = p.currentNode.up();
        if (p.eat()) {
          points += 1;
        }
        p.y = p.y - 50;
      }
      lastFrame = frameCount;
    }
    if (key == 's') {
      p.img = pImages[1];
      if (p.currentNode.hasDown() && p.getNode().down().canWalk()) {
        p.currentNode = p.currentNode.down();
        if (p.eat()) {
          points += 1;
        }
        p.y = p.y + 50;
      }
      lastFrame = frameCount;
    }
    if (key == 'a') {
      p.img = pImages[2];
      if (p.currentNode.hasLeft() && p.getNode().left().canWalk()) {
        p.currentNode = p.currentNode.left();
        if (p.eat()) {
          points += 1;
        }
        p.x = p.x - 50;
      }
      lastFrame = frameCount;
    }
    if (key == 'd') {
      p.img = pImages[3];
      if (p.currentNode.hasRight() && p.getNode().right().canWalk()) {
        p.currentNode = p.currentNode.right();
        if (p.eat()) {
          points += 1;
        }
        p.x = p.x + 50;
      }
      lastFrame = frameCount;
    }
  }
}

void pacManDamage(){
  if (frameCount - lastFrame >= 10) {
    if (p.getNode().ghostHere()) {
        //p.damage();
        lives -= 1;
        lastFrame = frameCount;
      }
     if (lives < 0) {
       gamePlay = false;
     }
  }
}
