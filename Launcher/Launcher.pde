ArrayList<Displayable> thingsToDisplay; //This will contain the nodes and dots.
ArrayList<Displayable> movingDisplay; //This special list will contain ghosts.
ArrayList<Moveable> thingsToMove; //This will contain ghosts.
Pacman p;
PImage[] pImages; //Images for the four different states of Pac-Man.
int points; //Number of dots eaten by Pac-Man.
int lives; //Number of hits Pac-Man can take.
int lastFrame;
boolean gamePlay; //If true, the game is still running.
void setup() {
  size(1600, 900);
  thingsToDisplay = new ArrayList<Displayable>();
  movingDisplay = new ArrayList<Displayable>();
  thingsToMove = new ArrayList<Moveable>();
  Maze m = new Maze(); //Add the nodes to ArrayList for display.
  Node index = m.start(); 
  Node begin = m.start();
  for (int i = 0; i < 18; i = i + 1) {
    index = begin;
    for (int j = 0; j < 32; j = j + 1) {
      if (index.canWalk()) { //Differentiate between nodes that are walkable and nodes that are not walkable.
        thingsToDisplay.add(index);
        if (index.hasDot()) { //If the node has a dot, add that to the ArrayList for display too.
          thingsToDisplay.add(index.getDot());
        }
        if (index.pacmanHere()) {
          p = new Pacman(index, index.getX(), index.getY()); //Create the Pac-Man.
        }
        if (index.ghostHere()) { //Add ghosts to the special ArrayList for display and to the ArrayList for move.
          Ghost g = new Ghost(index, index.x, index.y); //Create the ghost.
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
  lives = 3; //Initial number of lives for Pac-Man.
  pImages = new PImage[4]; //Array for containing the images for the states of Pac-Man.
  pImages[0] = loadImage("pacmanUp.png");
  pImages[1] = loadImage("pacmanDown.png");
  pImages[2] = loadImage("pacmanLeft.png");
  pImages[3] = loadImage("pacmanRight.png");
  gamePlay = true; //The game is running.
}
void draw() {
  pointsLives(); //Display the number of points and the number of lives.
  for (Displayable thing : thingsToDisplay) { //Display what is displayable.
    thing.display();
  }
  for (Displayable thing : movingDisplay) { //Display ghosts after nodes and dots.
    thing.display();
  }
  p.display(); //Display Pac-Man.
  for (Moveable thing : thingsToMove) { //Move ghosts.
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

void pointsLives() {
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

void pacManDamage() {
  if (frameCount - lastFrame >= 10) {
    if (p.getNode().ghostHere()) {
      //p.damage();
      lives -= 1;
      lastFrame = frameCount;
    }
    if (lives == 0) {
      gamePlay = false;
    }
  }
}
