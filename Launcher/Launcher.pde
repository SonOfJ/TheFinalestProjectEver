ArrayList<Displayable> thingsToDisplay; //This will contain the nodes and dots.
ArrayList<Displayable> movingDisplay; //This special list will contain ghosts.
ArrayList<Moveable> thingsToMove; //This will contain ghosts.
Pacman p;
PImage[] pImages; //Images for the four different states of Pac-Man.
int points; //Number of dots eaten by Pac-Man.
int lives; //Number of hits Pac-Man can take.
int lastFrame;
int totalDots;
boolean startingScreen;
boolean instructionsScreen;
boolean playingScreen; //If true, the game is still running.
boolean pausingScreen;
boolean gameOverScreen;
boolean winningScreen;
void setup() {
  size(1200, 675);
  startingScreen = true;
  thingsToDisplay = new ArrayList<Displayable>();
  movingDisplay = new ArrayList<Displayable>();
  thingsToMove = new ArrayList<Moveable>();
  Maze m = new Maze(); //Add the nodes to ArrayList for display.
  Node index = m.start; 
  Node begin = m.start;
  for (int i = 0; i < 18; i = i + 1) {
    index = begin;
    for (int j = 0; j < 32; j = j + 1) {
      if (index.path) { //Differentiate between nodes that are walkable and nodes that are not walkable.
        thingsToDisplay.add(index);
        if (index.hasDot) { //If the node has a dot, add that to the ArrayList for display too.
          thingsToDisplay.add(index.d);
          totalDots = totalDots + 1;
        }
        if (index.pacmanHere) {
          p = new Pacman(index, index.x, index.y); //Create the Pac-Man.
        }
        if (index.ghostHere) { //Add ghosts to the special ArrayList for display and to the ArrayList for move.
          Ghost g = new Ghost(index, index.x, index.y); //Create the ghost.
          movingDisplay.add(g);
          thingsToMove.add(g);
        }
      }
      if (index.hasRight()) {
        index = index.right;
      }
    }
    if (begin.hasDown()) {
      begin = begin.down;
    }
  }
  lives = 3; //Initial number of lives for Pac-Man.
  pImages = new PImage[4]; //Array for containing the images for the states of Pac-Man.
  pImages[0] = loadImage("pacmanUp.png");
  pImages[1] = loadImage("pacmanDown.png");
  pImages[2] = loadImage("pacmanLeft.png");
  pImages[3] = loadImage("pacmanRight.png");
  playingScreen = true; //The game is running.
}
void draw() {
  if (startingScreen) {
    startingScreen();
  }
  if (instructionsScreen) {
    instructionsScreen();
  }
  if (playingScreen) {
    background(0, 0, 150);
    for (Displayable thing : thingsToDisplay) { //Display what is displayable.
      thing.display();
    }
    for (Displayable thing : movingDisplay) { //Display ghosts after nodes and dots.
      thing.display();
    }
    p.display(); //Display Pac-Man.
    for (Moveable thing : thingsToMove) { 
      thing.move();
    }
    pointsLives(); //Display the number of points and the number of lives.
    pacManDamage(); //Update damage.
  }
  if (pausingScreen) {
    pausingScreen();
  }
  if (gameOverScreen) { //If the game is no longer running...
    gameOverScreen();
  }
  if (winningScreen) {
    winningScreen();
  }
}
void startingScreen() {
  background(0, 0, 0);
  PImage logoimg = loadImage("pacmanlogo.png");
  image(logoimg, 0, 0, 1200, 324.344112264);
  rectMode(CENTER);
  fill(120, 0, 120);
  rect(600, 390, 610, 100);
  rect(600, 540, 610, 100);
  textSize(80);
  textAlign(CENTER);
  if (mouseX >= 295 && mouseX <= 905 && mouseY >= 340 && mouseY <= 440) {
    fill(255, 255, 255);
  } else {
    fill(0, 0, 0);
  }
  text("START", 600, 420);
  if (mouseX >= 295 && mouseX <= 905 && mouseY >= 490 && mouseY <= 590) {
    fill(255, 255, 255);
  } else {
    fill (0, 0, 0);
  }
  text("INSTRUCTIONS", 600, 570);
}
void instructionsScreen() {
}
void pausingScreen() {
  if (looping) {
    noLoop();
  } else {
    loop();
  }
  textSize(150);
  noStroke();
  fill(255, 255, 255);
  textAlign(CENTER);
  text("PAUSED", 800, 450);
}
void winScreen() {
  background(0, 0, 0);
  PImage img = loadImage("win.png");
  image(img, 160, 0);
}
void gameOverScreen() {
  background(0, 0, 0);
  PImage img = loadImage("gameOver.png");
  image(img, 0, 0, 1600, 900);
}
void mousePressed() {
  if (startingScreen) {
    if (mouseX >= 295 && mouseX <= 905 && mouseY >= 340 && mouseY <= 440) {
      startingScreen = true;
    }
    if (mouseX >= 295 && mouseX <= 905 && mouseY >= 490 && mouseY <= 590) {
      instructionsScreen = true;
    }
  }
}
void keyPressed() { //Reads the input of keys.
  if (key == 'p' && playingScreen) {
    playingScreen = false;
    pausingScreen = true;
  }
  if (frameCount - lastFrame >= 10) { //This limits Pac-Man's movement speed and maintains game balance.
    if (key == 'w') {
      p.img = pImages[0]; //Load the image for facing up.
      if (p.currentNode.hasUp() && p.currentNode.up.path) { //If there is a node and it is walkable...
        p.currentNode = p.currentNode.up; //Get a new node.
        if (p.eat()) { //If there is a dot, remove it.
          points = points + 1; //Gain points.
          if (points == totalDots) {
            winScreen();
          }
        }
        p.y = p.y - 37.5; //Move the display coordinate.
      }
      lastFrame = frameCount;
    }
    if (key == 's') {
      p.img = pImages[1]; //Load the image for facing down.
      if (p.currentNode.hasDown() && p.currentNode.down.path) { //If there is a node and it is walkable...
        p.currentNode = p.currentNode.down; //Get a new node.
        if (p.eat()) { //If there is a dot, remove it.
          points = points + 1; //Gain points.
        }
        p.y = p.y + 37.5; //Move the display coordinate.
      }
      lastFrame = frameCount;
    }
    if (key == 'a') {
      p.img = pImages[2]; //Load the image for facing left.
      if (p.currentNode.hasLeft() && p.currentNode.left.path) { //If there is a node and it is walkable...
        p.currentNode = p.currentNode.left; //Get a new node.
        if (p.eat()) { //If there is a dot, remove it.
          points = points + 1; //Gain points.
        }
        p.x = p.x - 37.5; //Move the display coordinate.
      }
      lastFrame = frameCount;
    }
    if (key == 'd') { 
      p.img = pImages[3]; //Load the image for facing right.
      if (p.currentNode.hasRight() && p.currentNode.right.path) { //If there is a node and it is walkable...
        p.currentNode = p.currentNode.right; //Get a new node.
        if (p.eat()) { //If there is a dot, remove it.
          points = points + 1; //Gain points.
        }
        p.x = p.x + 37.5; //Move the display coordinate.
      }
      lastFrame = frameCount;
    }
  }
}
void pointsLives() { //Function for displaying points and lives. 
  textSize(32);
  fill(255, 255, 255);
  text(points, 150, 150);
  text("points", 100, 100);
  text(lives, 150, 250);
  text("lives", 100, 200);
}
void pacManDamage() { //Function for processing damage taken by Pac-Man.
  if (frameCount - lastFrame >= 10) {
    if (p.currentNode.ghostHere) {
      lives = lives - 1;
      lastFrame = frameCount;
    }
    if (lives == 0) {
      playingScreen = false;
      gameOverScreen = true;
    }
  }
}
