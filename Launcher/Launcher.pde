ArrayList<Displayable> thingsToDisplay; //This will contain the nodes and dots.
ArrayList<Displayable> movingDisplay; //This special list will contain ghosts.
ArrayList<Moveable> thingsToMove; //This will contain ghosts.
Pacman p;//PacMan object
PImage[] pImages; //Images for the four different states of Pac-Man.
int points;//number of dots eaten
int totPoints; //Number of dots needed to be eaten.
int lives; //Number of hits Pac-Man can take.
int lastFrame;//used to control speed of game
int ticks;//used to control speed of game
boolean playing; //If true, the game is still running.
boolean validMap;//checks if map is valid
char dir;//keeps track of direction (WASD)
char mode;
void setup() {//set screen size and load images
  size(1200, 700);
  pImages = new PImage[4]; //Array for containing the images for the states of Pac-Man.
  pImages[0] = loadImage("pacmanUp.png");//PacMan facing up
  pImages[1] = loadImage("pacmanDown.png");//PacMan facing down
  pImages[2] = loadImage("pacmanLeft.png");//PacMan facing left
  pImages[3] = loadImage("pacmanRight.png");//PacMan facing right
  load();
}
void load() {
  totPoints = 0;
  thingsToDisplay = new ArrayList<Displayable>();//PacMan, Ghosts, Dots, Nodes
  movingDisplay = new ArrayList<Displayable>();//separate ArrayLists for Ghosts
  thingsToMove = new ArrayList<Moveable>();//separate ArrayLists for Ghosts
  Maze m = new Maze(); //Add the nodes to ArrayList for display.
  if (m.pacValid && m.dotValid) {//checks if PacMan and Dots are valid
    validMap = true;//set boolean to true
  }
  Node index = m.start;//Keep track of start of map
  Node begin = m.start;
  for (int i = 0; i < 18; i = i + 1) {
    index = begin;
    for (int j = 0; j < 32; j = j + 1) {
      if (index.path) { //Differentiate between nodes that are walkable and nodes that are not walkable.
        thingsToDisplay.add(index);
        if (index.hasDot) { //If the node has a dot, add that to the ArrayList for display too.
          thingsToDisplay.add(index.d);
          totPoints = totPoints + 1;
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
  points = 0;//start out with 0 points
  ticks = 0;//will start ticking once game starts
  dir = '\u0000';
  mode = 'e';
}
void draw() {//create the visuals of the game
  if (validMap) {//only display the maze for a valid map
    if (playing) {//game is still being played. game is not over yet
      background(0, 0, 150);//royal blue background
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
      fill(255, 255, 255); //Display the number of points and the number of lives.
      rect(0, 675, 1200, 25);
      textAlign(LEFT);
      textSize(33);
      fill(0, 0, 0);
      text("POINTS: " + points, 0, 700);//points counter
      text("LIVES: " + lives, 400, 700);//lives counter
      pacManDamage();//PacMan takes damage from ghost
      pacManPoints();//points counter
      if (ticks > 0) {
        if (dir == 'w') {//up
          p.y = p.y - 3.75;
        }
        if (dir == 's') {//down
          p.y = p.y + 3.75;
        }
        if (dir == 'a') {//left
          p.x = p.x - 3.75;
        }
        if (dir == 'd') {//right
          p.x = p.x + 3.75;
        }
        ticks = ticks - 1;
      }
    } else if (lives != 0 && points != totPoints) {//continue gameplay
      startingScreen();
    } else if (lives == 0) {//no lives left
      gameOverScreen();//game over
    } else {
      winningScreen();//won the game
    }
  } else {//not a valid map
    background(0, 0, 0);//black background
    textSize(100);
    textAlign(CENTER);
    fill(255, 255, 255);
    text("INVALID MAP", 600, 370);
  }
}
void startingScreen() {
  background(0, 0, 0);
  PImage logoimg = loadImage("pacmanlogo.png");//load PacMan logo image
  image(logoimg, 0, 0, 1200, 324.344112264);
  textSize(50);
  textAlign(CENTER);//center instructions
  fill(255, 255, 255);
  text("PRESS SPACE TO START", 600, 470);//instructions on how to start game
  textSize(25);
  fill(153);
  if (mode == 'e') {//easy difficulty level
    text("MEDIUM", 600, 610);//visuals
    text("HARD", 900, 610);//visuals
    fill(255, 255, 255);//visuals
    text("EASY", 300, 610);//visuals
  }
  if (mode == 'm') {//medium difficulty level
    text("EASY", 300, 610);//visuals
    text("HARD", 900, 610);//visuals
    fill(255, 255, 255);//visuals
    text("MEDIUM", 600, 610);//visuals
  }
  if (mode == 'h') {//hard difficulty level
    text("EASY", 300, 610);//visuals
    text("MEDIUM", 600, 610);//visuals
    fill(255, 255, 255);//visuals
    text("HARD", 900, 610);//visuals
  }
}
void pausingScreen() {//game is paused
  textSize(150);
  fill(255, 255, 255);
  textAlign(CENTER);
  text("PAUSED", 600, 300);
  textSize(50);
  text("PRESS SPACE TO RESTART", 600, 450);//instructions on how to resume game
}
void winningScreen() {//winning screen
  background(0, 0, 0);
  PImage img = loadImage("win.png");//image to display
  image(img, 0, 100, 1200, 382.5);
  textSize(50);
  textAlign(CENTER);
  fill(255, 255, 255);
  text("PRESS SPACE TO PLAY AGAIN", 600, 600);//can play game again
}
void gameOverScreen() {//game over screen
  background(0, 0, 0);
  PImage img = loadImage("gameOver.png");//image to be displayed
  image(img, 100, 0, 1000, 562.5);
  textSize(50);
  textAlign(CENTER);
  fill(255, 255, 255);
  text("PRESS SPACE TO TRY AGAIN", 600, 625);
}
void keyPressed() { //Reads the input of keys.
  if (key == ' ') {//space bar
    if (!playing) {
      if (lives != 0 && points != totPoints) {
        playing = true;
        load();//loads the map and starts game
      } else {
        load();
      }
    } else if (!looping) {
      loop();
      playing = false;
      load();
    }
  }
  if (key == 'p' && playing && validMap) {
    if (looping) {
      noLoop();
      pausingScreen();
    } else {
      loop();
    }
  }
  if (frameCount - lastFrame >= 10) { //This limits Pac-Man's movement speed and maintains game balance.
    if (key == 'w') {//up direction
      p.img = pImages[0]; //Load the image for facing up.
      if (p.currentNode.hasUp() && p.currentNode.up.path) { //If there is a node and it is walkable...
        p.currentNode = p.currentNode.up; //Get a new node.
        dir = 'w';
        ticks = 10;
      }
      lastFrame = frameCount;
    }
    if (key == 's') {//down direction
      p.img = pImages[1]; //Load the image for facing down.
      if (p.currentNode.hasDown() && p.currentNode.down.path) { //If there is a node and it is walkable...
        p.currentNode = p.currentNode.down; //Get a new node.
        dir = 's';
        ticks = 10;
      }
      lastFrame = frameCount;
    }
    if (key == 'a') {//left direction
      p.img = pImages[2]; //Load the image for facing left.
      if (p.currentNode.hasLeft() && p.currentNode.left.path) { //If there is a node and it is walkable...
        p.currentNode = p.currentNode.left; //Get a new node.
        dir = 'a';
        ticks = 10;
      }
      lastFrame = frameCount;
    }
    if (key == 'd') {//right direction
      p.img = pImages[3]; //Load the image for facing right.
      if (p.currentNode.hasRight() && p.currentNode.right.path) { //If there is a node and it is walkable...
        p.currentNode = p.currentNode.right; //Get a new node.
        dir = 'd';
        ticks = 10;
      }
      lastFrame = frameCount;
    }
  }
}
void mousePressed() {//user clicks on difficulty level
  if (!playing && lives != 0 && points != totPoints) {
    if (mouseY >= 575 && mouseY <= 625) {
      if (mouseX >= 225 && mouseX <= 375) {//use mouse coordinates to determine which difficulty the user chose
        mode = 'e';//easy
      }
      if (mouseX >= 525 && mouseX <= 675) {//use mouse coordinates to determine which difficulty the user chose
        mode = 'm';//medium
      }
      if (mouseX >= 825 && mouseX <= 975) {//use mouse coordinates to determine which difficulty the user chose
        mode = 'h';//hard
      }
    }
  }
}
void pacManDamage() { //Function for processing damage taken by Pac-Man.
  if (frameCount - lastFrame >= 10) {//controls speed of game
    if (p.currentNode.ghostHere) {//touches ghost
      lives = lives - 1;//take damage. lose one life
      lastFrame = frameCount;
    }
    if (lives == 0) {//lost all lives
      playing = false;//game is over. no longer playing
    }
  }
}
void pacManPoints() {//PacMan eats Dots
  if (frameCount - lastFrame >= 10) {
    if (p.eat()) {//eat dot
      points = points + 1;//points counter increases by one
      lastFrame = frameCount;
    }
    if (points == totPoints) {//check if player has eaten all the dots...
      playing = false;//...if so, game is over
    }
  }
}
