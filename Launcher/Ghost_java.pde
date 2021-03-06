class Ghost implements Displayable, Moveable {
  PImage img;//image to be displayed
  Node currentNode; //Node the Ghost is on.
  float x;//x cor
  float y;//y cor
  int lastFrame;//keeps track of speed of game
  int ticks;//keeps track of speed of game
  char facing;//direction
  int frameDiff;
  float dist;
  Ghost(Node newCurrent, float newX, float newY) {
    img = loadImage("ghost" + ((int)random(3) + 1) + ".png"); //Randomly choose ghost image.
    currentNode = newCurrent;//set currentNode
    x = newX;//set x
    y = newY;//set y
    if (mode == 'e') {//easy difficulty level
      frameDiff = 20;//slow movement
      dist = 3.75 / 2;//slow movement
    }
    if (mode == 'm') {//medium difficulty level
      frameDiff = 10;//slightly faster movement
      dist = 3.75;//slightly faster movement
    }
    if (mode == 'h') {//hard difficulty level
      frameDiff = 5;//moving very fast
      dist = 3.75 * 2;//moving very fast
    }
  }
  void display() {//display the ghost
    image(img, x, y, 37.5, 37.5);
  }
  void move() {//ghost movement
    if (frameCount - lastFrame >= frameDiff) {
      ArrayList<Character> dir = new ArrayList<Character>(); //This ArrayList will contain all the possible directions the ghost can move in.
      if (currentNode.hasUp() && currentNode.up.path) {
        dir.add('w');//up
      }
      if (currentNode.hasDown() && currentNode.down.path) {
        dir.add('s');//down
      }
      if (currentNode.hasLeft() && currentNode.left.path) {
        dir.add('a');//left
      }
      if (currentNode.hasRight() && currentNode.right.path) {
        dir.add('d');//right
      }
      facing = dir.get((int)random(dir.size())); //Randomly choose a direction out of the ArrayList of possible directions.
      if (facing == 'w') {//facing up
        currentNode.removeGhost(); //The current node should no longer have a ghost.
        currentNode.up.addGhost(); //The node on top should have a ghost.
        currentNode = currentNode.up; //Get new node.
        ticks = frameDiff;
        lastFrame = frameCount;
      }
      if (facing == 's') {//facing down
        currentNode.removeGhost(); //The current node should no longer have a ghost.
        currentNode.down.addGhost(); //The node on bottom should have a ghost.
        currentNode = currentNode.down; //Get new node.
        ticks = frameDiff;
        lastFrame = frameCount;
      }
      if (facing == 'a') {//facing left
        currentNode.removeGhost(); //The current node should no longer have a ghost.
        currentNode.left.addGhost(); //The node on the left should have a ghost.
        currentNode = currentNode.left; //Get new node.
        ticks = frameDiff;
        lastFrame = frameCount;
      }
      if (facing == 'd') {//facing right
        currentNode.removeGhost(); //The current node should no longer have a ghost.
        currentNode.right.addGhost(); //The node on the left should have a ghost.
        currentNode = currentNode.right; //Get new node.
        ticks = frameDiff;
        lastFrame = frameCount;
      }
    }
    if (ticks > 0) {
      if (facing == 'w') {
        y = y - dist; //Move upwards.
      }
      if (facing == 's') {
        y = y + dist; //Move downwards.
      }
      if (facing == 'a') {
        x = x - dist; //Move to the left.
      }
      if (facing == 'd') {
        x = x + dist; //Move to the right.
      }
      ticks = ticks - 1;
    }
  }
}
